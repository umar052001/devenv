-- ~/.config/nvim/lua/config/keymaps.lua
local opts = { noremap = true, silent = true }

-- General
vim.keymap.set("n", "<leader>w", ":w<CR>", opts)
vim.keymap.set("n", "<leader>q", ":q<CR>", opts)
vim.keymap.set("n", "<leader>wq", ":wq<CR>", opts)
vim.keymap.set("n", "<leader>e", ":e<CR>", opts)
vim.keymap.set("n", "<leader>bd", ":bd<CR>", opts)
vim.keymap.set("n", "<leader>pv", ":Ex<CR>", opts)
vim.keymap.set("n", "<leader>mx", ":!chmod +x %<CR>", opts)
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })

-- System clipboard
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>p", '"+p')
vim.keymap.set("n", "<leader>P", '"+P')
vim.keymap.set("v", "<leader>p", '"+p')
vim.keymap.set("v", "<leader>P", '"+P')

-- Move line up/down in normal mode
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { noremap = true, silent = true })
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { noremap = true, silent = true })

-- Move selected lines up/down in visual mode
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })
-- Split windows
vim.keymap.set("n", "<leader>sv", ":vsplit<CR>", opts) -- vertical split
vim.keymap.set("n", "<leader>sh", ":split<CR>", opts) -- horizontal split
vim.keymap.set("n", "<leader>sc", ":close<CR>", opts) -- close split

-- Resize splits (Ctrl + arrow keys)
vim.keymap.set("n", "<C-Up>", ":resize +2<CR>", opts)
vim.keymap.set("n", "<C-Down>", ":resize -2<CR>", opts)
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", opts)
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Quick jump (line start/end)
vim.keymap.set("n", "H", "^", opts)
vim.keymap.set("n", "L", "$", opts)

--For error definition leader e--
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show error under cursor" })
