-- Set the leader key to space for easier key mappings
vim.g.mapleader = " "

-- Basic editor settings
vim.opt.number = true          -- Show line numbers
vim.opt.relativenumber = true  -- Show relative line numbers
vim.opt.tabstop = 4            -- Number of spaces for a tab
vim.opt.shiftwidth = 4         -- Number of spaces for indentation
vim.opt.expandtab = true       -- Use spaces instead of tabs
vim.opt.smartindent = true     -- Smart indentation
vim.opt.wrap = false           -- Disable line wrapping
vim.opt.termguicolors = true   -- Enable 24-bit RGB colors
-- Plugin management with packer.nvim
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()
require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'  -- Packer can manage itself
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use 'neovim/nvim-lspconfig'   -- LSP configurations
  use 'hrsh7th/nvim-cmp'        -- Autocompletion
  use 'hrsh7th/cmp-nvim-lsp'    -- LSP source for nvim-cmp
  use 'nvim-treesitter/nvim-treesitter' -- Better syntax highlighting
  use 'rose-pine/neovim'        -- Color scheme
  if packer_bootstrap then
    require('packer').sync()    -- Install plugins if newly set up
  end
end)

-- Load additional configuration files
require('treesitter')          -- Treesitter setup
require('go')                  -- Go language setup
require('typescript')          -- Typescript language setup
require('python')          -- Pthon language setup
require('telescope-config')

-- Setup color scheme
vim.g.rose_pine_variant = 'main'
vim.g.rose_pine_bold_vert_split = true
vim.g.rose_pine_dim_nc_background = true
require('rose-pine').setup()
-- Key mappings
local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<leader>w', ':w<CR>', opts)
vim.keymap.set('n', '<leader>q', ':q<CR>', opts)
vim.keymap.set('n', '<leader>wq', ':wq<CR>', opts)
vim.keymap.set('n', '<leader>e', ':e<CR>', opts)
vim.keymap.set('n', '<leader>bd', ':bd<CR>', opts)
vim.keymap.set('n', '<leader>pv', ':Ex<CR>', opts)
vim.keymap.set('n', '<leader>mx', ':!chmod +x %<CR>', opts)
vim.keymap.set('n', 'Y', '"+y', { noremap = true, silent = true })
vim.keymap.set('v', 'Y', '"+y', { noremap = true, silent = true })
