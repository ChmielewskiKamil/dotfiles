print("Hello from nvim/after/plugin/colorscheme.lua")

local status, _ = pcall(function ()
    vim.cmd.colorscheme("nightfly")

    -- transparent background
    -- vim.api.nvim_set_hl(0, "normal", { bg = "none" })
    -- vim.api.nvim_set_hl(0, "normalFloat", { bg = "none" })
end)
if not status then
    print("Colorscheme not found!")
end
