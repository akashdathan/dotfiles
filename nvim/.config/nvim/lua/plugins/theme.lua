return {
  "rose-pine/neovim",
  name = "rose-pine",
  config = function()
    require("rose-pine").setup({
      disable_italics = true, -- Disable italics
      dark_variant = "main", -- Use a softer, cooler variant
    })

    vim.cmd("colorscheme rose-pine")
  end,
}
