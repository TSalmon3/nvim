return function()
    vim.cmd([[
        let g:VM_maps = {}
        let g:VM_maps["Exit"] = '<esc>'
        let g:VM_maps["Find Under"] = '<c-n>'
        let g:VM_maps["Find Subword Under"] = '<c-n>'
        let g:VM_maps["Find Next"] = 'n'
        let g:VM_maps["Find Prev"] = 'N'
        let g:VM_maps["Remove Region"] = 'q'
        let g:VM_maps["Skip Region"] = 'Q'
        let g:VM_maps["Select Cursor Down"] = '<c-j>'
        let g:VM_maps["Select Cursor Up"] = '<c-k>'
        let g:VM_maps["Increase"] = '='
        let g:VM_maps["Decrease"] = '-'
        let g:VM_maps["Undo"] = 'u'
        let g:VM_maps["Redo"] = '<c-r>'
        ]])
end
