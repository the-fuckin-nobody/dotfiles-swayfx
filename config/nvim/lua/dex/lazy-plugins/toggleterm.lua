local M = {
	"akinsho/toggleterm.nvim",
	enabled = true,
}

M.config = function()
	require('toggleterm').setup({
        size = function(term)
            if term.direction == "vertical" then
                return vim.o.columns * 0.4
            elseif term.direction == "horizontal" then
                return 15
            end
        end,
	})
end

return M
