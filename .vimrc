colorscheme blackboard
set go-=T
set number
set guifont=monaco:h12
set dir=/tmp,/var/tmp/,.
set co=200
set lines=54
set shiftwidth=2
set tabstop=2
set expandtab
set smartcase
set grepprg=ack
set smartindent
set autoindent


let g:fuzzy_ignore = "*.log;*.png;*.jpg;*.gif;vendor/**;coverage/**;tmp/**"
let g:fuzzy_matching_limit = 20
 
let mapleader = ","
map <leader>t :FuzzyFinderTextMate<CR>
map <leader>nn :NERDTreeToggle<CR>

if has("gui_running")
  set fuoptions=maxvert,maxhorz
  au GUIEnter * set fullscreen
endif
