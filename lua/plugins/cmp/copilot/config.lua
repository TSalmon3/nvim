return function()
    require('copilot').setup({
        -- cmp = {
        --     enabled = true,
        --     method = "getCompletionsCycling",
        -- },
        suggestion = { enabled = false },
        panel = { enabled = false },
    })
end
