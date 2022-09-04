local map = vim.api.nvim_set_keymap
local default_opt = { silent = true }
local nor_opts = { noremap=true, silent=true }


-- leaving insert mode
map('i', 'jk', '<ESC>', default_opt)
map('i', 'kj', '<ESC>', default_opt)

-- buffer nav
map('n', '<TAB>', ':BufferLineCycleNext<CR>', default_opt)
map('n', '<S-TAB>', ':BufferLineCyclePrev<CR>', default_opt)
map('n', '<leader>c', ':bwipeout<CR>', default_opt)
map('n', '<leader><leader>n', ':BufferLineMovePrev<CR>', default_opt)
map('n', '<leader><leader>m', ':BufferLineMoveNext<CR>', default_opt)

-- NvimTree
map('n', '<leader>N', ':NvimTreeToggle<CR>', default_opt)

-- Telescope
map('n', '<leader>ff', ':Telescope find_files<CR>', default_opt)
map('n', '<leader>fg', ':Telescope live_grep<CR>', default_opt)
map('n', '<leader>fb', ':Telescope buffers<CR>', default_opt)
map('n', '<leader>fh', ':Telescope help_tags<CR>', default_opt)

-- Vimspector
vim.cmd([[
nmap <F9> <cmd>call vimspector#Launch()<cr>
nmap <F5> <cmd>call vimspector#StepOver()<cr>
nmap <F8> <cmd>call vimspector#Reset()<cr>
nmap <F11> <cmd>call vimspector#StepOver()<cr>")
nmap <F12> <cmd>call vimspector#StepOut()<cr>")
nmap <F10> <cmd>call vimspector#StepInto()<cr>")
]])
map('n', "Db", ":call vimspector#ToggleBreakpoint()<cr>", default_opt)
map('n', "Dw", ":call vimspector#AddWatch()<cr>", default_opt)
map('n', "De", ":call vimspector#Evaluate()<cr>", default_opt)

-- Bufferline
vim.cmd([[
nnoremap <silent><leader>1 <cmd>lua require("bufferline").go_to_buffer(1, true)<cr>
nnoremap <silent><leader>2 <cmd>lua require("bufferline").go_to_buffer(2, true)<cr>
nnoremap <silent><leader>3 <cmd>lua require("bufferline").go_to_buffer(3, true)<cr>
nnoremap <silent><leader>4 <cmd>lua require("bufferline").go_to_buffer(4, true)<cr>
nnoremap <silent><leader>5 <cmd>lua require("bufferline").go_to_buffer(5, true)<cr>
nnoremap <silent><leader>6 <cmd>lua require("bufferline").go_to_buffer(6, true)<cr>
nnoremap <silent><leader>7 <cmd>lua require("bufferline").go_to_buffer(7, true)<cr>
nnoremap <silent><leader>8 <cmd>lua require("bufferline").go_to_buffer(8, true)<cr>
nnoremap <silent><leader>9 <cmd>lua require("bufferline").go_to_buffer(9, true)<cr>
]])

-- nvim-lsp
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, nor_opts)
vim.keymap.set('n', ',n', vim.diagnostic.goto_prev, nor_opts)
vim.keymap.set('n', ',m', vim.diagnostic.goto_next, nor_opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, nor_opts)

-- trouble
vim.cmd([[
nnoremap <leader>xx <cmd>TroubleToggle<cr>
nnoremap <leader>xw <cmd>TroubleToggle lsp_workspace_diagnostics<cr>
nnoremap <leader>xd <cmd>TroubleToggle lsp_document_diagnostics<cr>
nnoremap <leader>xq <cmd>TroubleToggle quickfix<cr>
nnoremap <leader>xl <cmd>TroubleToggle loclist<cr>
nnoremap gR <cmd>TroubleToggle lsp_references<cr>
]])

-- Rust-Tools
vim.cmd([[
nnoremap <silent><C-k> <cmd>RustHoverActions<cr>
]])
