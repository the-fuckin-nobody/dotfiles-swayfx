local lspconfig = require('lspconfig')

local capabilities = vim.lsp.protocol.make_client_capabilities()

local on_attach = function(client, bufnr)
    vim.api.nvim_create_autocmd('LspAttach', {
        desc = 'LSP actions',
        callback = function(event)
            local opts = {buffer = event.buf}
            vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
            vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
            vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
            vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
            vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
            vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
            vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
            vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
            vim.keymap.set({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
            vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)

            vim.keymap.set('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>', opts)
            vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>', opts)
            vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>', opts)
        end
    })

end

capabilities.textDocument.completion.completionItem = {
    documentationFormat = { 'markdown', 'plaintext' },
    snippetSupport = true,
    preselectSupport = true,
    insertReplaceSupport = true,
    labelDetailsSupport = true,
    deprecatedSupport = true,
    commitCharactersSupport = true,
    tagSupport = { valueSet = { 1 } },
    resolveSupport = {
        properties = {
            'documentation',
            'detail',
            'additionalTextEdits',
        }
    }
}

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
})

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {
        'lua_ls',
    },
    handlers = {
        lua_ls = function()
            lspconfig.lua_ls.setup({
                capabilities = capabilities,
                on_attach = on_attach,
                Lua = {
                    diagnostics = {
                        global = { "vim" },
                    },
                -- on_attach = on_attach,
                }
            })
        end,
        bashls = function ()
            lspconfig.bashls.setup({
                cmd = { "bash-language-server", "start" },
                filetypes = { "sh", "zsh", "bash" },
                capabilities = capabilities,
                root_dir = require('lspconfig/util').root_pattern(".git", vim.fn.getcwd()),
                settings = {
                    bash = {
                        analyse = {
                            disable = { "all" },
                            enable = { "parameterExpansion", "commandSubstitution", "arithmeticExpansion", "processSubstitution" }
                        }
                    }
                }
            })
        end,
        clangd = function()
            lspconfig.clangd.setup({
                on_attach = on_attach,
                cmd = { "clangd", "--background-index", "--offset-encoding=utf-16" },
                filetypes = { "c", "cpp", "objc", "objcpp" },
                capabilities = capabilities,
                root_dir = require('lspconfig/util').root_pattern(".git", vim.fn.getcwd()),
                init_options = {
                    clangdFileStatus = true,
                    usePlaceholders = true,
                    completeUnimported = true,
                    semanticHighlighting = true,
                },

            })
        end,
        jsonls = function()
            lspconfig.jsonls.setup({
                capabilities = capabilities,
                filetypes = { "json", "jsonc" }
            })
        end,
        html = function()
            lspconfig.html.setup({
                capabilities = capabilities,
                filetypes = { "html", "htmldjango" }
            })
        end,
        pylsp = function()
            lspconfig.pylsp.setup({
                capabilities = capabilities,
                filetypes = { "python" }
            })
        end,
        tsserver = function()
            lspconfig.tsserver.setup({
                capabilities = capabilities,
                filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript", "javascriptreact", "javascript.jsx" },
                root_dir = require('lspconfig/util').root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git", vim.fn.getcwd()),
            })
        end,
    },
})

--[[ lsp_zero.on_attach(function(client, bufnr)
-- see :help lsp-zero-keybindings
-- to learn the available actions
lsp_zero.default_keymaps({buffer = bufnr})
end) ]]

--[[ lsp_zero.set_sign_icons({
error = ' ',
warn = ' ',
hint = ' ',
info = ' '
}) ]]

-- local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
-- vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave"}, {
--	group = lint_augroup,
--	callback = function()
--		require("lint").try_lint()
-- 	end,
--})


vim.diagnostic.config({
    underline = {
        severity = vim.diagnostic.severity.ERROR
    },
    severity_sort = true,
    update_in_insert = true,
})

-- You will likely want to reduce updatetime which affects CursorHold
-- note: this setting is global and should be set only once
vim.o.updatetime = 250

local set_jsonc_filetype = function()
    local ft = vim.bo.filetype
    if ft == 'json' then
        vim.bo.filetype = 'jsonc'
    end
end

local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.diagnostic.config({
  virtual_text = {
    source = "always",  -- Or "if_many"
    prefix = '◆', -- Could be '■', '▎', 'x'
  },
  float = {
    source = "always",  -- Or "if_many"
  },
})


-- vim.cmd[[highlight DiagnosticUnderlineError guifg=#fa4d56]]

-- vim.cmd[[highlight DiagnosticError guifg=#fa4d56]]
-- vim.cmd[[highlight DiagnosticWarn guifg=#ff832b]]
-- vim.cmd[[highlight DiagnosticInfo guifg=#a56eff]]
-- vim.cmd[[highlight DiagnosticHint guifg=#f1c21b]]

-- vim.cmd[[highlight LSPInlayHint guifg=#a0a0a0]]

-- vim.cmd[[highlight DiagnosticVirtualTextError guifg=#fa4d56]]
-- vim.cmd[[highlight DiagnosticVirtualTextWarning guifg=#ff832b]]
-- vim.cmd[[highlight DiagnosticVirtualTextInfo guifg=#a56eff]]
-- vim.cmd[[highlight DiagnosticVirtualTextHint guifg=#f1c21b]]
