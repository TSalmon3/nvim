return function()
    -- local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
    require('null-ls').setup({
        debug = true,
        -- source = {
        -- 	require("null-ls").builtins.formatting.prettier,
        -- 	require("null-ls").builtins.formatting.stylua,
        -- 	require("null-ls").builtins.formatting.clang_format.with({
        -- 		extra_args = {
        -- 			"--style",
        -- 			"{IndentWidth: 4}",
        -- 			-- '-style="{BasedOnStyle: llvm, IndentWidth: 8}"',
        -- 		},
        -- 	}),
        -- },
        -- on_init = function(new_client, _)
        --     new_client.offset_encoding = 'utf-8'
        -- end,
        --
        -- on_attach = function(client, bufnr)
        -- 	if client.supports_method("textDocument/formatting") then
        -- 		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
        -- 		vim.api.nvim_create_autocmd("BufWritePre", {
        -- 			group = augroup,
        -- 			buffer = bufnr,
        -- 			callback = function()
        -- 				print(client.name)
        -- 				-- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
        -- 				vim.lsp.buf.format({
        -- 					bufnr = bufnr,
        -- 				})
        -- 			end,
        -- 		})
        -- 	end
        -- end,
    })
end
