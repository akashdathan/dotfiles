return {
  "nvimdev/dashboard-nvim",
  event = "VimEnter",
  opts = function()
    local opts = {
      theme = "doom",
      hide = {
        statusline = false,
      },
      config = {
        header = {
          "",
        },
        center = {
          { action = "Telescope find_files", desc = " Find file", icon = " ", key = "f" },
          { action = "ene | startinsert", desc = " New file", icon = " ", key = "n" },
          { action = "Telescope oldfiles", desc = " Recent files", icon = " ", key = "r" },
          { action = "Telescope live_grep", desc = " Find text", icon = " ", key = "g" },
          { action = "e $MYVIMRC", desc = " Config", icon = " ", key = "c" },
          {
            action = "lua require('lazyvim.util').telescope.config_files()()",
            desc = " Config files",
            icon = " ",
            key = "C",
          },
          { action = "qa", desc = " Quit", icon = " ", key = "q" },
        },
      },
    }

    -- Center all content
    local function center_content(content)
      local lines = vim.fn.winheight(0)
      local max_content_height = #content.center
      local padding = math.floor((lines - max_content_height) / 2)

      -- Add padding to the top
      for _ = 1, padding do
        table.insert(content.header, 1, "")
      end
    end

    center_content(opts.config)

    for _, button in ipairs(opts.config.center) do
      button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
      button.key_format = "  %s"
    end

    return opts
  end,
}
