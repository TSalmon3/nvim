local lang = {}

table.insert(lang, {
        "lukas-reineke/indent-blankline.nvim",
        lazy = true,
        event = "BufReadPost",
        config = require("plugins.config.lang.indentline"),
})

table.insert(lang, {
        "windwp/nvim-autopairs",
        lazy = true,
        event = "BufReadPost",
        config = require("plugins.config.lang.autopairs"),
})

table.insert(lang, {
        "kylechui/nvim-surround",
        lazy = true,
        event = "BufReadPost",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        config = require("plugins.config.lang.surround"),
})

table.insert(lang, {
        "numToStr/Comment.nvim",
        lazy = true,
        event = { "BufNewFile", "BufReadPre" },
        config = require("plugins.config.lang.comment"),
})

table.insert(lang, {
        "folke/todo-comments.nvim",
        lazy = true,
        event = { "BufNewFile", "BufReadPre" },
        config = nil,
        dependencies = "nvim-lua/plenary.nvim",
})

table.insert(lang, {
        "nvim-treesitter/nvim-treesitter",
        lazy = true,
        event = { "BufNewFile", "BufReadPre" },
        build = function()
                require("nvim-treesitter.install").update({ with_sync = true })
        end,
        config = require("plugins.config.lang.treesitter"),
        dependencies = {
                { "p00f/nvim-ts-rainbow" },
                { "nvim-treesitter/nvim-treesitter-textobjects" },
        },
})

table.insert(lang, {
        "folke/trouble.nvim",
        lazy = true,
        cmd = { "TroubleToggle" },
        config = require("plugins.config.lang.trouble"),
})

return lang
