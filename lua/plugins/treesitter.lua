return {
	"nvim-treesitter/nvim-treesitter",
	event = {"BufReadPre", "BufNewFile"},
	build = ":TSUpdate",
	dependencies = {"windwp/nvim-ts-autotag"},
	config = function()
		local treesitter = require("nvim-treesitter.configs")

		treesitter.setup({
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
			indent = { enable = true },
			autotag = { enable = true },
			ensure_installed = {
				"rust",
				"lua",
				"json",
				"toml",
				"javascript",
				"vim",
				"bash",
				"gitignore",
				"markdown",
				"markdown_inline",
				"c",
			},
			incremental_selection = {
				enable = true,
			},
			rainbow = {
				enable = true,
				disble = { "html" },
				extended_mode = false,
				max_file_lines = nil,
			},
			context_commentstring = {
				enable = true,
				enable_autocmd = false
			},
		})
	end,
}
