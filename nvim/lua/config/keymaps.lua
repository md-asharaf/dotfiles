-- Load LazyVim default keymaps first
require("lazyvim.config.keymaps")

local map = vim.keymap.set

-- Better Escape
map("i", "jk", "<Esc>", { desc = "Escape insert mode" })
map("i", "jj", "<Esc>", { desc = "Escape insert mode" })

-- Save
map({ "n", "i", "v" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })

-- Quit
map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit All" })

-- Better window navigation
map("n", "<C-h>", "<C-w>h", { desc = "Go Left Window" })
map("n", "<C-j>", "<C-w>j", { desc = "Go Down Window" })
map("n", "<C-k>", "<C-w>k", { desc = "Go Up Window" })
map("n", "<C-l>", "<C-w>l", { desc = "Go Right Window" })

-- Resize windows
map("n", "<A-h>", "<cmd>vertical resize -3<cr>", { desc = "Resize Left" })
map("n", "<A-l>", "<cmd>vertical resize +3<cr>", { desc = "Resize Right" })
map("n", "<A-k>", "<cmd>resize +2<cr>", { desc = "Resize Up" })
map("n", "<A-j>", "<cmd>resize -2<cr>", { desc = "Resize Down" })

-- Buffer navigation
map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Previous Buffer" })

-- File Explorer
map("n", "<leader>e", "<cmd>Neotree toggle<cr>", { desc = "Explorer" })

-- LazyGit
map("n", "<leader>gg", "<cmd>LazyGit<cr>", { desc = "LazyGit" })

-- Trouble
map("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Diagnostics" })

-- Clear search highlight
map("n", "<Esc>", "<cmd>noh<cr>", { desc = "Clear Search Highlight" })
