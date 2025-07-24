-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- TypeScript/React Development Options
vim.g.autoformat = true

-- Enhanced file watching for web development
vim.opt.updatetime = 50
vim.opt.timeoutlen = 300

-- Better search for large codebases
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Better indentation for web development
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.autoindent = true

-- Line numbers and visual aids
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "80,120"

-- Better scrolling and viewport
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.wrap = false

-- File handling
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

-- Better completion
vim.opt.completeopt = "menu,menuone,noselect"
vim.opt.pumheight = 10

-- Terminal integration
vim.opt.shell = "/bin/zsh"
vim.opt.shellcmdflag = "-c"

-- Performance optimizations for large projects
vim.opt.synmaxcol = 240
vim.opt.lazyredraw = true
vim.opt.regexpengine = 1

-- TypeScript/JavaScript specific settings
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_python_provider = 0
vim.g.loaded_python3_provider = 0

-- File associations for web development
vim.filetype.add({
  extension = {
    conf = "conf",
    env = "dotenv",
    tiltfile = "tiltfile",
    ts = "typescript",
    tsx = "typescriptreact",
    js = "javascript",
    jsx = "javascriptreact",
    json = "jsonc",
    jsonc = "jsonc",
    vue = "vue",
    svelte = "svelte",
    astro = "astro",
  },
  filename = {
    [".env"] = "dotenv",
    [".env.local"] = "dotenv",
    [".env.development"] = "dotenv",
    [".env.test"] = "dotenv",
    [".env.production"] = "dotenv",
    ["tsconfig.json"] = "jsonc",
    ["jsconfig.json"] = "jsonc",
    [".eslintrc.json"] = "jsonc",
    [".prettierrc"] = "json",
    [".babelrc"] = "json",
    ["package.json"] = "jsonc",
    ["package-lock.json"] = "json",
    ["yarn.lock"] = "yaml",
    ["Dockerfile"] = "dockerfile",
    ["docker-compose.yml"] = "yaml",
    ["docker-compose.yaml"] = "yaml",
  },
  pattern = {
    [".*%.env%..*"] = "dotenv",
    [".*%.config%.js"] = "javascript",
    [".*%.config%.ts"] = "typescript",
    [".*%.test%.js"] = "javascript",
    [".*%.test%.ts"] = "typescript",
    [".*%.spec%.js"] = "javascript",
    [".*%.spec%.ts"] = "typescript",
    [".*%.d%.ts"] = "typescript",
  },
})

-- Disable certain providers for performance
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
