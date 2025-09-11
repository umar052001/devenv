-- ~/.config/nvim/lua/config/options.lua

-- keep at least 8 lines visible below the cursor
vim.opt.scrolloff = 8

-- recenter a bit when entering Insert at EOF
vim.api.nvim_create_autocmd("InsertEnter", {
	callback = function()
		local lastline = vim.fn.line("$")
		local currline = vim.fn.line(".")
		if currline == lastline then
			vim.cmd("normal! zz")
		end
	end,
})
vim.opt.guicursor = ""
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.termguicolors = true
-- vim.opt.clipboard = "unnamedplus" -- Use system clipboard
