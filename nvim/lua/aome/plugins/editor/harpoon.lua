return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local harpoon = require "harpoon"
    harpoon:setup()

    local mappings = {
      n = {
        ["<leader>a"] = {
          function()
            harpoon:list():append()
          end,
          "[Harpoon] Append current file to list",
        },
        ["<C-e>"] = {
          function()
            harpoon.ui:toggle_quick_menu(harpoon:list())
          end,
          "[Harpoon] Open quick menu",
        },
        ["<leader>hn"] = {
          function()
            harpoon:list():next()
          end,
          "[Harpoon] Navigate to next item",
        },
        ["<leader>hp"] = {
          function()
            harpoon:list():prev()
          end,
          "[Harpoon] Navigate to previous item",
        },
        ["<leader>1"] = {
          function()
            harpoon:list():select(1)
          end,
          "[Harpoon] Navigate to item 1",
        },
        ["<leader>2"] = {
          function()
            harpoon:list():select(2)
          end,
          "[Harpoon] Navigate to item 2",
        },
        ["<leader>3"] = {
          function()
            harpoon:list():select(3)
          end,
          "[Harpoon] Navigate to item 3",
        },
        ["<leader>4"] = {
          function()
            harpoon:list():select(4)
          end,
          "[Harpoon] Navigate to item 4",
        },
      },
    }
    require("aome.core.utils").map_keys(mappings)
  end,
}
