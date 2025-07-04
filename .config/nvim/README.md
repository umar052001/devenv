

# My Modern Neovim Configuration

This is a highly modular, fast, and powerful Neovim configuration designed for a modern development workflow. It is built around `lazy.nvim` for plugin management and provides a rich, IDE-like experience for Go, Python, and TypeScript, with easy extensibility for other languages.

## Features

- **Fast Startup**: Uses `lazy.nvim` to lazy-load plugins, ensuring Neovim starts almost instantly.
- **Intelligent Code Completion**: Powered by `nvim-cmp` with LSP integration.
- **Full LSP Support**: Pre-configured for Go, Python, and TypeScript using `nvim-lspconfig` and `mason.nvim`.
- **Advanced Fuzzy Finding**: Telescope for quickly finding files, text, and buffers.
- **Efficient File Navigation**: Harpoon for bookmarking and jumping between important files.
- **Beautiful Syntax Highlighting**: Accurate and performant highlighting with `nvim-treesitter`.
- **Modular Structure**: A clean and organized Lua-based configuration that is easy to understand and extend.

## Installation

### Prerequisites
- Neovim (v0.8.0 or higher)
- Git
- A C compiler for `nvim-treesitter`
- A Nerd Font for icons
- Node.js (v18+) for the `pyright` language server

### Clone the Configuration
```bash
git clone <your-repo-url> ~/.config/nvim
```

### Launch Neovim
The first time you run `nvim`, `lazy.nvim` will automatically install all the plugins.

### Install Language Servers
1. Run the command `:Mason` inside Neovim.
2. In the Mason window, install the following language servers by navigating to them and pressing `i`:
   - `gopls`
   - `pyright`
   - `tsserver`
3. Restart Neovim. Your development environment is now ready.

## Keybindings Cheatsheet

The `<leader>` key is `Space`.

### General
| Keybinding | Action            |
|------------|-------------------|
| `<leader>w` | Save file        |
| `<leader>q` | Quit window      |
| `<leader>bd`| Close buffer     |
| `<leader>pv`| Open file explorer |

### Harpoon (File Bookmarking)
| Keybinding   | Action                     |
|--------------|----------------------------|
| `<leader>ha` | Add file to Harpoon list   |
| `<leader>hr` | Remove file from Harpoon list |
| `<leader>he` | Toggle Harpoon menu        |
| `<leader>h1-h4` | Jump to file 1-4         |

### Telescope (Fuzzy Finder)
| Keybinding   | Action                     |
|--------------|----------------------------|
| `<leader>ff` | Find Files                 |
| `<leader>fg` | Find by Grep (search text) |
| `<leader>fb` | Find Buffers (open files)  |

### LSP (Language Intelligence)
| Keybinding   | Action                     |
|--------------|----------------------------|
| `gd`         | Go to Definition           |
| `K`          | Hover for documentation    |
| `<leader>ca` | Show Code Actions          |
| `<leader>rn` | Rename Symbol              |
| `<leader>lf` | Format File                |


