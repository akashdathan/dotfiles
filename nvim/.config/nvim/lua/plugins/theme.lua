return {
  -- Remove or disable the existing colorscheme
  { "tokyonight", enabled = false },
  { "catppuccin", enabled = false },

  -- Add Kanagawa
  {
    "projekt0n/github-nvim-theme",
    name = "github-theme",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require("github-theme").setup({
        -- ...
      })

      vim.cmd("colorscheme github_dark_default")
    end,
  },
}
