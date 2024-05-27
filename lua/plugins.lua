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


    use({
        'nvim-tree/nvim-tree.lua',
        requires = 'nvim-tree/nvim-web-devicons',
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
        requires = { 'nvim-tree/nvim-web-devicons', opt = true },
        config = get_config('lualine')
    })

    use({
        'akinsho/bufferline.nvim',
        -- tag = "v2.*",
        requires = 'nvim-tree/nvim-web-devicons',
        config = get_config('bufferline')
    })

    use({
        'windwp/nvim-autopairs',
        config = get_config('nvim-autopairs')
    })

    use({
        'numToStr/Comment.nvim',
        config = get_config('Comment'),
    })

    use({
        'tpope/vim-fugitive'
    })

    use ({
        'Shatur/neovim-session-manager',
        config = get_config('neovim-session-manager'),
        requires = { 'nvim-lua/plenary.nvim' }
    })

    use({
        'airblade/vim-gitgutter',
        branch = 'main'
    })

    use({
        'j-hui/fidget.nvim',
        branch = 'legacy',
        config = get_config('fidget')
    })

    use({
        'simrat39/symbols-outline.nvim',
        config = get_config('symbols-outline'),
    })

    -- Language Plugins

    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},

            -- Autocompletion
            {'hrsh7th/nvim-cmp', config = get_config('cmp')},
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            {'saadparwaiz1/cmp_luasnip'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-nvim-lua'},

            -- Snippets
            {'L3MON4D3/LuaSnip'},
            {'rafamadriz/friendly-snippets'},
        },
        config = get_config('lsp-zero'),
    }

    use({
        'simrat39/rust-tools.nvim',
        config = get_config('rust-tools')
    })

    use({
        "folke/lsp-trouble.nvim",
        requires = "nvim-tree/nvim-web-devicons",
        config = get_config('trouble')
    })

    use({
        'nvim-treesitter/nvim-treesitter',
        config = get_config('treesitter'),
    })

    use({
        'puremourning/vimspector',
        config = get_config('vimspector'),
    })

    -- Themes 

    use ({ 'Mofiqul/dracula.nvim' })

    use({
        'EdenEast/nightfox.nvim',
        config = get_config('nightfox')
    })
    -- Plugins END
    if packer_bootstrap then
    require('packer').sync()
  end
end)
