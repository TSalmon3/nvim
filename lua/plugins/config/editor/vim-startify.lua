return function()
	vim.cmd([[
    let g:startify_lists = [
    \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
    \ { 'type': 'sessions',  'header': ['   Sessions']       },
    \ { 'type': 'files',     'header': ['   MRU']            },
    \ ]

    let g:startify_bookmarks = ["D:/LIBRARY/note/index.md"]
    ]])
end
