return {
  -- Remove or disable the existing colorscheme
  { "tokyonight", enabled = false },
  { "catppuccin", enabled = false },

  -- Add Kanagawa
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      -- Load the colorscheme here
      vim.cmd("colorscheme kanagawa-dragon")

      -- You can configure the plugin here
      require("kanagawa").setup({
        compile = false,
        undercurl = true,
        commentStyle = { italic = true },
        functionStyle = {},
        keywordStyle = { italic = false },
        statementStyle = { bold = false },
        typeStyle = {},
        transparent = false,
        dimInactive = false,
        terminalColors = true,
        colors = {
          palette = {},
          theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
        },
        overrides = function()
          return { ["@variable.builtin"] = { italic = false } }
        end,
        theme = "dragon",
        background = {
          dark = "dragon",
          light = "lotus",
        },
      })
    end,
  },
}
