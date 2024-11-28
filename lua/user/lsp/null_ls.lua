local cmp_status_ok, null_ls = pcall(require, "null-ls")
if not cmp_status_ok then
	return
end
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

local sources = {
	formatting.prettier,
	formatting.black.with({ extra_args = { "-l", "80" } }),
	formatting.stylua,
	formatting.cmake_format,
	diagnostics.cmake_lint,
}

-- local eslint_status_ok, eslint = pcall(require, "none-ls.diagnostics.eslint")
-- if eslint_status_ok then
-- 	table.insert(sources, eslint)
-- else
-- 	vim.notify("[null-ls] failed to load eslint for diagnostics", vim.log.levels.WARN)
-- end

null_ls.setup({
	sources = sources,
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
