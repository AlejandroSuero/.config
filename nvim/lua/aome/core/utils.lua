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
          end, 0)
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
  theme = vim.g.colorscheme,
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
  print("added_pattern: " .. added_pattern)
  print("new: " .. new)
  print("old: " .. old)
  if file == nil then
    vim.notify("Config file not found", vim.log.levels.ERROR)
    return
  end
  local new_content = file:read("*all"):gsub(added_pattern, new)
  print("new_content: " .. new_content)

  file = io.open(options, "w")
  file:write(new_content)
  file:close()
end

--- List all the themes in the base46/hl_themes directory and self/colorscheme directory
---@return string[] default_themes Names of all the configured themes
M.list_themes = function()
  local default_themes = vim.fn.readdir(
    vim.fn.stdpath "data" .. "/lazy/base46.nvim/lua/base46/hl_themes"
  )

  local custom_themes =
    vim.loop.fs_stat(vim.fn.stdpath "config" .. "/lua/aome/colorschemes")

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

--- Reloads the selected colorscheme
---@param colorscheme string Name of the colorscheme you want to reload
M.reload_colorscheme = function(colorscheme)
  vim.g.colorscheme = colorscheme
  require("base46").load_theme {
    theme = colorscheme,
    transparency = vim.g.transparency,
  }
end

return M
