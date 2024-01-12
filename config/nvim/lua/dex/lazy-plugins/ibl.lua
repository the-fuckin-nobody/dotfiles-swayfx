local M = { 
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    config = function ()
        --[[ local highlight = {
            "RainbowRed",
            "RainbowYellow",
            "RainbowBlue",
            "RainbowOrange",
            "RainbowGreen",
            "RainbowViolet",
            "RainbowCyan",
        }
        local hooks = require "ibl.hooks"
        -- create the highlight groups in the highlight setup hook, so they are reset
        -- every time the colorscheme changes
        hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
            vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#e46876" })
            vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E6c384" })
            vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#7e9cd8" })
            vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#ffa066" })
            vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98bb6c" })
            vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#938aa9" })
            vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#7fb4ca" })
        end) ]]

        require("ibl").setup {
            indent = {
                char = "▏"
            },
            scope = {
                show_start = false,
                show_end = false,
            },
            whitespace = {
                remove_blankline_trail = true,
            },
            exclude = {
                buftypes = { "terminal", "help" }
            }
        }
        local hooks = require('ibl.hooks')
        hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_space_indent_level)
        hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_tab_indent_level)
    end
}

return M
