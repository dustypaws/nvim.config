# My personal nvim config

This cconfiguration is heavily inspired by [Allaman](https://github.com/Allaman/nvim/).

The Rust "IDE"-Build is mainly taken from "[Rust and Neovim - A Thorough Guide and Walkthrough](https://dev.to/rsdlt/rust-and-neovim-a-thorough-guide-and-walkthrough-554o)" and also [Turning Neovim into a Full-Fledged Code Editor with Lua](https://mattermost.com/blog/turning-neovim-into-a-full-fledged-code-editor-with-lua/).

## Plugins used
### General stuff
* [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
* [Telescope](https://github.com/nvim-telescope/telescope.nvim)
    * [telescope-fzf-native.nvim](https://github.com/nvim-telescope/telescope-fzf-native.nvim)
* [Nvim-Autopairs](https://github.com/windwp/nvim-autopairs)
* [Bufferline.nvim](https://github.com/akinsho/bufferline.nvim)
* [Lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)
* [nvim-tree.lua](https://github.com/kyazdani42/nvim-tree.lua)
* [Comment.nvim](https://github.com/numToStr/Comment.nvim)
* [Neovim-Session-Manager](https://github.com/Shatur/neovim-session-manager)
* [Fidget](https://github.com/j-hui/fidget.nvim)

### Package management
* [Packer](https://github.com/wbthomason/packer.nvim)
* [Mason](https://github.com/williamboman/mason.nvim)
    * ...Language servers, linters, etc. are installed via Mason.

### Completion 
* [lsp-zero.nvim](https://github.com/VonHeikemen/lsp-zero.nvim)
* [cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp)

### Language "specific"
* [Rust Tools](https://github.com/simrat39/rust-tools.nvim)
* [symbols-outline.nvin](https://github.com/simrat39/symbols-outline.nvim)
* [lsp-trouble.nvim](https://github.com/simrat39/lsp-trouble.nvim)

## Things worth cosidering 🤔
* [Gitsigns](https://github.com/lewis6991/gitsigns.nvim)
    * An alternative to `vim-gitgutter`
* [LSPSaga](https://github.com/glepnir/lspsaga.nvim)
    * A drop-in replacement for vim-lsp

