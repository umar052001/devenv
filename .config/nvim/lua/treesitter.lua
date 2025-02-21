-- Treesitter configuration for better syntax highlighting
require('nvim-treesitter.configs').setup({
  ensure_installed = {'go', 'javascript', 'tsx', 'html', 'css', 'json'}, -- Install parsers for these languages
  sync_install = false, -- Install parsers asynchronously
  highlight = {
    enable = true,      -- Enable syntax highlighting
  },
})
