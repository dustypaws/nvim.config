local lsp = require('lsp-zero')

lsp.set_preferences({
    suggest_lsp_servers = true,
    setup_servers_on_start = true,
    set_lsp_keymaps = true,
    configure_diagnostics = true,
    cmp_capabilities = true,
    manage_nvim_cmp = true,
    call_servers = 'local',
    sign_icons = {
        error = '✘',
        warn = '▲',
        hint = '⚑',
        info = ''
    }
})
local rust_lsp = lsp.build_options('rust_analyzer', {})
lsp.configure('rust_analyzer', {
    on_attach = function(c, bufnr) 
        vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
        vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
    end
})

lsp.nvim_workspace()
lsp.setup()

require('rust-tools').setup({server = rust_lsp})
require("mason").setup()
require("mason-lspconfig").setup()
