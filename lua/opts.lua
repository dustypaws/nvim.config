local opt = vim.opt
local fn = vim.fn
local settings = require('user')

-- [[ Context ]]
opt.colorcolumn = '80'
opt.number = true
opt.relativenumber = true
opt.scrolloff = 4
opt.signcolumn  = "yes"
opt.shortmess = opt.shortmess + "c"
opt.lazyredraw = true 
opt.undofile = true
opt.undodir = fn.stdpath("data") .. "/undodir"
opt.swapfile = false
opt.backup = true
opt.history = 1000
opt.clipboard = "unnamedplus"
opt.showmode = false
opt.ttimeoutlen = 0
opt.timeoutlen = 400
opt.updatetime = 300
opt.mouse = settings.mouse

-- [[ Filetypes ]]
opt.encoding = 'utf8'
opt.fileencoding = 'utf8'

-- [[ Theme ]]
opt.syntax = "ON"
opt.termguicolors = true
vim.cmd(string.format([[colorscheme %s]], settings.theme))

-- [[ Search ]]
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.hlsearch = false

-- [[ Whitespace ]]
opt.expandtab = true
opt.shiftwidth = 4
opt.softtabstop = 4
opt.tabstop  = 4

-- [[ Splits ]]
opt.splitright = true
opt.splitbelow = true

-- [[ Completion ]]
opt.completeopt = { "menuone", "noselect", "noinsert" } -- A comma separated list of options for Insert mode completion
opt.wildmode = "full"
opt.wildignorecase = true -- When set case is ignored when completing file names and directories
opt.wildignore = [[
.git,.hg,.svn
*.aux,*.out,*.toc
*.o,*.obj,*.exe,*.dll,*.manifest,*.rbc,*.class
*.ai,*.bmp,*.gif,*.ico,*.jpg,*.jpeg,*.png,*.psd,*.webp
*.avi,*.divx,*.mp4,*.webm,*.mov,*.m2ts,*.mkv,*.vob,*.mpg,*.mpeg
*.mp3,*.oga,*.ogg,*.wav,*.flac
*.eot,*.otf,*.ttf,*.woff
*.doc,*.pdf,*.cbr,*.cbz
*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz,*.kgb
*.swp,.lock,.DS_Store,._*
*/tmp/*,*.so,*.swp,*.zip,**/node_modules/**,**/target/**,**.terraform/**"
]]
