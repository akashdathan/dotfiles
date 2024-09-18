return {
  -- Other plugins...

  -- LazyGit plugin
  {
    "kdheepak/lazygit.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      vim.api.nvim_set_keymap("n", "<leader>gg", ":LazyGit<CR>", { noremap = true, silent = true })
    end,
  },
}
