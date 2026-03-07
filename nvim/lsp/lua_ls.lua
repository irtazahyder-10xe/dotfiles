return {
	-- Command and arguments to start the server.
	cmd = { 'lua-language-server', '--logpath=~/.cache/lua-language-server' },
	-- Filetypes to automatically attach to.
	filetypes = { 'lua' },
	-- Files that share a root directory will reuse the LSP server connection.
	-- Nested lists indicate equal priority, see |vim.lsp.Config|.
	root_markers = { { '.luarc.json', '.luarc.jsonc' }, '.git' },
	-- Specific settings to send to the server. The schema is server-defined.
	settings = {
		Lua = {
			runtime = {
				version = 'LuaJIT',
			}
		}
	}
}
