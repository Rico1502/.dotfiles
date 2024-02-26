vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set relativenumber")
vim.cmd("inoremap jk <ESC>")
vim.cmd("inoremap jj <ESC>")
vim.g.mapleader = " "
vim.cmd("nnoremap <silent> <leader>cs :let @/ = \"\"<CR>")

