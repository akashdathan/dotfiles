-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- TypeScript/React Development Keymaps
vim.keymap.set("n", "<leader>co", "<cmd>TypescriptOrganizeImports<cr>", { desc = "Organize Imports" })
vim.keymap.set("n", "<leader>cR", "<cmd>TypescriptRenameFile<cr>", { desc = "Rename File" })
vim.keymap.set("n", "<leader>cu", "<cmd>TypescriptRemoveUnused<cr>", { desc = "Remove Unused Imports" })
vim.keymap.set("n", "<leader>cF", "<cmd>TypescriptFixAll<cr>", { desc = "Fix All" })
vim.keymap.set("n", "<leader>cA", "<cmd>TypescriptAddMissingImports<cr>", { desc = "Add Missing Imports" })

-- Package.json management
vim.keymap.set("n", "<leader>ns", "<cmd>lua require('package-info').show()<cr>", { desc = "Show Package Info" })
vim.keymap.set("n", "<leader>nh", "<cmd>lua require('package-info').hide()<cr>", { desc = "Hide Package Info" })
vim.keymap.set("n", "<leader>nt", "<cmd>lua require('package-info').toggle()<cr>", { desc = "Toggle Package Info" })
vim.keymap.set("n", "<leader>nu", "<cmd>lua require('package-info').update()<cr>", { desc = "Update Package" })
vim.keymap.set("n", "<leader>nd", "<cmd>lua require('package-info').delete()<cr>", { desc = "Delete Package" })
vim.keymap.set("n", "<leader>ni", "<cmd>lua require('package-info').install()<cr>", { desc = "Install Package" })
vim.keymap.set("n", "<leader>np", "<cmd>lua require('package-info').change_version()<cr>", { desc = "Change Package Version" })

-- Terminal shortcuts for web development
vim.keymap.set("n", "<leader>tn", "<cmd>ToggleTerm direction=horizontal<cr>", { desc = "Toggle Terminal" })
vim.keymap.set("n", "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", { desc = "Toggle Float Terminal" })
vim.keymap.set("n", "<leader>tv", "<cmd>ToggleTerm direction=vertical<cr>", { desc = "Toggle Vertical Terminal" })

-- Quick commands for common development tasks
vim.keymap.set("n", "<leader>rs", "<cmd>TermExec cmd='npm start'<cr>", { desc = "Start Dev Server" })
vim.keymap.set("n", "<leader>rb", "<cmd>TermExec cmd='npm run build'<cr>", { desc = "Build Project" })
vim.keymap.set("n", "<leader>rt", "<cmd>TermExec cmd='npm test'<cr>", { desc = "Run Tests" })
vim.keymap.set("n", "<leader>rd", "<cmd>TermExec cmd='npm run dev'<cr>", { desc = "Run Dev Command" })
vim.keymap.set("n", "<leader>rl", "<cmd>TermExec cmd='npm run lint'<cr>", { desc = "Run Linter" })
vim.keymap.set("n", "<leader>rp", "<cmd>TermExec cmd='npm run prettier'<cr>", { desc = "Run Prettier" })

-- REST client shortcuts
vim.keymap.set("n", "<leader>rr", "<Plug>RestNvim", { desc = "Run REST request" })
vim.keymap.set("n", "<leader>rp", "<Plug>RestNvimPreview", { desc = "Preview REST request" })
vim.keymap.set("n", "<leader>rl", "<Plug>RestNvimLast", { desc = "Re-run last REST request" })

-- Enhanced navigation for web development
vim.keymap.set("n", "<leader>fc", "<cmd>Telescope find_files search_dirs={'./','.vscode','src','public'}<cr>", { desc = "Find Config Files" })
vim.keymap.set("n", "<leader>ft", "<cmd>Telescope find_files search_dirs={'./src','./components','./pages'}<cr>", { desc = "Find TypeScript/React Files" })
vim.keymap.set("n", "<leader>fs", "<cmd>Telescope find_files search_dirs={'./src'}<cr>", { desc = "Find in Source" })
vim.keymap.set("n", "<leader>fC", "<cmd>Telescope find_files search_dirs={'./components'}<cr>", { desc = "Find Components" })
vim.keymap.set("n", "<leader>fP", "<cmd>Telescope find_files search_dirs={'./pages','./app'}<cr>", { desc = "Find Pages/Routes" })

-- Git shortcuts for web development workflow
vim.keymap.set("n", "<leader>gf", "<cmd>Telescope git_files<cr>", { desc = "Find Git Files" })
vim.keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>", { desc = "Git Commits" })
vim.keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>", { desc = "Git Branches" })
vim.keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>", { desc = "Git Status" })

-- LSP shortcuts specifically for TypeScript
vim.keymap.set("n", "<leader>li", "<cmd>LspInfo<cr>", { desc = "LSP Info" })
vim.keymap.set("n", "<leader>lr", "<cmd>LspRestart<cr>", { desc = "LSP Restart" })
vim.keymap.set("n", "<leader>lh", "<cmd>lua vim.lsp.buf.hover()<cr>", { desc = "LSP Hover" })
vim.keymap.set("n", "<leader>ld", "<cmd>lua vim.lsp.buf.definition()<cr>", { desc = "Go to Definition" })
vim.keymap.set("n", "<leader>lD", "<cmd>lua vim.lsp.buf.declaration()<cr>", { desc = "Go to Declaration" })
vim.keymap.set("n", "<leader>lR", "<cmd>lua vim.lsp.buf.references()<cr>", { desc = "Find References" })
vim.keymap.set("n", "<leader>lI", "<cmd>lua vim.lsp.buf.implementation()<cr>", { desc = "Go to Implementation" })
vim.keymap.set("n", "<leader>lt", "<cmd>lua vim.lsp.buf.type_definition()<cr>", { desc = "Go to Type Definition" })
