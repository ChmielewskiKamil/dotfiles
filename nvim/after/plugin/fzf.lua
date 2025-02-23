local function build_fzf_native()
    local plugin_path = vim.fn.stdpath("data") .. "/site/pack/git_submodules/start/telescope-fzf-native.nvim"

    if vim.fn.isdirectory(plugin_path) == 1 then
        vim.cmd("!make -C " .. plugin_path)
        print("Built telescope-fzf-native.nvim successfully!")
    else
        print("telescope-fzf-native.nvim not found at: " .. plugin_path)
    end
end

build_fzf_native()
