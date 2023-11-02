---@meta

local M = {}

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
            local opts = vim.tbl_deep_extend(
                "force",
                default_opts,
                mapping_info.opts or {}
            )

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
    local options = vim.fn.stdpath("config")
        .. "/lua/aome/core/"
        .. "options.lua"
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
        vim.fn.stdpath("data") .. "/lazy/base46/lua/base46/hl_themes"
    )

    local custom_themes =
        vim.loop.fs_stat(vim.fn.stdpath("config") .. "/lua/colorschemes")

    if custom_themes and custom_themes.type == "directory" then
        local themes_tb =
            vim.fn.readdir(vim.fn.stdpath("config") .. "/lua/colorschemes")
        for _, value in ipairs(themes_tb) do
            default_themes[#default_themes + 1] = value
        end
    end

    for index, theme in ipairs(default_themes) do
        default_themes[index] = theme:match("(.+)%..+")
    end

    return default_themes
end

--- Reloads the selected colorscheme
---@param colorscheme string Name of the colorscheme you want to reload
M.reload_colorscheme = function(colorscheme)
    vim.g.colorscheme = colorscheme
    require("base46").load_theme({
        theme = colorscheme,
        transparency = vim.g.transparency,
    })
end

return M
