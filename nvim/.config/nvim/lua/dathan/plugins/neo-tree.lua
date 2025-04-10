return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  cmd = "Neotree",
  keys = {
    { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "Toggle Explorer" },
  },
  config = function()
    -- Apply grayscale devicons
    local grayscale_devicons = function()
      local devicons = require("nvim-web-devicons")
      
      -- Create a backup of the original setup if needed
      if not devicons._original_setup then
        devicons._original_setup = devicons.setup
      end
      
      -- Override setup to apply grayscale
      devicons.setup = function(opts)
        devicons._original_setup(opts)
        
        -- Apply grayscale to all icons
        for _, icon_data in pairs(devicons.get_icons()) do
          icon_data.color = "#888888" -- Brighter grayscale color
        end
      end
      
      -- Apply immediately
      devicons.setup({})
    end
    
    -- Apply grayscale to icons
    grayscale_devicons()
    
    -- Define highlight function for Neo-tree
    local function set_neo_tree_highlights()
      vim.api.nvim_set_hl(0, "NeoTreeNormal", { fg = "#aaaaaa", bg = "NONE" })
      vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { fg = "#aaaaaa", bg = "NONE" })
      vim.api.nvim_set_hl(0, "NeoTreeDirectoryName", { fg = "#999999", bg = "NONE" })
      vim.api.nvim_set_hl(0, "NeoTreeDirectoryIcon", { fg = "#888888", bg = "NONE" })
      vim.api.nvim_set_hl(0, "NeoTreeFileIcon", { fg = "#888888", bg = "NONE" })
      vim.api.nvim_set_hl(0, "NeoTreeRootName", { fg = "#888888", bg = "NONE" })
      vim.api.nvim_set_hl(0, "NeoTreeIndentMarker", { fg = "#555555", bg = "NONE" })
      
      -- Git status highlights
      vim.api.nvim_set_hl(0, "NeoTreeGitModified", { fg = "#e5c07b", bg = "NONE", bold = true })
      vim.api.nvim_set_hl(0, "NeoTreeGitAdded", { fg = "#98c379", bg = "NONE", bold = true })
      vim.api.nvim_set_hl(0, "NeoTreeGitUntracked", { fg = "#7bc0a9", bg = "NONE", bold = true })
      vim.api.nvim_set_hl(0, "NeoTreeGitDeleted", { fg = "#e06c75", bg = "NONE", bold = true })
      vim.api.nvim_set_hl(0, "NeoTreeGitRenamed", { fg = "#61afef", bg = "NONE", bold = true })
      vim.api.nvim_set_hl(0, "NeoTreeGitConflict", { fg = "#c678dd", bg = "NONE", bold = true })
      
      -- Empty cursor highlight
      vim.api.nvim_set_hl(0, "NeoTreeEmptyCursor", { fg = "NONE", bg = "NONE", blend = 100 })
    end
    
    -- Set highlights immediately
    set_neo_tree_highlights()
    
    -- Update highlights on colorscheme change
    vim.api.nvim_create_autocmd("ColorScheme", {
      callback = set_neo_tree_highlights,
    })
  
    require("neo-tree").setup({
      close_if_last_window = true,
      enable_git_status = true,
      enable_diagnostics = false,
      window = {
        width = 40,
        mappings = {
          ["<cr>"] = "open",
          ["l"] = "open",
          ["h"] = "close_node",
          ["o"] = "open",
          ["a"] = "add",
          ["A"] = "add_directory",
          ["d"] = "delete",
          ["r"] = "rename",
          ["y"] = "copy_to_clipboard",
          ["x"] = "cut_to_clipboard",
          ["p"] = "paste_from_clipboard",
          ["R"] = "refresh",
        },
      },
      default_component_configs = {
        icon = {
          folder_closed = "󰉖",
          folder_open = "󰝰",
          folder_empty = "󰉖",
          default = "",
        },
        git_status = {
          symbols = {
            added = "✚",
            modified = "●",
            deleted = "✖",
            renamed = "➜",
            untracked = "★",
            ignored = "◌",
            unstaged = "✗",
            staged = "✓",
            conflict = "!",
          },
        },
        indent = {
          indent_size = 2,
          padding = 1,
          -- Indent markers
          with_markers = true,
          indent_marker = "│",
          last_indent_marker = "└",
          highlight = "NeoTreeIndentMarker",
          with_expanders = false,
        },
      },
      source_selector = {
        winbar = false,
        statusline = false,
      },
      -- Hide cursor in Neo-tree window
      event_handlers = {
        {
          event = "neo_tree_buffer_enter",
          handler = function()
            vim.g.original_guicursor = vim.opt.guicursor:get()
            vim.opt_local.guicursor = "a:NeoTreeEmptyCursor"
          end,
        },
        {
          event = "neo_tree_buffer_leave",
          handler = function()
            vim.opt_local.guicursor = vim.g.original_guicursor or "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20"
          end,
        },
      },
      filesystem = {
        filtered_items = {
          visible = false,
          hide_dotfiles = false,
          hide_gitignored = false,
          hide_hidden = false,
          hide_by_name = {
            ".git",
            "node_modules",
            ".DS_Store",
            ".cache",
            "dist",
            "target",
            "build",
            ".idea",
            ".vscode",
          },
        },
        follow_current_file = {
          enabled = true,
        },
        hijack_netrw_behavior = "open_default",
        use_libuv_file_watcher = true,
      },
    })
    
    -- Disable netrw
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
  end,
}
