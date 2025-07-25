-- VS Code Dark Modern Theme Configuration
return {
  {
    "rockyzhang24/arctic.nvim",
    branch = "v2",
    dependencies = { "rktjmp/lush.nvim" },
    lazy = false,
    priority = 1000,
    config = function()
      -- arctic.nvim v2 branch is specifically for VS Code Dark Modern
      vim.cmd("colorscheme arctic")
    end,
  },

  -- Configure LazyVim to use the VS Code Dark Modern theme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "arctic",
    },
  },

  -- Configure lualine to use a compatible theme
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        theme = "auto", -- Will automatically match the arctic theme
      },
    },
  },
} 