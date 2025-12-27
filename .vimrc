let mapleader = "\\"

nnoremap gr :tabprevious<CR>
nnoremap gn :tabnew<CR>
nnoremap gw :tabclose<CR>
nnoremap <Leader>f :GFiles<CR>
nnoremap <Leader>d :Ag<CR>
nnoremap <Leader>n :NERDTreeToggle<CR>

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'preservim/nerdtree'
Plug 'mileszs/ack.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()

autocmd VimResized * wincmd =
autocmd VimEnter */workspace/* NERDTree| wincomd p

" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | call feedkeys(":quit\<CR>:\<BS>") | endif

" Turn on syntax highlighting
syntax on

" Stick swap files somewhere else
set directory=$HOME/.vim/tmp//

" Automatically wrap text that extends beyond the screen width
set wrap

" Convert tabs to spaces
set expandtab

" 2-space tabs
set tabstop=2

" Use 2-space tabs when auto-indenting
set shiftwidth=2
set softtabstop=2

" Highlight matching parens, braces, etc
set matchpairs+=<:>

" Show line numbers
set number

" Highlight matching search patterns
set hlsearch
" Incrementally highlight search matches as you type
set incsearch
" Ignore case when searching
set ignorecase

" Allows backspacing over all characters, including auto-indentation and line breaks
set backspace=indent,eol,start

" Show commands as they're typed
set showcmd

" t: Automatically wrap text at textwidth.
" c: Automatically format comments. When typing within a comment, new lines will automatically start with the comment leader.
" q: Allows formatting of comments with gq.
" r: Automatically insert the comment leader after pressing Enter in insert mode within a comment.
" o: Automatically insert the comment leader when pressing o or O in Normal mode to add new lines below or above a comment.
" n: Recognizes numbered lists (e.g., "1. Item") and formats them correctly, preventing joining list items into a single paragraph.
" l: Don't break long lines in insert mode.
" 1: Break lines before a single-letter word if textwidth is exceeded.
" 2: Indent subsequent lines of a paragraph based on the indentation of the second line, rather than the first.
" j: Remove the comment leader when joining comment lines.
set formatoptions=tcqronj
