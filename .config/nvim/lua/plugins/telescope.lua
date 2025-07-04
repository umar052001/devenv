-- ~/.config/nvim/lua/plugins/telescope.lua

return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.5',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local telescope = require('telescope')
    local actions = require "telescope.actions"

    telescope.setup {
      defaults = {
        find_command = { "rg", "--files", "--hidden", "--glob", "!.git/*" },
        prompt_prefix = "  ",
        selection_caret = "❯ ",
        entry_prefix = "  ",
        file_ignore_patterns = {
          "**/venv/**",
          "__pycache__/",
          "node_modules/",
          "target/",
          "%.git/",
          "%.DS_Store"
        },
        layout_strategy = "horizontal",
        layout_config = {
          horizontal = {
            prompt_position = "top",
            preview_width = 0.55,
            results_width = 0.8,
          },
          vertical = { mirror = false },
          width = 0.87,
          height = 0.80,
          preview_cutoff = 120,
        },
        mappings = {
          i = {
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
            ["<esc>"] = actions.close,
          },
        },
      },
    }

    local opts = { noremap = true, silent = true }
    vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>', opts)
    vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', opts) -- Kept for reference, but Harpoon is recommended
    vim.keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<cr>', opts)
    vim.keymap.set('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', opts)
  end,
}
