local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "user.lsp.mason"
require("user.lsp.handlers").setup()
require "user.lsp.null_ls"
-- Setup keymaps
local keymaps_status_ok, _ = pcall(require, "user.lsp.keymaps")
if not keymaps_status_ok then
  vim.notify("Keymaps for lsp not found")
end
-- require "user.lsp.null-ls"
