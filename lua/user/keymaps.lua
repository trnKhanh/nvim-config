local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local setKeymap = vim.keymap.set
local delKeymap = vim.keymap.del

--Remap space as leader key setKeymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
setKeymap("n", "<C-h>", "<C-w>h", opts)
setKeymap("n", "<C-j>", "<C-w>j", opts)
setKeymap("n", "<C-k>", "<C-w>k", opts)
setKeymap("n", "<C-l>", "<C-w>l", opts)

-- CMP
setKeymap("n", "<leader>c", ":ToggleAutoComplete<CR>")

-- Delete Buffer
setKeymap("n", "<leader>bd", ":bd<CR>")

-- Harpoon
setKeymap("n", "<leader>a", ":lua require('harpoon.mark').add_file()<CR>", opts)
setKeymap("n", "<leader>h", ":lua require('harpoon.ui').toggle_quick_menu()<CR>", opts)
-- setKeymap("n", "<S-h>", ":lua require('harpoon.ui').nav_prev()<CR>", opts)
-- setKeymap("n", "<S-l>", ":lua require('harpoon.ui').nav_next()<CR>", opts)
for i = 1, 9, 1 do
	setKeymap("n", "<leader>o" .. tostring(i), ":lua require('harpoon.ui').nav_file(" .. tostring(i) .. ")<CR>", opts)
end

-- NvimTree
setKeymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- Resize with arrows
setKeymap("n", "<S-Up>", ":resize +2<CR>", opts)
setKeymap("n", "<S-Down>", ":resize -2<CR>", opts)
setKeymap("n", "<S-Left>", ":vertical resize -2<CR>", opts)
setKeymap("n", "<S-Right>", ":vertical resize +2<CR>", opts)

-- -- Navigate buffers
setKeymap("n", "<SC-l>", ":bnext<CR>", opts)
setKeymap("n", "<SC-h>", ":bprevious<CR>", opts)

-- Telescope keymaps
setKeymap("n", "<leader>f", "<cmd>Telescope find_files<cr>", opts)
setKeymap("n", "<leader>t", "<cmd>Telescope live_grep<cr>", opts)
setKeymap("n", "<leader>l", "<cmd>Telescope diagnostics<cr>", opts)
setKeymap("n", "gr", "<cmd>Telescope lsp_references<cr>", opts)
setKeymap("n", "gd", "<cmd>Telescope lsp_definitions<cr>", opts)
setKeymap("n", "gi", "<cmd>Telescope lsp_implementations<cr>", opts)
setKeymap("n", "<leader>gb", "<cmd>Telescope git_branches<cr>", opts)
setKeymap("n", "<leader>gc", "<cmd>Telescope git_commits<cr>", opts)
setKeymap("n", "<leader>gs", "<cmd>Telescope git_status<cr>", opts)

-- Lazygit toggle
setKeymap("n", "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", opts)
-- Insert --
-- Press jk fast to enter
-- keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
setKeymap("v", "<", "<gv", opts)
setKeymap("v", ">", ">gv", opts)

-- Move text up and down -- Not working for macos
-- keymap("v", "J", ":m .+1<CR>==", opts)
-- keymap("v", "K", ":m .-2<CR>==", opts)
setKeymap("v", "p", '"_dP', opts)

-- Visual Block --
setKeymap("x", "J", ":move '>+1<CR>gv-gv", opts)
setKeymap("x", "K", ":move '<-2<CR>gv-gv", opts)
-- Move text up and down -- Not working for macos
-- keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
-- keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
-- setKeymap("t", "<ESC>", "<C-\\><C-N>", term_opts)
-- setKeymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- setKeymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- setKeymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- setKeymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)
