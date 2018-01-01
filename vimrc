set backspace=indent,eol,start
set clipboard=unnamed
set hidden
set history=1000
set hlsearch
set ignorecase
set incsearch
set list
set listchars=tab:▸\ ,trail:·,nbsp:␣
set nocompatible
set noerrorbells
set smartcase
set undodir=$HOME/.vim-undo
set undofile
set undolevels=1000
set undoreload=10000
set visualbell

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

augroup Writing
  au!
  au Filetype text,markdown,mkd,md call SetWritingOptions()
augroup END

augroup RestoreCursorPositionGroup
  au!
  " Save window position when leaving buffers
  au BufLeave * let b:winview = winsaveview()
  au BufEnter * if(exists('b:winview')) | call winrestview(b:winview) | endif
augroup END

augroup MyFormatting
  au!
  " Remove extra newlines and trailng whitspace when saving
  au BufWritePre * : %s/\n\n\n\+//e | %s/\s\+$//e
augroup END

augroup autoSaveAndRead
  autocmd!
  autocmd TextChanged,InsertLeave,FocusLost * silent! wall
  autocmd CursorHold *                        silent! checktime
augroup END

augroup autoResize
  au!
  au VimResized * wincmd =
augroup END

function SetWritingOptions()
  set spell spelllang=en_us
  Goyo
  HardPencil
endfunction
