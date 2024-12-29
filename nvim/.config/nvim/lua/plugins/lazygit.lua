return {
  -- Other plugins...
  -- LazyGit plugin
  {
    "kdheepak/lazygit.nvim",
    requires = {
      "nvim-lua/plenary.nvim", -- Ensure plenary is installed
    },
    config = function()
      -- Use vim.keymap.set for key mapping (modern Neovim API)
      vim.keymap.set("n", "<leader>gg", ":LazyGit<CR>", { noremap = true, silent = true })
    end,
  },
}
