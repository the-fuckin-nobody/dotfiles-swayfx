local M = {
	"b3nj5m1n/kommentary",
	enabled = true,
	dependencies = {
		"JoosepAlviste/nvim-ts-context-commentstring"
	},
	config = function ()
		local kconfig = require('kommentary.config')
		kconfig.configure_language(
			"rust", {
			single_line_comment_string = "//",
			multiline_comment_string = { "/*", "*/" },
			prefer_multiline_comments = true
		})
		kconfig.configure_language(
			"default", {
			prefer_multiline_comments = true,
			use_consistent_indentation = true,
			ignore_whitespace = true 
			})
	end
}

return M
