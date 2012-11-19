""" Vundle config start
set nocompatible               " be iMproved
filetype off                   " required!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-rails'
Bundle 'altercation/vim-colors-solarized'
Bundle 'kien/ctrlp.vim'
Bundle 'Lokaltog/vim-powerline'
Bundle 'mileszs/ack.vim'
Bundle 'kana/vim-textobj-user'
Bundle 'nelstrom/vim-textobj-rubyblock'
Bundle 'scrooloose/nerdtree'
Bundle 'tomtom/tcomment_vim'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'vim-scripts/YankRing.vim'

"" vim-snipmate  dependencies
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "honza/snipmate-snippets"

Bundle "garbas/vim-snipmate"


filetype plugin indent on     " required!
""" Vundle config end

"" General settings
set nocompatible                " choose no compatibility with legacy vi
syntax enable
set encoding=utf-8
set showcmd                     " display incomplete commands
filetype plugin indent on       " load file type plugins + indentation
set laststatus=2                " Always show the statusline
set hidden                      " Maintain scroll position (don't close buffer)
runtime macros/matchit.vim      " Needed for Ruby block selection support: https://github.com/nelstrom/vim-textobj-rubyblock

" Visual
set showmatch  " Show matching brackets.
set mat=5  " Bracket blinking.
set list

"" Whitespace
set nowrap                      " don't wrap lines
set tabstop=2 shiftwidth=2      " a tab is two spaces (or set this to 4)
set expandtab                   " use spaces, not tabs (optional)
set backspace=indent,eol,start  " backspace through everything in insert mode
set listchars=trail:·

"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

"" Color scheme
"let g:solarized_termcolors = &t_Co
let g:solarized_termtrans = 1
let g:solarized_termcolors=256
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
set background=light
colorscheme solarized

"" Line numbering, cursor
set relativenumber                " Show relative line numbers
set ruler                         " Show cursor position.
set scrolloff=3                   " Show 3 lines of context around the cursor.

"" Yankring
let g:yankring_history_file = '.yankring_history'

"" NERDTree
function! ShowFileInNERDTree()
  if exists("t:NERDTreeBufName")
    NERDTreeFind
  else
    NERDTree
    wincmd l
    NERDTreeFind
  endif
endfunction
map <leader>d :call ShowFileInNERDTree()<cr>

"" Wild stuff
set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest         " Complete files like a shell.
set wildignore+=vendor,log,tmp,*.swp,.git,gems,.bundle,Gemfile.lock,.gem,.rvmrc,.gitignore,.DS_Store,data

"" Misc shortcuts
nnoremap <leader><space> :nohl<cr>      " un-highlight search results
map <F5> :call system('pbcopy', @%)<cr> " Copy file path to clipboard
map <leader>p :CtrlP<cr>
map <leader>b :CtrlPBuffer<cr>
