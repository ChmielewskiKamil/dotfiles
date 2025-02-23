require('mason').setup()
require('mason-lspconfig').setup {
    ensure_installed = {
        'lua_ls',
        'rust_analyzer',
        'gopls',
        'nomicfoundation-solidity-language-server'
    }
}

local lspconfig = require('lspconfig')
