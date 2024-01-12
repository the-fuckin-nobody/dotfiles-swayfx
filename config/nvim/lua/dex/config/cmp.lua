local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')

cmp.event:on(
'confirm_done',
cmp_autopairs.on_confirm_done()
)


local cmp_kinds = {
    Text = '   ',
    Method = '   ',
    Function = ' 󰡱  ',
    Constructor = '   ',
    Field = '   ',
    Variable = ' 󰫧 ',
    Class = '   ',
    Interface = '   ',
    Module = ' 󰅩 ',
    Property = '   ',
    Unit = '   ',
    Value = '   ',
    Enum = '   ',
    Keyword = '   ',
    Snippet = '   ',
    Color = '   ',
    File = '   ',
    Reference = '   ',
    Folder = '   ',
    EnumMember = '   ',
    Constant = '   ',
    Struct = '   ',
    Event = '   ',
    Operator = '   ',
    TypeParameter = '   ',
}

cmp.setup({
    completion = {
        completeopt = 'menu,menuone,preview'
    },
    sources = {
        {name = 'nvim_lsp'},
        {name = 'luasnip'},
        {name = 'buffer'},
        {name = 'path'},
    },
    mapping = {
        ['<C-y>'] = cmp.mapping.confirm({select = false}),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<C-Down>'] = cmp.mapping.scroll_docs(-4),
        ['<C-Up>'] = cmp.mapping.scroll_docs(4),
        ['<c-k>'] = cmp.mapping.select_prev_item({behavior = 'select'}),
        ['<C-j>'] = cmp.mapping.select_next_item({behavior = 'select'}),
        ['<CR>'] = cmp.mapping(cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Replace }), { 'i', 'c' }),
        ['<C-p>'] = cmp.mapping(function()
            if cmp.visible() then
                cmp.select_prev_item({behavior = 'insert'})
            else
                cmp.complete()
            end
        end),
        ['<C-n>'] = cmp.mapping(function()
            if cmp.visible() then
                cmp.select_next_item({behavior = 'insert'})
            else
                cmp.complete()
            end
        end),
    },
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    view = {
        entry = "custom",
        selection_order = "near_cursor"
    },
    window = {
        completion = {
            winhighlight = "Normal:Pmenu,FloatBorder:PmenuSbar,Search:None",
            col_offset = -3,
            side_padding = 0,
            border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
        },
        documentation = {
            winhighlight = "Normal:Pmenu,FloatBorder:PmenuSbar,Search:None",
            col_offset = 1,
            border = { "╭", "─", "╮", "┃", "╯", "─", "╰", "┃" },
        }
    },
    formatting = {
        fields = { 'abbr', 'kind', 'menu' },
        format = function(_, vim_item)
            vim_item.kind = (cmp_kinds[vim_item.kind] or '') .. vim_item.kind
            return vim_item
        end,
    },
})



-- Customization for Pmenu
--[[ vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#262626" })
vim.api.nvim_set_hl(0, "Pmenu", { fg = "#e0e0e0", bg = "#161616" })

vim.api.nvim_set_hl(0, "CmpItemAbbrDeprecated", { fg = "#7E8294", bg = "#161616", strikethrough = true })
vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { fg = "#25be6a", bg = "NONE", bold = true })
vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { fg = "#25be6a", bg = "NONE", bold = true })
vim.api.nvim_set_hl(0, "CmpItemMenu", { fg = "#36cefe", bg = "NONE", italic = true })
vim.api.nvim_set_hl(0, "CmpItemKindField", { fg = "#4589ff", bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpItemKindProperty", { fg = "#4589ff", bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpItemKindEvent", { fg = "#4589ff", bg = "NONE" })

vim.api.nvim_set_hl(0, "CmpItemKindText", { fg = "#be95ff", bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpItemKindEnum", { fg = "#ee5396", bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpItemKindKeyword", { fg = "#ee5396", bg = "NONE" })

vim.api.nvim_set_hl(0, "CmpItemKindConstant", { fg = "#08bdba", bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpItemKindConstructor", { fg = "#08bdba", bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpItemKindReference", { fg = "#08bdba", bg = "NONE" })

vim.api.nvim_set_hl(0, "CmpItemKindFunction", { fg = "#a56eff", bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpItemKindStruct", { fg = "#a56eff", bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpItemKindClass", { fg = "#a56eff", bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpItemKindModule", { fg = "#a56eff", bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpItemKindOperator", { fg = "#a56eff", bg = "NONE" })

vim.api.nvim_set_hl(0, "CmpItemKindVariable", { fg = "#25cac8", bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpItemKindFile", { fg = "#25cac8", bg = "NONE" })

vim.api.nvim_set_hl(0, "CmpItemKindUnit", { fg = "#57beff", bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpItemKindSnippet", { fg = "#57beff", bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpItemKindFolder", { fg = "#57beff", bg = "NONE" })

vim.api.nvim_set_hl(0, "CmpItemKindMethod", { fg = "#ff832b", bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpItemKindValue", { fg = "#ff832b", bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpItemKindEnumMember", { fg = "#ff832b", bg = "NONE" })

vim.api.nvim_set_hl(0, "CmpItemKindInterface", { fg = "#be95ff", bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpItemKindColor", { fg = "#be95ff", bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpItemKindTypeParameter", { fg = "#be95ff", bg = "NONE" })
 ]]
