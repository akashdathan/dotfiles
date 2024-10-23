-- plugins/colorscheme.lua
return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      flavour = "mocha",
      transparent_background = true,
      dim_inactive = {
        enabled = false,
      },
      styles = {
        comments = {},
        conditionals = {},
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
      },
      color_overrides = {
        mocha = {
          base = "#11111B",
          mantle = "#0F0F17",
          crust = "#0D0D15",
        },
      },
      highlight_overrides = {
        mocha = function(colors)
          return {
            -- Basic UI elements
            Normal = { fg = colors.text, bg = "NONE" },
            NormalFloat = { fg = colors.text, bg = "NONE" },

            -- Neo-tree specific colors
            NeoTreeNormal = { fg = colors.text, bg = "NONE" },
            NeoTreeNormalNC = { fg = colors.text, bg = "NONE" },
            NeoTreeDirectoryName = { fg = colors.text }, -- Changed to normal text color
            NeoTreeDirectoryIcon = { fg = colors.text }, -- Changed to normal text color
            NeoTreeRootName = { fg = colors.text }, -- Changed to normal text color
            NeoTreeFileName = { fg = colors.text },
            NeoTreeFileIcon = { fg = colors.text },
            NeoTreeIndentMarker = { fg = colors.overlay0 },
            NeoTreeGitAdded = { fg = colors.green },
            NeoTreeGitConflict = { fg = colors.red },
            NeoTreeGitDeleted = { fg = colors.red },
            NeoTreeGitIgnored = { fg = colors.overlay0 },
            NeoTreeGitModified = { fg = colors.yellow },
            NeoTreeGitUnstaged = { fg = colors.red },
            NeoTreeGitUntracked = { fg = colors.blue },
            NeoTreeTitleBar = { fg = colors.text, bg = "NONE" },

            -- Basic syntax colors
            Comment = { fg = colors.overlay0 },
            Function = { fg = colors.blue },
            String = { fg = colors.green },
            Keyword = { fg = colors.mauve },
            Type = { fg = colors.yellow },
          }
        end,
      },
      integrations = {
        telescope = true,
        mason = true,
        neotree = true,
        treesitter = true,
        native_lsp = {
          enabled = true,
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
        },
      },
    },
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
