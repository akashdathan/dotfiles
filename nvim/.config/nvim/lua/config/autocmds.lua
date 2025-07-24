-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- TypeScript/React Development Autocmds
local function augroup(name)
  return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

-- Auto format on save for TypeScript/JavaScript files
vim.api.nvim_create_autocmd("BufWritePre", {
  group = augroup("format_on_save"),
  pattern = { "*.ts", "*.tsx", "*.js", "*.jsx", "*.json", "*.jsonc" },
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})

-- Auto organize imports on save for TypeScript files
vim.api.nvim_create_autocmd("BufWritePre", {
  group = augroup("organize_imports"),
  pattern = { "*.ts", "*.tsx" },
  callback = function()
    local params = {
      command = "_typescript.organizeImports",
      arguments = { vim.api.nvim_buf_get_name(0) },
      title = "",
    }
    vim.lsp.buf.execute_command(params)
  end,
})

-- Auto-remove unused imports for TypeScript files
vim.api.nvim_create_autocmd("BufWritePre", {
  group = augroup("remove_unused_imports"),
  pattern = { "*.ts", "*.tsx" },
  callback = function()
    local params = {
      command = "_typescript.removeUnusedImports",
      arguments = { vim.api.nvim_buf_get_name(0) },
      title = "",
    }
    vim.lsp.buf.execute_command(params)
  end,
})

-- Set specific options for TypeScript/JavaScript files
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("typescript_options"),
  pattern = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.expandtab = true
    vim.opt_local.smartindent = true
    vim.opt_local.colorcolumn = "80,120"
  end,
})

-- Set specific options for JSON files
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("json_options"),
  pattern = { "json", "jsonc" },
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.expandtab = true
    vim.opt_local.conceallevel = 0
  end,
})

-- Auto-reload when package.json changes
vim.api.nvim_create_autocmd("BufWritePost", {
  group = augroup("reload_package_json"),
  pattern = { "package.json" },
  callback = function()
    vim.notify("package.json updated", vim.log.levels.INFO)
    -- Optionally restart LSP servers
    vim.cmd("LspRestart")
  end,
})

-- Auto-close terminal when process exits
vim.api.nvim_create_autocmd("TermClose", {
  group = augroup("close_terminal"),
  callback = function()
    vim.schedule(function()
      if vim.v.event.status == 0 then
        vim.api.nvim_buf_delete(0, { force = true })
      end
    end)
  end,
})

-- Highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup("highlight_yank"),
  callback = function()
    vim.highlight.on_yank({ timeout = 200 })
  end,
})

-- Auto-resize splits when window is resized
vim.api.nvim_create_autocmd("VimResized", {
  group = augroup("resize_splits"),
  callback = function()
    vim.cmd("tabdo wincmd =")
  end,
})

-- Set up specific settings for HTTP files (for REST client)
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("http_options"),
  pattern = { "http" },
  callback = function()
    vim.opt_local.wrap = false
    vim.opt_local.number = true
    vim.opt_local.relativenumber = false
  end,
})

-- Auto-change directory to project root when opening files
vim.api.nvim_create_autocmd("BufEnter", {
  group = augroup("auto_root"),
  callback = function()
    local root_patterns = { ".git", "package.json", "tsconfig.json", "node_modules" }
    local current_file = vim.api.nvim_buf_get_name(0)
    
    if current_file ~= "" and vim.fn.filereadable(current_file) == 1 then
      local current_dir = vim.fn.fnamemodify(current_file, ":h")
      local root_dir = vim.fs.find(root_patterns, { path = current_dir, upward = true })[1]
      
      if root_dir then
        local project_root = vim.fn.fnamemodify(root_dir, ":h")
        if project_root ~= vim.fn.getcwd() then
          vim.cmd("cd " .. project_root)
        end
      end
    end
  end,
})

-- Show diagnostics in hover window
vim.api.nvim_create_autocmd("CursorHold", {
  group = augroup("show_diagnostics"),
  callback = function()
    if vim.fn.pumvisible() == 0 then
      vim.diagnostic.open_float(nil, { focusable = false, scope = "cursor" })
    end
  end,
})

-- Set up file watchers for common config files
vim.api.nvim_create_autocmd("BufWritePost", {
  group = augroup("config_reload"),
  pattern = { 
    "*.config.js", 
    "*.config.ts", 
    ".eslintrc*", 
    ".prettierrc*", 
    "tsconfig.json", 
    "jsconfig.json",
    "tailwind.config.*",
    "next.config.*",
    "vite.config.*",
    "webpack.config.*"
  },
  callback = function()
    vim.notify("Config file updated - you may need to restart your dev server", vim.log.levels.WARN)
  end,
})
