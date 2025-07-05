 -- ~/.config/nvim/lua/plugins/telescope.lua

return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.5',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    require('telescope').setup{}

    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
         vim.keymap.set('n', '<leader>ff', function()
      builtin.find_files({
        find_command = { 'git', 'ls-files', '--cached', '--exclude-standard', '--others' },
        hidden = true,
      })
    end, {}) 
    vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
  end,
}
