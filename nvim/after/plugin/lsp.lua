require('mason').setup()
require('mason-lspconfig').setup {
    ensure_installed = {
        'lua_ls',
        'rust_analyzer',
        'gopls',
        'solidity_ls_nomicfoundation'
    }
}

local lspconfig = require('lspconfig')

lspconfig.lua_ls.setup{}
lspconfig.solidity_ls_nomicfoundation.setup{}
