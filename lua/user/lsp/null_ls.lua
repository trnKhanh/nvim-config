local cmp_status_ok, null_ls = pcall(require, "null-ls")
if not cmp_status_ok then
	return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
null_ls.setup({
	sources = {
		formatting.prettier,
		formatting.black.with({ extra_args = { "-l", "80" } }),
		formatting.stylua,
		formatting.cmake_format,
		diagnostics.eslint,
		diagnostics.cmake_lint,
	},
})

function LSP_FORMATTING(bufnr)
	vim.lsp.buf.format({
		filter = function(client)
			-- apply whatever logic you want (in this example, we'll only use null-ls)
			return client.name == "null-ls" or client.name == "clangd"
		end,
		bufnr = bufnr,
	})
end
