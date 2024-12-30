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

-- Window management
keymap("n", "<leader>ws", vs_action("workbench.action.splitEditorRight"), opts)        -- Split right

-- Buffer management
keymap("n", "<leader>bp", vs_action("workbench.action.previousEditor"), opts)         -- Previous buffer
keymap("n", "<leader>bn", vs_action("workbench.action.nextEditor"), opts)             -- Next buffer
keymap("n", "<S-h>", vs_action("workbench.action.previousEditor"), opts)              -- Previous buffer
keymap("n", "<S-l>", vs_action("workbench.action.nextEditor"), opts)                  -- Next buffer

-- Search and Replace
keymap("n", "<leader>sr", vs_action("editor.action.startFindReplaceAction"), opts)    -- Search and replace
keymap("n", "<leader>sw", vs_action("editor.action.changeAll"), opts)                 -- Change all occurrences
keymap("n", "<leader>/", vs_action("editor.action.commentLine"), opts)                -- Toggle comment

-- Code navigation and actions
keymap("n", "K", vs_action("editor.action.showHover"), opts)                          -- Hover documentation
keymap("n", "<leader>cs", vs_action("workbench.action.gotoSymbol"), opts)            -- Document symbols
keymap("n", "<leader>cS", vs_action("workbench.action.showAllSymbols"), opts)        -- Workspace symbols
keymap("n", "<leader>e", vs_action("workbench.view.explorer"), opts)                  -- Toggle explorer
keymap("n", "<leader>E", vs_action("workbench.action.toggleSidebarVisibility"), opts) -- Toggle sidebar

-- Add new line without entering insert mode
keymap("n", "<CR>", "o<Esc>", opts)                                                   -- Add line below
keymap("n", "<S-CR>", "O<Esc>", opts)                                                -- Add line above (if supported by terminal)

-- Additional code navigation inspired by LazyVim
keymap({ "n", "v" }, "<leader>cl", vs_action("editor.action.showDefinitionPreviewHover"), opts) -- Line diagnostics
keymap({ "n", "v" }, "gi", vs_action("editor.action.goToImplementation"), opts)                 -- Go to implementation
keymap({ "n", "v" }, "gy", vs_action("editor.action.goToTypeDefinition"), opts)                 -- Go to type definition
keymap({ "n", "v" }, "<leader>co", vs_action("editor.action.organizeImports"), opts)            -- Organize imports

keymap({ "n", "v" }, "gr", vs_action("editor.action.goToReferences"), opts)           -- Go to references
keymap({ "n", "v" }, "gd", vs_action("editor.action.revealDefinition"), opts)         -- Go to definition
keymap({ "n", "v" }, "<leader>rn", vs_action("editor.action.rename"), opts)           -- Rename symbol
keymap({ "n", "v" }, "<leader>ca", vs_action("editor.action.codeAction"), opts)       -- Code actions
keymap({ "n", "v" }, "<leader>fs", vs_action("workbench.action.findInFiles"), opts)   -- Find in files

keymap({ "n", "v" }, "ge", vs_action("editor.action.marker.next"), opts)              -- Go to next error
keymap({ "n", "v" }, "gE", vs_action("editor.action.marker.prev"), opts)              -- Go to previous error
keymap({ "n", "v" }, "gn", vs_action("workbench.action.editor.nextChange"), opts)     -- Go to next git change
keymap({ "n", "v" }, "gN", vs_action("workbench.action.editor.previousChange"), opts)  -- Go to previous git change

-- Git keymaps
keymap("n", "<leader>gg", vs_action("workbench.view.scm"), opts)                      -- Open source control
keymap("n", "<leader>gj", vs_action("workbench.action.editor.nextChange"), opts)      -- Next change
keymap("n", "<leader>gk", vs_action("workbench.action.editor.previousChange"), opts)  -- Previous change
keymap("n", "<leader>gl", vs_action("git.openChange"), opts)                          -- Open changed file
keymap("n", "<leader>gL", vs_action("git.openFileInRemote"), opts)                    -- Open in remote
keymap("n", "<leader>gh", vs_action("gitlens.showQuickFileHistory"), opts)           -- File history (needs GitLens)

-- LSP
keymap("n", "<leader>ca", vs_action("editor.action.sourceAction"), opts)              -- Code actions
keymap("n", "<leader>cf", vs_action("editor.action.formatDocument"), opts)            -- Format document
keymap("n", "<leader>cr", vs_action("editor.action.rename"), opts)                    -- Rename

-- UI toggles
keymap("n", "<leader>uz", vs_action("workbench.action.toggleZenMode"), opts)          -- Toggle zen mode

-- Window/Pane navigation
keymap("n", "<C-h>", vs_action("workbench.action.focusLeftGroup"), opts)            -- Move to left pane
keymap("n", "<C-l>", vs_action("workbench.action.focusRightGroup"), opts)           -- Move to right pane

-- Explorer (already have <leader>e but adding focus)
keymap("n", "<leader>e", vs_action("workbench.explorer.fileView.focus"), opts)     -- Focus on explorer

-- Search
keymap({ "n", "v" }, "<leader>sg", vs_action("workbench.action.findInFiles"), opts)   -- Global search
keymap("n", "<leader>sl", vs_action("workbench.action.focusSearchEditor"), opts)         -- Focus on search results
keymap("n", "<C-k>", vs_action("search.action.focusNextSearchResult"), opts)             -- Next search result
keymap("n", "<C-j>", vs_action("search.action.focusPreviousSearchResult"), opts)         -- Previous search result
