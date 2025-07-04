-- ~/.config/nvim/lua/config/keymaps.lua

local opts = { noremap = true, silent = true }

-- General
vim.keymap.set('n', '<leader>w', ':w<CR>', opts)
vim.keymap.set('n', '<leader>q', ':q<CR>', opts)
vim.keymap.set('n', '<leader>wq', ':wq<CR>', opts)
vim.keymap.set('n', '<leader>e', ':e<CR>', opts)
vim.keymap.set('n', '<leader>bd', ':bd<CR>', opts)
vim.keymap.set('n', '<leader>pv', ':Ex<CR>', opts)
vim.keymap.set('n', '<leader>mx', ':!chmod +x %<CR>', opts)

-- System clipboard
vim.keymap.set('n', 'Y', '"+y', opts)
vim.keymap.set('v', 'Y', '"+y', opts)
