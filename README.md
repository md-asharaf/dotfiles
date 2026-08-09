# Caelestia Dotfiles

A premium, curated set of configuration files (dotfiles) for a highly customized Linux desktop experience. Powered by **Hyprland**, styled with a custom **Quickshell** interface, and optimized for development using modern editors and shell tools.

---

## 🖥️ Desktop Components & Configurations

| Component | Directory | Description |
| :--- | :--- | :--- |
| **Hyprland** | [`hypr/`](file:///home/md-asharaf/coding/personal/dotfiles/hypr) | A highly customized window manager config structured in Lua for clean variables and scheme swapping. |
| **Quickshell** | [`quickshell/`](file:///home/md-asharaf/coding/personal/dotfiles/quickshell) | An elegant QML-based desktop shell containing custom widgets, dashboard, nexus settings, session locks, and panel modules. |
| **Caelestia** | [`caelestia/`](file:///home/md-asharaf/coding/personal/dotfiles/caelestia) | Core system preferences, display scaling monitor profiles, and Fish shell utilities. |
| **Neovim** | [`nvim/`](file:///home/md-asharaf/coding/personal/dotfiles/nvim) | IDE-grade Neovim configuration built with LazyVim, custom plugins, treesitter configurations, and LSP integrations. |
| **Zed** | [`zed/`](file:///home/md-asharaf/coding/personal/dotfiles/zed) | Custom workspace options, keymaps, and the custom Caelestia color scheme. |
| **Terminals** | [`ghostty/`](file:///home/md-asharaf/coding/personal/dotfiles/ghostty), [`kitty/`](file:///home/md-asharaf/coding/personal/dotfiles/kitty), [`warp-terminal/`](file:///home/md-asharaf/coding/personal/dotfiles/warp-terminal) | Settings for modern, GPU-accelerated terminal emulators. |
| **Zsh** | [`zsh/`](file:///home/md-asharaf/coding/personal/dotfiles/zsh) | Shell configs matching `.zshrc` and Powerlevel10k prompt configuration (`.p10k.zsh`). |
| **Fastfetch** | [`fastfetch/`](file:///home/md-asharaf/coding/personal/dotfiles/fastfetch) | Custom themes (Lite & Full configurations) featuring Nyarch system logos. |
| **Antigravity IDE** | [`antigravity/`](file:///home/md-asharaf/coding/personal/dotfiles/antigravity) | Workspace settings for Antigravity IDE. |
| **Tmux** | [`tmux/`](file:///home/md-asharaf/coding/personal/dotfiles/tmux) | Advanced terminal multiplexer configuration and key resets. |

---

## 🔄 Syncing Configurations

The repository includes a helper utility [`sync.sh`](file:///home/md-asharaf/coding/personal/dotfiles/sync.sh) to quickly back up active configurations from the local laptop directories (such as `~/.config/` and your home directory) into the repository.

### Usage

Run the sync script:
```bash
./sync.sh [options]
```

### Options

* **`-d, --dry-run`**: Run a test synchronization to see which files would be updated or copied without modifying any repository files.
* **`-c, --clean`**: Destructive synchronization using `rsync --delete`. Removes files in the repository if they have been deleted from your local configurations.
* **`-h, --help`**: Display script usage directions.

### Post-Sync Git Flow
Once files are successfully synchronized, the script will show a `git status` summary and interactively prompt you to stage all changes (`git add .`), compose a commit message, and push the updates directly to GitHub.
