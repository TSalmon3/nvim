return function()
    local actions = require('telescope.actions')
    require('telescope').load_extension('projects')
    require('telescope').load_extension('undo')
    require('telescope').setup({
        pickers = {
            find_files = {
                theme = 'dropdown',
                hidden = false,
                previewer = false,
            },
            oldfiles = {
                theme = 'dropdown',
                previewer = false,
            },
            live_grep = {},
        },
        extension = {
            undo = {
                side_by_side = true,
                mappings = {
                    i = {
                        -- IMPORTANT: Note that telescope-undo must be available when telescope is configured if
                        -- you want to replicate these defaults and use the following actions. This means
                        -- installing as a dependency of telescope in it's `requirements` and loading this
                        -- extension from there instead of having the separate plugin definition as outlined
                        -- above.
                        ['<cr>'] = require('telescope-undo.actions').yank_additions,
                        ['<S-cr>'] = require('telescope-undo.actions').yank_deletions,
                        ['<C-cr>'] = require('telescope-undo.actions').restore,
                    },
                },
            },
        },
        defaults = {
            prompt_prefix = ' ',
            selection_caret = ' ',
            path_display = { 'smart' },
            layout_config = {
                horizontal = {
                    prompt_position = 'top',
                    preview_width = 0.55,
                    results_width = 0.8,
                },
                vertical = {
                    mirror = false,
                },
                width = 0.87,
                height = 0.80,
                preview_cutoff = 120,
            },
            mappings = {
                i = {
                    ['<C-n>'] = actions.cycle_history_next,
                    ['<C-p>'] = actions.cycle_history_prev,
                    ['<C-j>'] = actions.move_selection_next,
                    ['<C-k>'] = actions.move_selection_previous,
                    ['<C-c>'] = actions.close,
                    ['<Down>'] = actions.move_selection_next,
                    ['<Up>'] = actions.move_selection_previous,
                    ['<CR>'] = actions.select_default,
                    ['<C-x>'] = actions.select_horizontal,
                    ['<C-v>'] = actions.select_vertical,
                    ['<C-t>'] = actions.select_tab,
                    ['<C-u>'] = actions.preview_scrolling_up,
                    ['<C-d>'] = actions.preview_scrolling_down,
                    ['<PageUp>'] = actions.results_scrolling_up,
                    ['<PageDown>'] = actions.results_scrolling_down,
                    ['<Tab>'] = actions.toggle_selection + actions.move_selection_worse,
                    ['<S-Tab>'] = actions.toggle_selection + actions.move_selection_better,
                    ['<C-q>'] = actions.send_to_qflist + actions.open_qflist,
                    ['<M-q>'] = actions.send_selected_to_qflist + actions.open_qflist,
                    ['<C-l>'] = actions.complete_tag,
                    ['<C-_>'] = actions.which_key, -- keys from pressing <C-/>
                },
                n = {
                    ['q'] = actions.close,
                    ['<CR>'] = actions.select_default,
                    ['<C-x>'] = actions.select_horizontal,
                    ['<C-v>'] = actions.select_vertical,
                    ['<C-t>'] = actions.select_tab,
                    ['<Tab>'] = actions.toggle_selection + actions.move_selection_worse,
                    ['<S-Tab>'] = actions.toggle_selection + actions.move_selection_better,
                    ['<C-q>'] = actions.send_to_qflist + actions.open_qflist,
                    ['<M-q>'] = actions.send_selected_to_qflist + actions.open_qflist,
                    ['j'] = actions.move_selection_next,
                    ['k'] = actions.move_selection_previous,
                    ['H'] = actions.move_to_top,
                    ['M'] = actions.move_to_middle,
                    ['L'] = actions.move_to_bottom,
                    ['<Down>'] = actions.move_selection_next,
                    ['<Up>'] = actions.move_selection_previous,
                    ['gg'] = actions.move_to_top,
                    ['G'] = actions.move_to_bottom,
                    ['<C-u>'] = actions.preview_scrolling_up,
                    ['<C-d>'] = actions.preview_scrolling_down,
                    ['<PageUp>'] = actions.results_scrolling_up,
                    ['<PageDown>'] = actions.results_scrolling_down,
                    ['?'] = actions.which_key,
                },
            },
        },
    })
end
