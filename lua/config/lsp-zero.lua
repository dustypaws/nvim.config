local lsp = require('lsp-zero')

local rust_lsp = lsp.build_options('rust_analyzer', {})
lsp.configure('rust_analyzer', {
    on_attach = function(c, bufnr) 
        vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
        vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
    end
})

lsp.preset('recommended')
lsp.setup()

require('rust-tools').setup({server = rust_lsp})
