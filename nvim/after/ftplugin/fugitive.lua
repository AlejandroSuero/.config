local select_opts = { "Commit", "Pull", "Push", "Push -u", "Fetch" }
local select = function()
  vim.ui.select(select_opts, {
    prompt = "Vim-Fugitive options",
    format_item = function(item)
      if item == "Push -u" then
        return item .. " origin <branch> eg. (origin main)"
      end
      return item
    end,
  }, function(choice)
    if choice == nil then
      vim.notify("No choice selected", vim.log.levels.WARN)
      return
    end
    if choice == "Push -u" then
      local branch = vim.fn.input "Branch to push from -> "
      vim.cmd("Git push origin " .. branch)
    elseif choice == "Fetch" then
      vim.cmd "Git fetch --all -p"
    else
      vim.cmd("Git " .. choice:lower())
    end
  end)
end

local opts = { noremap = true, silent = true, buffer = 0 }
local mappings = {
  n = {
    ["<leader>go"] = {
      select,
      "[Fugitive] Git options",
    },
  },
}

require("aome.core.utils").map_keys(mappings, opts)
