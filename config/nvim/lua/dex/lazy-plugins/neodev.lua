local M = {
	"folke/neodev.nvim",
	enabled = true,
	config = function()
        require('neodev').setup()
    end
}

return M
