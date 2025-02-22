print("Hello from nvim/after/plugin/colorscheme.lua")
local setup, _ = pcall(require, "vim-nightfly-colors")
if not setup then
    print("Failed to load vim-nightfly-colors.")
end

local status, _ = pcall(vim.cmd, "colorscheme nightfly")
if not status then
    print("Failed to set the colorscheme.")
end
