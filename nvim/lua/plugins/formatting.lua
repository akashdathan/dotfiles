-- Formatting and linting plugins
return {
  -- Import formatting and linting extras
  { import = "lazyvim.plugins.extras.formatting.prettier" },
  { import = "lazyvim.plugins.extras.linting.eslint" },

  -- Mason configuration for development tools
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "bash-language-server",
        "css-lsp",
        "eslint-lsp",
        "html-lsp",
        "json-lsp",
        "lua-language-server",
        "prettier",
        "prisma-language-server",
        "stylua",
        "tailwindcss-language-server",
        "typescript-language-server",
        "vue-language-server",
      },
    },
  },
} 