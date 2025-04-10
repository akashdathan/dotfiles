return {
  {
    'Mofiqul/vscode.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      local c = require('vscode.colors').get_colors()
      require('vscode').setup({
        -- Enable transparent background
        transparent = false,
        -- Enable italic comments
        italic_comments = true,
        -- Disable nvim-tree background color
        disable_nvimtree_bg = true,
        -- Override colors (see ./lua/vscode/colors.lua)
        color_overrides = {
        --   vscLineNumber = '#FFFFFF',
        },
      })
      require('vscode').load()
    end,
  }
}
