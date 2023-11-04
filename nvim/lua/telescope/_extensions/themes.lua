local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local previewers = require("telescope.previewers")
local conf = require("telescope.config").values
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

local replace_word = require("aome.core.utils").replace_word
local reload_theme = require("aome.core.utils").reload_colorscheme
local list_themes = require("aome.core.utils").list_themes
local type = "base46"

local function switcher()
  local bufnr = vim.api.nvim_get_current_buf()

  -- show current buffer content in previewer
  local previewer = previewers.new_buffer_previewer({
    define_preview = function(self, entry)
      -- add content
      local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
      vim.api.nvim_buf_set_lines(self.state.bufnr, 0, -1, false, lines)

      -- add syntax highlighting in previewer
      local ft = (vim.filetype.match({ buf = bufnr }) or "diff"):match("%w+")
      require("telescope.previewers.utils").highlighter(self.state.bufnr, ft)

      reload_theme(entry.value, type)
    end,
  })

  -- our picker function: colors
  local picker = pickers.new({
    prompt_title = " 󰏘 Change Theme ",
    previewer = previewer,
    finder = finders.new_table(list_themes()),
    sorter = conf.generic_sorter(),

    attach_mappings = function(prompt_bufnr, map)
      -- reload theme while typing
      vim.schedule(function()
        vim.api.nvim_create_autocmd("TextChangedI", {
          buffer = prompt_bufnr,
          callback = function()
            if action_state.get_selected_entry() then
              reload_theme(action_state.get_selected_entry()[1], type)
            end
          end,
        })
      end)
      -- reload theme on cycling
      map("i", "<C-n>", function()
        actions.move_selection_next(prompt_bufnr)
        reload_theme(action_state.get_selected_entry()[1], type)
      end)

      map("i", "<Down>", function()
        actions.move_selection_next(prompt_bufnr)
        reload_theme(action_state.get_selected_entry()[1], type)
      end)

      map("i", "<C-j>", function()
        actions.move_selection_next(prompt_bufnr)
        reload_theme(action_state.get_selected_entry()[1], type)
      end)

      map("i", "<C-p>", function()
        actions.move_selection_previous(prompt_bufnr)
        reload_theme(action_state.get_selected_entry()[1], type)
      end)

      map("i", "<Up>", function()
        actions.move_selection_previous(prompt_bufnr)
        reload_theme(action_state.get_selected_entry()[1], type)
      end)

      map("i", "<C-k>", function()
        actions.move_selection_previous(prompt_bufnr)
        reload_theme(action_state.get_selected_entry()[1], type)
      end)

      ------------ save theme to chadrc on enter ----------------
      actions.select_default:replace(function()
        if action_state.get_selected_entry() then
          actions.close(prompt_bufnr)
          reload_theme(action_state.get_selected_entry()[1], type)
        end
      end)
      return true
    end,
  })

  picker:find()
end

return require("telescope").register_extension({
  exports = { themes = switcher },
})
