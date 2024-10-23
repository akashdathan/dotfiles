-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<leader>w", ":wa<CR>", { desc = "Save all files" })

vim.keymap.set("n", "<CR>", "o<Esc>", { desc = "Add new line below" })
vim.keymap.set("n", "<S-CR>", "O<Esc>", { desc = "Add new line above" })

vim.keymap.set("n", "K", ":lua vim.lsp.buf.hover()<CR>", { desc = "Show hover information" })

-- TypeScript specific mappings
vim.keymap.set("n", "<leader>ti", ":TypescriptAddMissingImports<CR>", { desc = "Add missing imports" })
vim.keymap.set("n", "<leader>to", ":TypescriptOrganizeImports<CR>", { desc = "Organize imports" })
vim.keymap.set("n", "<leader>tf", ":TypescriptFixAll<CR>", { desc = "Fix all" })

-- Buffer navigation
vim.keymap.set("n", "<Tab>", ":bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", { desc = "Previous buffer" })
