return {
  "Mofiqul/vscode.nvim",
  name = "vscode",
  priority = 1000,
  config = function()
    -- Enable dark theme specifically to get Dark+
    vim.o.background = 'dark'
    
    require("vscode").setup({
      -- Dark+ is the default dark style
      style = "dark",
      
      -- Enable terminal colors
      terminal_colors = true,
      
      -- Italics for comments
      italic_comments = true,
      
      -- Native window border
      transparent = false,
      
      -- Better contrast
      contrast = true,
      
      -- Override specific colors for brightness
      color_overrides = {
        -- Brighter editor colors
        vscCursorDark = "#AEAFAD",
        vscSelection = "#264F78",
      },
    })

    -- Set up the colorscheme
    vim.cmd.colorscheme "vscode"

    -- Custom NeoTree colors (dimmer)
    vim.api.nvim_set_hl(0, "NeoTreeDirectoryName", { fg = "#B0B0B0" })  -- Folder name color (brighter grey)
    vim.api.nvim_set_hl(0, "NeoTreeDirectoryIcon", { fg = "#B0B0B0" })  -- Folder icon color
    vim.api.nvim_set_hl(0, "NeoTreeRootName", { fg = "#B0B0B0", bold = true })  -- Root folder name
    vim.api.nvim_set_hl(0, "NeoTreeFileName", { fg = "#C0C0C0" })  -- File name color (brighter grey)
    vim.api.nvim_set_hl(0, "NeoTreeFileIcon", { fg = "#808080" })  -- File icon color
    vim.api.nvim_set_hl(0, "NeoTreeIndentMarker", { fg = "#505050" })  -- Tree indent markers (very dim)
  end,
}
