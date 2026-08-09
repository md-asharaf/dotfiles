#!/usr/bin/env bash

# Exit immediately if a command exits with a non-zero status
set -e

# Setup colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
RESET='\033[0m'

# Get directory where this script is located
REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

DRY_RUN=false
CLEAN=false

# Print usage
usage() {
    echo -e "Usage: $0 [options]"
    echo -e "Options:"
    echo -e "  -d, --dry-run   Preview the synchronization without copying files"
    echo -e "  -c, --clean     Delete files in the repo that no longer exist in local config (rsync --delete)"
    echo -e "  -h, --help      Show this help message"
    exit 0
}

# Parse options
while [[ "$#" -gt 0 ]]; do
    case $1 in
        -d|--dry-run) DRY_RUN=true ;;
        -c|--clean) CLEAN=true ;;
        -h|--help) usage ;;
        *) echo -e "${RED}Unknown option: $1${RESET}"; usage ;;
    esac
    shift
done

echo -e "${BLUE}=== Dotfiles Sync Script ===${RESET}"
if [ "$DRY_RUN" = true ]; then
    echo -e "${YELLOW}Running in DRY RUN mode. No files will be modified.${RESET}"
fi
if [ "$CLEAN" = true ]; then
    echo -e "${RED}Clean mode enabled. Files deleted locally will be deleted in the repository.${RESET}\n"
fi

# Define base rsync options
RSYNC_OPTS=(-av --update)
RSYNC_OPTS+=(--exclude=".git/")
RSYNC_OPTS+=(--exclude="node_modules/")
RSYNC_OPTS+=(--exclude=".venv/")
RSYNC_OPTS+=(--exclude="*.log")
RSYNC_OPTS+=(--exclude=".cache/")
RSYNC_OPTS+=(--exclude="undo/")
RSYNC_OPTS+=(--exclude="swap/")
RSYNC_OPTS+=(--exclude=".DS_Store")

if [ "$CLEAN" = true ]; then
    RSYNC_OPTS+=(--delete)
fi

# Define mappings: Local Path | Repo Path | Type (dir/file)
MAPPINGS=(
    "~/.config/ghostty/config|ghostty/config|file"
    "~/.config/kitty/kitty.conf|kitty/kitty.conf|file"
    "~/.config/tmux|tmux|dir"
    "~/.config/Antigravity IDE/User/settings.json|antigravity/settings.json|file"
    "~/.config/caelestia|caelestia|dir"
    "~/.config/fastfetch|fastfetch|dir"
    "~/.config/hypr|hypr|dir"
    "~/.config/nvim|nvim|dir"
    "~/.config/quickshell/caelestia|quickshell/caelestia|dir"
    "~/.config/warp-terminal|warp-terminal|dir"
    "~/.config/zed|zed|dir"
    "~/.zshrc|zsh/.zshrc|file"
    "~/.p10k.zsh|zsh/.p10k.zsh|file"
)

# Helper function to sync a path
sync_path() {
    local src="$1"
    local dest="$2"
    local type="$3"

    # Expand the tilde manually to get absolute local path
    src="${src/#\~/$HOME}"
    local dest_abs="$REPO_DIR/$dest"

    if [ ! -e "$src" ]; then
        # Quiet skip for missing kitty and tmux if not present on this laptop
        if [[ "$src" == *"kitty"* || "$src" == *"tmux"* ]]; then
            return
        fi
        echo -e "${YELLOW}Warning: Source path '$src' does not exist. Skipping.${RESET}"
        return
    fi

    if [ "$DRY_RUN" = true ]; then
        echo -e "\n${CYAN}Dry-run: $src -> $dest_abs${RESET}"
        if [ "$type" = "dir" ]; then
            # Show what would be transferred
            rsync "${RSYNC_OPTS[@]}" --dry-run "$src/" "$dest_abs/"
        else
            if [ -f "$dest_abs" ] && cmp -s "$src" "$dest_abs"; then
                echo "  File is identical. No change."
            else
                echo "  File would be copied (modified or new)."
            fi
        fi
        return
    fi

    if [ "$type" = "dir" ]; then
        echo -e "Syncing directory: ${GREEN}$src${RESET} -> ${GREEN}$dest_abs${RESET}"
        mkdir -p "$dest_abs"
        rsync "${RSYNC_OPTS[@]}" "$src/" "$dest_abs/"
    else
        echo -e "Syncing file:      ${GREEN}$src${RESET} -> ${GREEN}$dest_abs${RESET}"
        mkdir -p "$(dirname "$dest_abs")"
        cp -f "$src" "$dest_abs"
    fi
}

# Run sync for each mapping
for entry in "${MAPPINGS[@]}"; do
    IFS="|" read -r src dest type <<< "$entry"
    sync_path "$src" "$dest" "$type"
done

# Git operations
if [ "$DRY_RUN" = false ]; then
    echo -e "\n${BLUE}=== Git Status Summary ===${RESET}"
    git -C "$REPO_DIR" status -s

    # Check if there are changes in git status
    if ! git -C "$REPO_DIR" diff --quiet || ! git -C "$REPO_DIR" status --porcelain | grep -q '^??'; then
        echo -ne "\n${YELLOW}Would you like to stage all changes (git add .)? (y/N): ${RESET}"
        read -r response
        if [[ "$response" =~ ^[Yy]$ ]]; then
            git -C "$REPO_DIR" add .
            echo -e "${GREEN}Staged all changes.${RESET}"

            echo -ne "\n${YELLOW}Enter commit message (leave empty to skip commit): ${RESET}"
            read -r commit_msg
            if [ -n "$commit_msg" ]; then
                git -C "$REPO_DIR" commit -m "$commit_msg"
                echo -e "${GREEN}Committed changes.${RESET}"

                echo -ne "\n${YELLOW}Would you like to push to remote? (y/N): ${RESET}"
                read -r push_response
                if [[ "$push_response" =~ ^[Yy]$ ]]; then
                    git -C "$REPO_DIR" push
                    echo -e "${GREEN}Successfully pushed to remote!${RESET}"
                fi
            else
                echo -e "${BLUE}Commit skipped.${RESET}"
            fi
        fi
    else
        echo -e "${GREEN}No changes detected in repository.${RESET}"
    fi
fi

echo -e "\n${GREEN}Done!${RESET}"
