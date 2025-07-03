-- Basic Telescope setu
--require('telescope').setup({
--  defaults = {
--    -- add configurations here if you want
--  }
--})
-- File: lua/your_user/telescope.lua
--
-- A sleek and functional configuration for the telescope.nvim plugin.
-- Make sure you have `ripgrep` installed for this config to work optimally.
-- You can install it with: `brew install ripgrep` or `sudo apt-get install ripgrep`

local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

local actions = require "telescope.actions"

telescope.setup {
  -- Default settings for all pickers
  defaults = {
    -- This is the command that Telescope will use to find files.
    -- We use `ripgrep` (rg) here with flags to:
    --   --files: list files respecting .gitignore and .ignore
    --   --hidden: show hidden files
    --   --glob '!.git/*': exclude the .git directory
    find_command = { "rg", "--files", "--hidden", "--glob", "!.git/*" },

    prompt_prefix = "  ",
    selection_caret = "❯ ",
    entry_prefix = "  ",

    -- Ignore patterns are Lua patterns, matched against the full path.
    -- This will ignore any directory named 'venv' and other common ones.
    file_ignore_patterns = {
      "**/venv/**",
      "__pycache__/",
      "node_modules/",
      "target/",
      "%.git/",
      "%.DS_Store"
    },

    -- A nicer, more spacious layout
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        prompt_position = "top",
        preview_width = 0.55,
        results_width = 0.8,
      },
      vertical = {
        mirror = false,
      },
      width = 0.87,
      height = 0.80,
      preview_cutoff = 120,
    },

    -- Custom mappings for a better experience
    mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
        ["<esc>"] = actions.close,
      },
      n = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["q"] = actions.close,
      },
    },
  },

  -- Settings for specific pickers
  pickers = {
    find_files = {
      -- This ensures that we look in hidden folders by default
      -- when using the `find_files` picker.
      find_hidden = true,
    },
    live_grep = {
      -- `rg` is needed for this picker to work.
      -- It will grep in hidden files.
      additional_args = { "--hidden" }
    },
    buffers = {
      sort_mru = true,
      ignore_current_buffer = true,
    },
  },

  -- You can safely ignore this section
  extensions = {},
}

-- Your keymap to open the file finder
local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<leader>f', '<cmd>Telescope find_files<cr>', opts)

-- Some other useful keymaps to consider
vim.keymap.set('n', '<leader>g', '<cmd>Telescope live_grep<cr>', opts)
vim.keymap.set('n', '<leader>b', '<cmd>Telescope buffers<cr>', opts)
vim.keymap.set('n', '<leader>h', '<cmd>Telescope help_tags<cr>', opts)

