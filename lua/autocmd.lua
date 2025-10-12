local api = vim.api
local settings = require('user')

-- Close nvim if NvimTree is only running buffer
-- api.nvim_create_autocmd(
--    "BufEnter",
--    { command = [[if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif]] }
-- )

-- Format buffer on save
api.nvim_create_autocmd(
    "BufWritePre", {
    pattern = "*",
    command = [[lua vim.lsp.buf.format()]]
}
)

vim.cmd([[
autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
]])
