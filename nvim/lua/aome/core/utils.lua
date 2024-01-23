---@meta

local M = {}

local merge_tb = vim.tbl_deep_extend

M.load_config = function()
  local config = require "aome.core.default_config"
  local aomerc_path =
    vim.api.nvim_get_runtime_file("lua/aome/core/aomerc.lua", false)[1]

  if aomerc_path then
    local aomerc = dofile(aomerc_path)

    config.mappings = M.remove_disabled_keys(aomerc.mappings, config.mappings)
    config = merge_tb("force", config, aomerc)
    config.mappings.disabled = nil
  end

  return config
end

M.remove_disabled_keys = function(aomerc_mappings, default_mappings)
  if not aomerc_mappings then
    return default_mappings
  end

  -- store keys in a array with true value to compare
  local keys_to_disable = {}
  for _, mappings in pairs(aomerc_mappings) do
    for mode, section_keys in pairs(mappings) do
      if not keys_to_disable[mode] then
        keys_to_disable[mode] = {}
      end
      section_keys = (type(section_keys) == "table" and section_keys) or {}
      for k, _ in pairs(section_keys) do
        keys_to_disable[mode][k] = true
      end
    end
  end

  -- make a copy as we need to modify default_mappings
  for section_name, section_mappings in pairs(default_mappings) do
    for mode, mode_mappings in pairs(section_mappings) do
      mode_mappings = (type(mode_mappings) == "table" and mode_mappings) or {}
      for k, _ in pairs(mode_mappings) do
        -- if key if found then remove from default_mappings
        if keys_to_disable[mode] and keys_to_disable[mode][k] then
          default_mappings[section_name][mode][k] = nil
        end
      end
    end
  end

  return default_mappings
end

M.load_mappings = function(section, mapping_opt)
  vim.schedule(function()
    local function set_section_map(section_values)
      if section_values.plugin then
        return
      end

      section_values.plugin = nil

      for mode, mode_values in pairs(section_values) do
        local default_opts =
          merge_tb("force", { mode = mode }, mapping_opt or {})
        for keybind, mapping_info in pairs(mode_values) do
          -- merge default + user opts
          local opts = merge_tb("force", default_opts, mapping_info.opts or {})

          mapping_info.opts, opts.mode = nil, nil
          opts.desc = mapping_info[2]

          vim.keymap.set(mode, keybind, mapping_info[1], opts)
        end
      end
    end

    local mappings = require("aome.core.utils").load_config().mappings

    if type(section) == "string" then
      mappings[section]["plugin"] = nil
      mappings = { mappings[section] }
    end

    for _, sect in pairs(mappings) do
      set_section_map(sect)
    end
  end)
end

M.lazy_load = function(plugin)
  vim.api.nvim_create_autocmd({ "BufRead", "BufWinEnter", "BufNewFile" }, {
    group = vim.api.nvim_create_augroup("BeLazyOnFileOpen" .. plugin, {}),
    callback = function()
      local file = vim.fn.expand "%"
      local condition = file ~= "NvimTree_1" and file ~= "[lazy]" and file ~= ""

      if condition then
        vim.api.nvim_del_augroup_by_name("BeLazyOnFileOpen" .. plugin)

        -- dont defer for treesitter as it will show slow highlighting
        -- This deferring only happens only when we do "nvim filename"
        if plugin ~= "nvim-treesitter" then
          vim.schedule(function()
            require("lazy").load { plugins = plugin }

            if plugin == "nvim-lspconfig" then
              vim.cmd "silent! do FileType"
            end
          end)
        else
          require("lazy").load { plugins = plugin }
        end
      end
    end,
  })
end

-- Maps keys with options
---@param mappings_table table Table that contains the mappings
---@param mapping_opt table|nil that contains the mapping options
M.map_keys = function(mappings_table, mapping_opt)
  for mode, mappings in pairs(mappings_table) do
    local default_opts =
      vim.tbl_deep_extend("force", { mode = mode }, mapping_opt or {})

    for keybind, mapping_info in pairs(mappings) do
      if type(mapping_info) ~= "table" then
        mapping_info = { mapping_info }
      end
      local opts =
        vim.tbl_deep_extend("force", default_opts, mapping_info.opts or {})

      mapping_info.opts, opts.mode = nil, nil
      opts.desc = mapping_info[2] or "No description added"

      vim.keymap.set(mode, keybind, mapping_info[1], opts)
    end
  end
end

---@class default_coloscheme_opts
---@field base string
---@field theme string
---@field transparency boolean
M.default_coloscheme_opts = {
  base = "base46",
  theme = vim.g.base46,
  transparency = vim.g.transparency,
}

--- Replace old colorscheme for the new one
---@param old string Old colorscheme you want to change
---@param new string New colorscheme you want to change
M.replace_word = function(old, new)
  local options = vim.fn.stdpath "config"
    .. "/lua/aome/core/"
    .. "colorscheme.lua"
  local file = io.open(options, "r")
  local added_pattern = string.gsub(old, "-", "%%-") -- add % before - if exists
  if file == nil then
    vim.notify("Config file not found", vim.log.levels.ERROR)
    return
  end
  local new_content = file:read("*all"):gsub(added_pattern, new)

  file = io.open(options, "w")
  if file then
    file:write(new_content)
    file:close()
  end
end

