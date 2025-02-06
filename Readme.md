
# Development Environment Setup

Welcome to my automated development environment setup, inspired by [ThePrimeagen](https://github.com/ThePrimeagen). This configuration streamlines your workflow with efficient tools and custom configurations.

## Features

- **i3 Window Manager** – Configured for multiple monitors with a customized i3status.
- **Tmux Sessionizer** – Fuzzy find and jump into projects effortlessly.
- **Zsh Configuration** – A clean, minimal `.zshrc` setup.
- **One-Command Install** – Easily set up everything with automation scripts.

## Installation

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/umar052001/devenv.git
   cd devenv
   ```

2. **Run the Setup Script**:
   ```bash
   ./dev-env
   ```
   This script copies all configuration and dotfiles to your home directory.

3. **Install Necessary Packages**:
   ```bash
   cd runs
   ./run
   ```
   This will install required dependencies and tools.

## Usage

### i3 Window Manager

- Preconfigured for multi-monitor setups.
- Enhanced i3status for better system monitoring.
- Efficient keybindings for window management.

### Tmux Sessionizer

- Quickly create and switch between tmux sessions.
- Press `Ctrl+F` to use the fuzzy finder and jump into project directories.
- Easily reopen previous workspaces.

### Zsh Configuration

- A minimal yet powerful `.zshrc` configuration.
- Supports aliases, auto-suggestions, and basic enhancements.
- Fully customizable based on your needs.

## Customization

Feel free to tweak configurations to match your workflow. Modify dotfiles, scripts, or add your own customizations to improve the setup.

## Contributing

Contributions are welcome!  
If you have improvements, bug fixes, or feature requests, feel free to fork the repo and submit a pull request.

## Acknowledgments

This setup is heavily inspired by ThePrimeagen.