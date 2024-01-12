local M = {
    {
        'rebelot/kanagawa.nvim',
        priority = 1000,
        config = function()
            require('kanagawa').setup({
                compile = false,             -- enable compiling the colorscheme
                undercurl = true,            -- enable undercurls
                commentStyle = { italic = true },
                functionStyle = {italic = true },
                keywordStyle = { bold = true, italic = true},
                statementStyle = { bold = true },
                typeStyle = { italic = true },
                transparent = false,         -- do not set background color
                dimInactive = false,         -- dim inactive window `:h hl-NormalNC`
                terminalColors = true,       -- define vim.g.terminal_color_{0,17}
                colors = {                   -- add/modify theme and palette colors
                    palette = {},
                    theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
                },
                overrides = function(colors) -- add/modify highlights
                    theme = colors.theme
                    return {
                        NormalFloat = { bg = "NONE" },
                        FloatBorder = { fg = "#54546d", bg = "NONE" },

                        DiagnosticError = { fg = "#ff5d62", bg = "NONE" },
                        DiagnosticWarn = { fg = "#ffa066", bg = "NONE" },
                        DiagnosticInfo = { fg = "#7aa89f", bg = "NONE" },
                        DiagnosticHint = { fg = "#957fb8", bg = "NONE" },

                        DiagnosticVirtualTextError = { fg = "#ff5d62", bg = "NONE" },
                        DiagnosticVirtualTextWarn = { fg = "#ffa066", bg = "NONE" },
                        DiagnosticVirtualTextInfo = { fg = "#7aa89f", bg = "NONE" },
                        DiagnosticVirtualTextHint = { fg = "#957fb8", bg = "NONE" },

                        LSPInlayHint = { bg = "NONE" },

                        DiagnosticSignError = { fg = "#ff5d62", bg = "NONE" },
                        DiagnosticSignWarn = { fg = "#ffa066", bg = "NONE" },
                        DiagnosticSignInfo = { fg = "#7aa89f", bg = "NONE" },
                        DiagnosticSignHint = { fg = "#957fb8", bg = "NONE" },

                        CursorLineNr = { bg = "NONE" },
                        CursorLineSign = { bg = 'NONE' },
                        LineNr = { bg = "NONE" },
                        SignColumn = { bg = "NONE" },

                        TelescopeTitle = { fg = theme.ui.special, bold = true },
                        TelescopePromptNormal = { bg = 'NONE' },
                        TelescopePromptBorder = { fg = "#9cabca", bg = 'NONE' },
                        TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = 'NONE' },
                        TelescopeResultsBorder = { fg = '#9cabca', bg = 'NONE' },
                        TelescopePreviewNormal = { bg = 'NONE' },
                        TelescopePreviewBorder = { bg = "NONE", fg = "#9cabca" },

                        Pmenu = { bg = "NONE" },
                        PmenuSel = { bg = "#2a2a37" },
                        PmenuSbar = { fg = "#938aa9",bg = "NONE" },
                        PmenuThumb = { bg = "#938aa9" },


                        CmpItemAbbrDeprecated = { fg = "#223249", bg = "NONE" },
                        CmpItemAbbrMatch = { fg = "#e6c384", bg = "NONE" },
                        CmpItemAbbrMatchFuzzy = { fg = "#e6c384", bg = "NONE" },

                        CmpItemMenu = { fg = "#e46876", bg = "NONE" },
                        CmpItemKindField = { fg = "#e46876", bg = "NONE" },
                        CmpItemKindProperty = { fg = "#e46876", bg = "NONE" },
                        CmpItemKindEvent = { fg = "#e46876", bg = "NONE" },

                        CmpItemKindText = { fg = "#9cabca", bg = "NONE" },

                        CmpItemKindEnum = { fg = "#ffa066", bg = "NONE" },
                        CmpItemKindKeyword = { fg = "#ffa066", bg = "NONE" },

                        CmpItemKindConstant = { fg = "#7fb4ca", bg = "NONE" },
                        CmpItemKindConstructor = { fg = "#7fb4ca", bg = "NONE" },
                        CmpItemKindReference = { fg = "#7fb4ca", bg = "NONE" },

                        CmpItemKindFunction = { fg = "#957fb8", bg = "NONE" },
                        CmpItemKindStruct = { fg = "#957fb8", bg = "NONE" },
                        CmpItemKindClass = { fg = "#957fb8", bg = "NONE" },
                        CmpItemKindModule = { fg = "#957fb8", bg = "NONE" },
                        CmpItemKindOperator = { fg = "#957fb8", bg = "NONE" },

                        CmpItemKindVariable = { fg = "#dca561", bg = "NONE" },
                        CmpItemKindFile = { fg = "#dca561", bg = "NONE" },

                        CmpItemKindUnit = { fg = "#7e9cd8", bg = "NONE" },
                        CmpItemKindSnippet = { fg = "#7e9cd8", bg = "NONE" },
                        CmpItemKindFolder = { fg = "#7e9cd8", bg = "NONE" },

                        CmpItemKindMethod = { fg = "#d27e99", bg = "NONE" },
                        CmpItemKindValue = { fg = "#d27e99", bg = "NONE" },
                        CmpItemKindEnumMember = { fg = "#d27e99", bg = "NONE" },

                        CmpItemKindInterface = { fg = "#6a9589", bg = "NONE" },
                        CmpItemKindColor = { fg = "#6a9589", bg = "NONE" },
                        CmpItemKindTypeParameter = { fg = "#6a9589", bg = "NONE" },

                        MatchParen = { underline = true, bold = true },
                        IndentBlakLineContextStart = { underline = false },

                        WhiteSpace = { fg = "#2a2a37" }
                    }
                end,
                theme = "wave",              -- Load "wave" theme when 'background' option is not set
                background = {               -- map the value of 'background' option to a theme
                    dark = "wave",           -- try "dragon" !
                    light = "lotus"
                },
            })

            -- setup must be called before loading
            vim.cmd("colorscheme kanagawa")
        end,
    }
}

return M
