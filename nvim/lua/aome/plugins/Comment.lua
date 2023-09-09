return {
    "numToStr/Comment.nvim",
    dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
    config = function()
        local ok, comment = pcall(require, "Comment")
        if not ok then
            vim.notify("Comment is not loaded", 3)
            return
        end
        comment.setup({
            pre_hook = require("ts_context_commentstring.integrations.comment_nvim"),
        })
    end
}
