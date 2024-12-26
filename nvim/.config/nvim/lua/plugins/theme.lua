return {
  "rose-pine/neovim",
  name = "rose-pine",
  config = function()
    require("rose-pine").setup({
      disable_italics = true, -- Disable italics
      dark_variant = "main", -- Use a softer, cooler variant
      highlight_groups = {
        Comment = { fg = "overlay", italic = false },
        Keyword = { fg = "subtle" },
        Function = { fg = "text" },
        Identifier = { fg = "text" },
        String = { fg = "muted" },
      },
    })
    vim.cmd("colorscheme rose-pine")
  end,
}
