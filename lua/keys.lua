local map = vim.api.nvim_set_keymap
local default_opt = { silent = true }

-- leaving insert mode
map('i', 'jk', '<ESC>', default_opt)
map('i', 'kj', '<ESC>', default_opt)

-- buffer nav
map('n', '<TAB>', ':bnext<CR>', default_opt)
map('n', '<S-TAB>', ':bprev<CR>', default_opt)
map('n', '<leader>c', ':bwipeout<CR>', default_opt)

-- NvimTree
map('n', 'n', ':NvimTreeToggle<CR>', default_opt)

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