--- List all the themes in the base46/hl_themes directory and self/colorscheme directory
---@return string[] default_themes Names of all the configured themes
M.list_themes = function()
  local default_themes =
    vim.fn.readdir(vim.fn.stdpath "data" .. "/lazy/base46/lua/base46/themes")

  local custom_themes =
    vim.uv.fs_stat(vim.fn.stdpath "config" .. "/lua/aome/colorschemes")

  if custom_themes and custom_themes.type == "directory" then
    local themes_tb =
      vim.fn.readdir(vim.fn.stdpath "config" .. "/lua/aome/colorschemes")
    for _, value in ipairs(themes_tb) do
      default_themes[#default_themes + 1] = value
    end
  end

  for index, theme in ipairs(default_themes) do
    default_themes[index] = theme:match "(.+)%..+"
  end

  return default_themes
end

---Splits the inputs string by the separator
---@param input string
---@param separator string|nil
---@return string[] t splitted from the separator
local split = function(input, separator)
  if separator == nil then
    separator = "%s"
  end
  local t = {}
  for str in string.gmatch(input, "([^" .. separator .. "]+)") do
    table.insert(t, str)
  end
  return t
end

--- Checks if colorscheme can be turned into base46 theme
---@param colorscheme string Name of the colorscheme
local check_base46 = function(colorscheme)
  local themes = M.list_themes()
  local arr_colorscheme = split(colorscheme, "-")
  local colorscheme_concat = ""
  for _, str in pairs(arr_colorscheme) do
    colorscheme_concat = colorscheme_concat .. str
  end
  colorscheme = colorscheme_concat

  for _, theme in pairs(themes) do
    if colorscheme:find(theme) then
      return true
    end
  end
  return false
end

---Converts from colorscheme to base46 naming
---Ex: rose-pine -> rosepine
---@param colorscheme string
---@return string|nil theme if found in the base46, otherwise nil
local colorscheme_to_base46 = function(colorscheme)
  local themes = M.list_themes()
  local arr_colorscheme = split(colorscheme, "-")
  local colorscheme_concat = ""
  for _, str in pairs(arr_colorscheme) do
    colorscheme_concat = colorscheme_concat .. str
  end
  colorscheme = colorscheme_concat

  for _, theme in pairs(themes) do
    if colorscheme:find(theme) then
      return theme
    end
  end
  return nil
end

--- Reloads the selected colorscheme
---@param colorscheme string Name of the colorscheme you want to reload
M.reload_colorscheme = function(colorscheme)
  if vim.g.theme == "base46" then
    if check_base46(colorscheme) then
      colorscheme = colorscheme_to_base46(colorscheme) or vim.g.base46
      if colorscheme == vim.g.base46 then
        M.replace_word('"colorscheme"', '"base46"')
        vim.g.theme = "base46"
        require("base46").load_theme {
          theme = colorscheme,
          transparency = vim.g.transparency,
        }
        return
      end
      M.replace_word('"' .. vim.g.base46 .. '"', '"' .. colorscheme .. '"')
      vim.g.base46 = colorscheme
      M.replace_word('"colorscheme"', '"base46"')
      vim.g.theme = "base46"
      require("base46").load_theme {
        theme = colorscheme,
        transparency = vim.g.transparency,
      }
    else
      M.replace_word('"' .. vim.g.colorscheme .. '"', '"' .. colorscheme .. '"')
      vim.g.colorscheme = colorscheme
      M.replace_word('"base46"', '"colorscheme"')
      vim.g.theme = "colorscheme"
      vim.cmd(":colorscheme " .. colorscheme)
    end
  else
    M.replace_word(vim.g.colorscheme, colorscheme)
    vim.g.colorscheme = colorscheme
    M.replace_word('"base46"', '"colorscheme"')
    vim.g.theme = "colorscheme"
    vim.cmd.colorscheme(colorscheme)
  end
end

-- https://github.com/EmmanuelOga/columns/blob/master/utils/color.lua

--- Converts an HSL color value to RGB. Conversion formula
--- adapted from http://en.wikipedia.org/wiki/HSL_color_space.
--- Assumes h, s, and l are contained in the set [0, 1] and
--- returns r, g, and b in the set [0, 255].
---
--- @param h number      The hue
--- @param s number      The saturation
--- @param l number      The lightness
--- @return number, number, number     # The RGB representation
function M.hslToRgb(h, s, l)
  --- @type number, number, number
  local r, g, b

  if s == 0 then
    r, g, b = l, l, l -- achromatic
  else
    --- @param p number
    --- @param q number
    --- @param t number
    local function hue2rgb(p, q, t)
      if t < 0 then
        t = t + 1
      end
      if t > 1 then
        t = t - 1
      end
      if t < 1 / 6 then
        return p + (q - p) * 6 * t
      end
      if t < 1 / 2 then
        return q
      end
      if t < 2 / 3 then
        return p + (q - p) * (2 / 3 - t) * 6
      end
      return p
    end

    --- @type number
    local q
    if l < 0.5 then
      q = l * (1 + s)
    else
      q = l + s - l * s
    end
    local p = 2 * l - q

    r = hue2rgb(p, q, h + 1 / 3)
    g = hue2rgb(p, q, h)
    b = hue2rgb(p, q, h - 1 / 3)
  end

  return r * 255, g * 255, b * 255
end

--- Converts an HSL color value to RGB in Hex representation.
--- @param  h number   The hue
--- @param  s number   The saturation
--- @param  l number   The lightness
--- @return   string   # The hex representation
function M.hslToHex(h, s, l)
  local r, g, b = M.hslToRgb(h / 360, s / 100, l / 100)

  return string.format("#%02x%02x%02x", r, g, b)
end

return M
