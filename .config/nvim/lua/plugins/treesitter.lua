-- ~/.config/nvim/lua/plugins/treesitter.lua

return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require('nvim-treesitter.configs').setup({
      ensure_installed = {'go', 'javascript', 'tsx', 'html', 'css', 'json', 'lua', 'python'},
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}
