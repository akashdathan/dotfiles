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

    -- Dimmer floating window borders
    vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#505050" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "FloatTitle", { fg = "#606060" })

    -- Telescope specific highlights for dimmer borders
    vim.api.nvim_set_hl(0, "TelescopeBorder", { fg = "#505050" })
    vim.api.nvim_set_hl(0, "TelescopePromptBorder", { fg = "#505050" })
    vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { fg = "#505050" })
    vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { fg = "#505050" })

    -- Additional floating window and finder highlights
    vim.api.nvim_set_hl(0, "FzfLuaBorder", { fg = "#505050" })
    vim.api.nvim_set_hl(0, "WhichKeyBorder", { fg = "#505050" })
    vim.api.nvim_set_hl(0, "PopupBorder", { fg = "#505050" })
    vim.api.nvim_set_hl(0, "BorderBG", { fg = "#505050" })
    vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#505050" })
    
    -- Make sure all border types are covered
    vim.api.nvim_set_hl(0, "VertSplit", { fg = "#505050" })
    vim.api.nvim_set_hl(0, "StatusLineNC", { fg = "#505050", bg = "NONE" })
  end,
}
