-- Set the leader key to space
vim.g.mapleader = " "

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Ensure $(go env GOPATH)/bin is on PATH inside Neovim
do
	local gopath = vim.fn.systemlist("go env GOPATH")[1]
	if gopath and gopath ~= "" and not string.find(vim.env.PATH or "", gopath .. "/bin", 1, true) then
		vim.env.PATH = (vim.env.PATH or "") .. ":" .. gopath .. "/bin"
	end
end
-- Load core configuration
require("config.options")
require("config.keymaps")

-- Load plugins
require("lazy").setup("plugins")
