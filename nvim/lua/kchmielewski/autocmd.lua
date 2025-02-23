-- Actual break at 80 chars for markdown files
vim.api.nvim_create_autocmd('BufWinEnter', {
  pattern = { '*.md' },
  callback = function()
    vim.opt.textwidth = 80
  end,
})
