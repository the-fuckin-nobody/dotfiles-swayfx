local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
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

require('lazy').setup("dex.lazy-plugins", {
	timeout = 60,
	install = {
		missing = true,
		colorschemes = { "kanagawa" }
	},
	pills = true,
	ui = {
		border = "rounded",
		title = nil,
	}
})
