local settings = require("user")
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

-- returns the require for use in `config` parameter of packer's use
-- expects the name of the config file
local function get_config(name)
  return string.format('require("config/%s")', name)
end

-- bootstrap packer if not installed
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({
    "git",
    "clone",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  print("Installing packer...")
  vim.api.nvim_command("packadd packer.nvim")
end

-- initialize and configure packer
local packer = require("packer")

packer.init({
  enable = true, -- enable profiling via :PackerCompile profile=true
  threshold = 0, -- the amount in ms that a plugins load time must be over for it to be included in the profile
  max_jobs = 20, -- Limit the number of simultaneous jobs. nil means no limit. Set to 20 in order to prevent PackerSync form being "stuck" -> https://github.com/wbthomason/packer.nvim/issues/746
  -- Have packer use a popup window
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})

packer.startup(function(use)
    
    use('wbthomason/packer.nvim')

    -- Plugins here

    use ({ 'Mofiqul/dracula.nvim' })

    use({
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons',
        config = get_config('nvim-tree'),
    })

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        -- or                            , branch = '0.1.x',
        requires = { 
            {'nvim-lua/plenary.nvim'},
            {'nvim-telescope/telescope-fzf-native.nvim',
            run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' 
            }
        },
        config = get_config('telescope')
    }

    use({
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
        config = get_config('lualine')
    })

    use({
        'akinsho/bufferline.nvim',
        tag = "v2.*",
        requires = 'kyazdani42/nvim-web-devicons',
        config = get_config('bufferline')
    })

    use({
        "williamboman/mason.nvim",
        requires = { "williamboman/mason-lspconfig.nvim", "WhoIsSethDaniel/mason-tool-installer.nvim" },
        config = get_config("mason"),
    })

    use({
        'windwp/nvim-autopairs',
        config = get_config('nvim-autopairs')
    })

    -- Language Plugins

    use 'neovim/nvim-lspconfig'
    use({
        'simrat39/rust-tools.nvim',
        config = get_config('rust-tools')
    })

    -- Completion framework:
    use({
        'hrsh7th/nvim-cmp',
        requires = {
            -- LSP completion source:
            'hrsh7th/cmp-nvim-lsp',

            -- Useful completion sources:
            'hrsh7th/cmp-nvim-lua',
            'hrsh7th/cmp-nvim-lsp-signature-help',
            'hrsh7th/cmp-vsnip',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-buffer',
            'hrsh7th/vim-vsnip',
        },
        config = get_config('cmp')
    })

    use({
        'nvim-treesitter/nvim-treesitter',
        config = get_config('treesitter'),
    })

    use({
        'puremourning/vimspector',
        config = get_config('vimspector'),
    })

    if packer_bootstrap then
    require('packer').sync()
  end
end)
