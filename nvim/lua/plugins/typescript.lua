-- TypeScript and React specific plugins
return {
  -- Import LazyVim TypeScript extras
  { import = "lazyvim.plugins.extras.lang.typescript" },
  
  -- Import JSON support for package.json and other config files
  { import = "lazyvim.plugins.extras.lang.json" },
  
  -- Import tailwind CSS support (useful for React)
  { import = "lazyvim.plugins.extras.lang.tailwind" },

  -- Enhanced TypeScript support with additional keybindings
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- TypeScript server configuration
        tsserver = {
          settings = {
            typescript = {
              inlayHints = {
                includeInlayParameterNameHints = "literal",
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = false,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
              },
            },
            javascript = {
              inlayHints = {
                includeInlayParameterNameHints = "all",
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
              },
            },
          },
        },
      },
    },
  },

  -- Enhanced treesitter configuration for web development
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "css",
        "html",
        "javascript",
        "jsdoc",
        "json",
        "jsonc",
        "lua",
        "markdown",
        "markdown_inline",
        "prisma",
        "python",
        "query",
        "regex",
        "scss",
        "tsx",
        "typescript",
        "vim",
        "yaml",
      },
    },
  },

  -- Package.json support for better dependency management
  {
    "vuki656/package-info.nvim",
    dependencies = "MunifTanjim/nui.nvim",
    opts = {},
    event = { "BufRead package.json" },
  },

  -- Enhanced React development with snippets and better JSX support
  {
    "windwp/nvim-ts-autotag",
    opts = {},
    event = { "BufReadPost", "BufNewFile" },
  },

  -- Better comment support for JSX
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    opts = {
      enable_autocmd = false,
    },
  },
} 