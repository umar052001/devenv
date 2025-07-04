-- ~/.config/nvim/lua/plugins/colorscheme.lua

return {
  "rose-pine/neovim",
  name = "rose-pine",
  config = function()
    vim.g.rose_pine_variant = 'main'
    vim.g.rose_pine_bold_vert_split = true
    vim.g.rose_pine_dim_nc_background = true
    require('rose-pine').setup()
    vim.cmd("colorscheme rose-pine")
  end,
}
