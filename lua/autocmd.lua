local api = vim.api
local settings = require('user')

-- Close nvim if NvimTree is only running buffer
api.nvim_create_autocmd(
    "BufEnter",
    { command = [[if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif]] }
)

-- Format buffer on save
api.nvim_create_autocmd(
    "BufWritePre", {
    pattern = "*",
    command = [[lua vim.lsp.buf.format()]]
}
)

if settings.packer_auto_sync then
    -- source plugins.lua and run PackerSync on save
    local sync_packer = function()
        vim.cmd("runtime lua/plugins.lua")
        require("packer").sync()
    end
    api.nvim_create_autocmd({ "BufWritePost" }, {
        pattern = { "plugins.lua" },
        callback = sync_packer,
    })
end

vim.cmd([[
autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
]])
