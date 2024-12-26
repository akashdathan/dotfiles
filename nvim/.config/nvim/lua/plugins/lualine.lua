return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "rose-pine/neovim", -- Using rose-pine theme here
  },
  opts = function()
    return {
      options = {
        theme = "rose-pine", -- Switch to Rose Pine theme
        globalstatus = true, -- Global statusline
        disabled_filetypes = { statusline = { "dashboard", "alpha" } },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch" },
        lualine_c = {
          {
            "diagnostics",
            symbols = {
              error = "",
              warn = "",
              info = "",
              hint = "",
            },
            color_error = "#eb6f92",  -- Customize error color (Rose Pine palette)
            color_warn = "#e5c07b",   -- Customize warning color (Rose Pine palette)
            color_info = "#61afef",   -- Customize info color (Rose Pine palette)
            color_hint = "#98c379",   -- Customize hint color (Rose Pine palette)
          },
          { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
          { "filename", path = 1, symbols = { modified = "  ", readonly = "", unnamed = "" } },
        },
        lualine_x = {
          {
            "diff",
            symbols = {
              added = " ",
              modified = " ",
              removed = " ",
            },
          },
        },
        lualine_y = {
          { "progress", separator = " ", padding = { left = 1, right = 0 } },
          { "location", padding = { left = 0, right = 1 } },
        },
        lualine_z = {
          function()
            return " " .. os.date("%R") -- Time format for the right side
          end,
        },
      },
      extensions = { "neo-tree", "lazy" },
    }
  end,
}
