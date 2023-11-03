local comment = {}

table.insert(comment, {
    'numToStr/Comment.nvim',
    lazy = true,
    event = { 'BufNewFile', 'BufReadPre' },
    config = require('plugins.comment.comment.config'),
})

table.insert(comment, {
    'folke/todo-comments.nvim',
    lazy = true,
    event = { 'BufNewFile', 'BufReadPre' },
    config = function()
        require('todo-comments').setup({})
    end,
    dependencies = 'nvim-lua/plenary.nvim',
})

return comment
