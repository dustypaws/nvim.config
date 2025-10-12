return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		require("mason").setup()

		require("mason-lspconfig").setup({
			automatic_installation = true,
			ensure_installed = {
				"rust_analyzer",
				"html",
				"jsonls",
				"gopls",
				"golangci_lint_ls",
			},
		})

		require("mason-tool-installer").setup({
			ensure_installed = {
				"prettier",
			},
		})
	end,
}
