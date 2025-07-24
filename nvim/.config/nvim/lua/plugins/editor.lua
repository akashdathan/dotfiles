-- Editor enhancements and navigation
return {
  -- Enhanced telescope for better project navigation
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      -- Add keymap to find files in node_modules
      {
        "<leader>fN",
        function()
          require("telescope.builtin").find_files({ cwd = "node_modules" })
        end,
        desc = "Find in node_modules",
      },
    },
    opts = {
      defaults = {
        file_ignore_patterns = {
          "node_modules",
          ".git",
          "dist",
          "build",
          ".next",
          ".nuxt",
          "coverage",
        },
      },
    },
  },

  -- Enhanced completion for web development
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-emoji",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
    },
    opts = function(_, opts)
      table.insert(opts.sources, { name = "emoji" })
      table.insert(opts.sources, { name = "path" })
    end,
  },

  -- File tree enhancements for web development
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          hide_gitignored = false,
          hide_by_name = {
            "node_modules",
            ".git",
            ".DS_Store",
            "thumbs.db",
          },
        },
      },
    },
  },
} 