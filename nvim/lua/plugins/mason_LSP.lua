return {
	-- For LSP configuration and stuff
	{
		"mason-org/mason.nvim",
		opts = {},
	},
	{
		"mason-org/mason-lspconfig.nvim",
		opts = { ensured_installed = { "clangd", "lua_ls", "jedi-language-server" } },
		dependencies = {
			"neovim/nvim-lspconfig",
		},
	},
	{
		"neovim/nvim-lspconfig",
		keys = {
			{ 'K',          vim.lsp.buf.hover },
			{ 'gd',         vim.lsp.buf.definition },
			{ '<leader>ca', vim.lsp.buf.code_action, mode = { 'n', 'v' } },
		},
		config = function()
			-- Set up lspconfig.
			local capabilities = require('cmp_nvim_lsp').default_capabilities()
			-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({
				capabilities = capabilities
			})
			lspconfig.clangd.setup({
				capabilities = capabilities
			})
			lspconfig.jedi_language_server.setup({
				capabilities = capabilities
			})

			vim.diagnostic.config({
				virtual_text = true,
			}
			)
		end
	},
}
