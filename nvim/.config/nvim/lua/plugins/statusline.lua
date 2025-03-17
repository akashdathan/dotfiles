return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("lualine").setup({
      options = {
        theme = {
          normal = {
            a = { fg = '#B0B0B0', bg = 'NONE' },
            b = { fg = '#B0B0B0', bg = 'NONE' },
            c = { fg = '#B0B0B0', bg = 'NONE' },
          },
          inactive = {
            a = { fg = '#808080', bg = 'NONE' },
            b = { fg = '#808080', bg = 'NONE' },
            c = { fg = '#808080', bg = 'NONE' },
          },
        },
        component_separators = "",
        section_separators = "",
        globalstatus = true,
      },
      sections = {
        lualine_a = {},  -- Remove mode indicator
        lualine_b = { { "branch", icon = "" } },  -- Show git branch without icon
        lualine_c = { { "filename", path = 1 } },  -- Show relative file path
        lualine_x = { "filetype" },  -- Show only filetype
        lualine_y = {},  -- Remove progress
        lualine_z = {},  -- Remove location
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { { "filename", path = 1 } },
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
    })
  end,
} 