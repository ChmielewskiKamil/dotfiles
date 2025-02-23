-- Leader mapping must happen before plugin config kicks in. Otherwise plugin
-- specific mappings might be set incorrectly.
vim.g.mapleader = " "

-- Markdown Preview
vim.g.mkdp_auto_start = 0
vim.g.mkdp_auto_close = 0
vim.g.mkdp_combine_preview = 1
