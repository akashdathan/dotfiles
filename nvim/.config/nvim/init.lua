
if vim.g.vscode then
    -- VSCode Neovim
    require "user.vscode_keymaps"
    require "plugins.hop"
else
    -- Ordinary Neovim
    require("config.lazy")
    require("plugins.lazygit")

    vim.cmd("language en_US")
end