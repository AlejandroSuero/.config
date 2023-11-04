return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "AlejandroSuero/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  lazy = true,
  cmd = {
    "Telescope",
  },
  keys = {
    {
      "<leader>pf",
      "<cmd>Telescope find_files<cr>",
      desc = "Find project files",
    },
    { "<leader>gf", "<cmd>Telescope git_files<cr>", desc = "Find git files" },
    {
      "<leader>th",
      "<cmd>Telescope themes<cr>",
      desc = "Change base46 colorscheme",
    },
    {
      "<leader>cs",
      "<cmd>Telescope colorscheme<cr>",
      desc = "Change colorscheme",
    },
    { "<leader>km", "<cmd>Telescope keymaps<cr>", desc = "Show keymaps" },
    { "<leader>ht", "<cmd>Telescope help_tags<cr>", desc = "Show help tags" },
    { "<leader>cm", "<cmd>Telescope commands<cr>", desc = "Show commands" },
  },
  config = function()
    local ok, telescope = pcall(require, "telescope")
    if not ok then
      vim.notify("Telescope not loaded", 3)
    end

    local actions = require("telescope.actions")
    local action_state = require("telescope.actions.state")

    local reload_colorscheme = require("aome.core.utils").reload_colorscheme
    local type = "colorscheme"

    telescope.setup({
      defaults = {
        mappings = {
          i = {
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-t>"] = actions.select_tab,
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
          },
          n = {
            ["q"] = actions.close,
          },
        },
        file_ignore_patterns = {
          "node_modules/",
          "%.git/",
          "%.DS_Store$",
          "target/",
          "build/",
          "%.o$",
        },
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
          "--hidden",
        },
        layout_config = {
          prompt_position = "top",
          horizontal = {
            width_padding = 0.1,
            height_padding = 0.1,
            preview_width = 0.6,
          },
          vertical = {
            width_padding = 0.1,
            height_padding = 0.1,
            preview_height = 0.5,
          },
        },
        path_display = { "smart" },
        prompt_position = "top",
        prompt_prefix = " 󰍉 ",
        selection_caret = "  ",
        sorting_strategy = "ascending",
        winblend = 0,
        set_env = { ["COLORTERM"] = "truecolor" },
        border = {},
        borderchars = {
          "─",
          "│",
          "─",
          "│",
          "╭",
          "╮",
          "╯",
          "╰",
        },
        color_devicons = true,
      },
      pickers = {
        colorscheme = {
          prompt_prefix = " 󰏘 ",
          attach_mappings = function(prompt_bufnr, map)
            -- reload theme while typing
            vim.schedule(function()
              vim.api.nvim_create_autocmd("TextChangedI", {
                buffer = prompt_bufnr,
                callback = function()
                  if action_state.get_selected_entry() then
                    reload_colorscheme(
                      action_state.get_selected_entry()[1],
                      type
                    )
                  end
                end,
              })
            end)
            -- reload theme on cycling
            map("i", "<C-n>", function()
              actions.move_selection_next(prompt_bufnr)
              reload_colorscheme(action_state.get_selected_entry()[1], type)
            end)

            map("i", "<Down>", function()
              actions.move_selection_next(prompt_bufnr)
              reload_colorscheme(action_state.get_selected_entry()[1], type)
            end)

            map("i", "<C-j>", function()
              actions.move_selection_next(prompt_bufnr)
              reload_colorscheme(action_state.get_selected_entry()[1], type)
            end)

            map("i", "<C-p>", function()
              actions.move_selection_previous(prompt_bufnr)
              reload_colorscheme(action_state.get_selected_entry()[1], type)
            end)

            map("i", "<Up>", function()
              actions.move_selection_previous(prompt_bufnr)
              reload_colorscheme(action_state.get_selected_entry()[1], type)
            end)

            map("i", "<C-k>", function()
              actions.move_selection_previous(prompt_bufnr)
              reload_colorscheme(action_state.get_selected_entry()[1], type)
            end)

            ------------ save theme to chadrc on enter ----------------
            actions.select_default:replace(function()
              if action_state.get_selected_entry() then
                actions.close(prompt_bufnr)
                reload_colorscheme(action_state.get_selected_entry()[1], type)
              end
            end)
            return true
          end,
        },
        find_files = {
          prompt_prefix = " 󰈔 ",
          find_command = { "rg", "--files", "--ignore", "--hidden" },
        },
        git_files = {
          prompt_prefix = " 󰊢 ",
          show_untracked = true,
        },
        keymaps = {
          prompt_prefix = " 󰌌 ",
        },
        commands = {
          prompt_prefix = "  ",
        },
        help_tags = {
          prompt_prefix = " 󰞋 ",
        },
        grep_string = {
          prompt_prefix = " 󰬶 ",
        },
      },
      extensions = {
        fzf = {
          fuzzy = true, -- false will only do exact matching
          override_generic_sorter = true, -- override the generic sorter
          override_file_sorter = true, -- override the file sorter
          case_mode = "smart_case", -- or "ignore_case" or "respect_case"
        },
      },
    })

    telescope.load_extension("harpoon")
    telescope.load_extension("themes")

    local builtin = require("telescope.builtin")

    local mappings = {
      n = {
        -- find string
        ["<leader>ps"] = {
          function()
            builtin.grep_string({
              search = vim.fn.input("Grep -> "),
            })
          end,
          "Telescope grep string",
        },
      },
    }

    require("aome.core.utils").map_keys(mappings)
  end,
}
