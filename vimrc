set backspace=indent,eol,start
set clipboard=unnamed
set nocompatible

call plug#begin('~/.vim/plugged')
  Plug 'christoomey/vim-tmux-navigator'
  let g:tmux_navigator_no_mappings = 1

  Plug 'junegunn/fzf'
  Plug 'junegunn/fzf.vim'
  Plug 'junegunn/goyo.vim'
  Plug 'NLKNguyen/papercolor-theme'
  Plug 'reedes/vim-pencil'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-rsi'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-unimpaired'
call plug#end()

nmap <SPACE>b :Buffer<CR>
nmap <SPACE>i :BLines<CR>
nmap <SPACE>t :Files<CR>
nmap <SPACE><TAB> :b#<CR>
nmap <SPACE>u :PlugUpdate<CR>
nmap <SPACE>fr :History<CR>

nnoremap <C-J> <C-W>
nnoremap <C-J>x <C-W>q
nnoremap <silent> <C-J>h :TmuxNavigateLeft<CR>
nnoremap <silent> <C-J>j :TmuxNavigateDown<CR>
nnoremap <silent> <C-J>k :TmuxNavigateUp<CR>
nnoremap <silent> <C-J>l :TmuxNavigateRight<CR>
nnoremap <silent> <C-J>b :TmuxNavigatePrevious<CR>

set background=light
colorscheme PaperColor
highlight LineNr guifg=#cccccc
