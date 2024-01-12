local map = vim.keymap.set
local nmap = function(keys, cmd, opts)
	map('n', keys, cmd, opts)
end
local imap = function (keys, cmd, opts)
	map('i', keys, cmd, opts)
end
local vmap = function(keys, cmd, opts)
	map('v', keys, cmd, opts)
end

-- keymaps for normal mode
nmap('<leader>a', 'gg0vG$<CR>')
nmap('<leader>e', ':Neotree dir=./<CR>')
nmap('<leader>te', ':Neotree toggle<CR>')
nmap('<leader>M', ':Mason<CR>')
nmap('<leader>L', ':Lazy<CR>')
nmap('<Esc>', ':nohlsearch<CR>')
nmap('<leader>c', "<Plug>kommentary_line_default")
nmap('<leader>ht', ':ToggleTerm<CR>')
nmap('<leader>vt', ':ToggleTerm direction=vertical<CR>')
nmap(';', ":")

nmap('<leader>wh', ':wincmd h<CR>')
nmap('<leader>wj', ':wincmd j<CR>')
nmap('<leader>wk', ':wincmd k<CR>')
nmap('<leader>wl', ':wincmd l<CR>')

nmap('<leader>ff', ':Telescope find_files<CR>')
nmap('<leader>fg', ':Telescope live_grep<CR>')
nmap('<leader>fb', ':Telescope buffers<CR>')
nmap('<leader>fh', ':Telescope help_tags<CR>')
nmap('<leader>fc', ':Telescope commands<CR>')
nmap('<leader>fm', ':Telescope marks<CR>')
nmap('<leader>fr', ':Telescope registers<CR>')
nmap('<leader>fs', ':Telescope lsp_document_symbols<CR>')


-- keymaps for insert mode
imap('<S-Tab>', '<Plug>(copilot-accept-word)')
imap('<C-]>', '<Plug>(copilot-dismiss)')


vmap('<leader>c', '<Plug>kommentary_visual_default<C-c>')

nmap('<c-j>', ':m .+1<CR>==')
nmap('<c-k>', ':m .-2<CR>==')
imap('<c-j>', '<Esc>:m .+1<CR>==gi')
imap('<c-k>', '<Esc>:m .-2<CR>==gi')
vmap('<c-j>', ':m >+1<CR>gv=gv')
vmap('<c-k>', ':m <-2<CR>gv=gv ')
vmap(';', ":")
