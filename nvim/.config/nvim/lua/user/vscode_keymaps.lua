local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Helper function for VSCode actions
local function vs_action(action)
    return string.format("<cmd>lua require('vscode').action('%s')<CR>", action)
end

-- Remap leader key
keymap("n", "<Space>", "", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Yank/Paste system clipboard
keymap({ "n", "v" }, "<leader>y", '"+y', opts)
keymap({ "n", "v" }, "<leader>p", '"+p', opts)

-- Better indent handling
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)

-- Preserve yanked text during paste
keymap("v", "p", '"_dP', opts)

-- Remove search highlights
keymap("n", "<Esc>", "<Esc>:noh<CR>", opts)

-- VSCode General Keymaps
keymap({ "n", "v" }, "<leader>t", vs_action("workbench.action.terminal.toggleTerminal"), opts)
keymap({ "n", "v" }, "<leader>b", vs_action("editor.debug.action.toggleBreakpoint"), opts)
keymap({ "n", "v" }, "<leader>d", vs_action("editor.action.showHover"), opts)
keymap({ "n", "v" }, "<leader>a", vs_action("editor.action.quickFix"), opts)
keymap({ "n", "v" }, "<leader>sp", vs_action("workbench.actions.view.problems"), opts)
keymap({ "n", "v" }, "<leader>cn", vs_action("notifications.clearAll"), opts)
keymap({ "n", "v" }, "<leader>ff", vs_action("workbench.action.quickOpen"), opts)
keymap({ "n", "v" }, "<leader>cp", vs_action("workbench.action.showCommands"), opts)
keymap({ "n", "v" }, "<leader>pr", vs_action("code-runner.run"), opts)
keymap({ "n", "v" }, "<leader>fd", vs_action("editor.action.formatDocument"), opts)

-- Harpoon Keymaps
local harpoon_prefix = "vscode-harpoon"
keymap({ "n", "v" }, "<leader>ha", vs_action(harpoon_prefix .. ".addEditor"), opts)
keymap({ "n", "v" }, "<leader>ho", vs_action(harpoon_prefix .. ".editorQuickPick"), opts)
keymap({ "n", "v" }, "<leader>he", vs_action(harpoon_prefix .. ".editEditors"), opts)

for i = 1, 9 do
    keymap({ "n", "v" }, string.format("<leader>h%d", i), vs_action(string.format("%s.gotoEditor%d", harpoon_prefix, i)), opts)
end

-- Project Manager Keymaps
keymap({ "n", "v" }, "<leader>pa", vs_action("projectManager.saveProject"), opts)
keymap({ "n", "v" }, "<leader>po", vs_action("projectManager.listProjectsNewWindow"), opts)
keymap({ "n", "v" }, "<leader>pe", vs_action("projectManager.editProjects"), opts)
