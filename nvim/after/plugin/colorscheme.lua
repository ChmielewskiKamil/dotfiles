print("Hello from nvim/after/plugin/colorscheme.lua")
local status, _ = pcall(vim.cmd, "colorscheme nightfly")
if not status then
    print("Colorscheme not found!")
end
