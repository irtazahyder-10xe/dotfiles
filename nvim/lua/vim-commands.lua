vim.g.mapleader = " "

vim.opt.number = true
vim.opt.mouse = 'a'
vim.opt.showmode = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.relativenumber = true
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Displaying the word count in a document
-- wordcount().words function counts total word in the document
-- We want to invoke this function to display the information on the status bar

vim.schedule(function()
	vim.opt.clipboard = 'unnamedplus'
end)

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Minimal number of screen lines to keep above and below the cursor.
-- vim.opt.scrolloff = 10
vim.keymap.set('n', '<leader>d', function() vim.diagnostic.open_float() end)
vim.keymap.set('t', '<C-n>', "<C-\\><C-n><C-w>l",{silent = true})

-- Language server commands
vim.lsp.enable({
	'lua_ls',
	'clangd'
})
