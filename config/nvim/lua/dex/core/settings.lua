vim.g.mapleader = ' '
vim.g.loaded_netrw = 1
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.scrolloff = 8
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.undofile = true
vim.opt.backup = false
vim.opt.clipboard = "unnamedplus"
vim.opt.swapfile = false
vim.opt.whichwrap = "<,>,[,],s,b"
vim.g.copilot_no_tab_map = false
vim.opt.showtabline = 2
vim.opt.sessionoptions = "blank,buffers,curdir,folds,help,options,tabpages,winsize,resize,winpos,terminal"
vim.opt.termguicolors = true
vim.opt.expandtab = true
vim.opt.incsearch = true -- Makes search act like search in modern browsers
vim.opt.showmatch = true -- show matching brackets when text indicator is over theme
vim.opt.smartcase = true -- Makes search case-insensitive when using lowercase length
vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.wildignore = "*.docx,*.png,*.jpg,*.jpeg,*.gif,*.pdf,*.svg,*.mp4,*.mkv,*.avi,*.mp3,*.wav,*.ogg,*.zip,*.tar.gz,*.tar.bz2,*.tar.xz,*.tar.zst,*.rar,*.7z,*.exe,*.msi,*.apk,*.iso,*.img,*.bin,*.db,*.sqlite,*.db3,*.sql,*.dbf,*.mdb,*.log,*.cache,*.tmp,*.temp,*.o,*.obj,*.dll,*.class,*.pyc,*.pyo,*.rbc,*.jar,*.war,*.ear,*.sar"
vim.opt.splitright = true -- Vertical splits will automatically be to the right
vim.opt.background = "dark" -- tell vim what the background color looks like
vim.opt.wrap = false
vim.opt.title = true
vim.opt.spell = false
vim.opt.cursorlineopt = "line,number"
vim.opt.cursorline = true
vim.opt.completeopt = {
    "menu",
    "menuone",
    "preview",
}
vim.opt.list = true
vim.opt.listchars = {
    space = " ",
    extends = "➔",
    trail = " ",
    lead = " ",
    tab = "   "
}

-- Abbrev vim.cmd("cnoreabbrev Q  q")
vim.cmd("cnoreabbrev q1  q!")
vim.cmd("cnoreabbrev Q1  q!")
vim.cmd("cnoreabbrev Qa1 qa!")
vim.cmd("cnoreabbrev Qa qa")
vim.cmd("cnoreabbrev W  w")
vim.cmd("cnoreabbrev Wq wq")
vim.cmd("cnoreabbrev WQ wq")
vim.cmd("cnoreabbrev Set set")
vim.cmd("cnoreabbrev SEt set")
vim.cmd("cnoreabbrev SET set")
