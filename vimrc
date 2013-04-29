" Leader
let mapleader = ","

""" Vundle config start
set nocompatible               " be iMproved
filetype off                   " required!

" Setting up Vundle - the vim plugin bundler
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
  echo "Installing Vundle.."
  echo ""
  silent !mkdir -p ~/.vim/bundle
  silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
  let iCanHazVundle=0
endif
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
"Add your bundles here
Bundle 'Syntastic'
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
Bundle 'airblade/vim-gitgutter'
Bundle 'thoughtbot/vim-rspec'
Bundle 'croaky/vim-colors-github'

"" vim-snipmate  dependencies
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "honza/vim-snippets"
Bundle "garbas/vim-snipmate"

"...All your other bundles...
if iCanHazVundle == 0
  echo "Installing Bundles, please ignore key map error messages"
  echo ""
  :BundleInstall
endif
" Setting up Vundle - the vim plugin bundler end

filetype plugin indent on     " required!
""" Vundle config end

map <Leader>cn :e ~/Dropbox/notes/coding-notes.txt<cr>
map <Leader>pn :sp ~/Dropbox/work/infakt/notes/project-notes.txt<cr>


"" General settings
syntax on

" Color scheme
colorscheme github
highlight NonText guibg=#060606
highlight Folded  guibg=#0A0A0A guifg=#9090D0

set nocompatible                " choose no compatibility with legacy vi
set encoding=utf-8
set showcmd                     " display incomplete commands
filetype plugin indent on       " load file type plugins + indentation
set laststatus=2                " Always show the statusline
set hidden                      " Maintain scroll position (don't close buffer)
runtime macros/matchit.vim      " Needed for Ruby block selection support: https://github.com/nelstrom/vim-textobj-rubyblock

set ofu=syntaxcomplete#Complete

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


"" Line numbering, cursor
set number                        " Show line numbers
set numberwidth=5
set ruler                         " Show cursor position.
set scrolloff=3                   " Show 3 lines of context around the cursor.

" Use Ag (https://github.com/ggreer/the_silver_searcher) instead of Ack when
" available
if executable("ag")
  let g:ackprg = 'ag --nogroup --nocolor --column'
endif

" Switch between the last two files
nnoremap <leader><leader> <c-^>

"" Yankring
let g:yankring_history_file = '.yankring_history'
map <leader>y :YRShow<cr>

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
nnoremap <leader>\ :nohl<cr>      " un-highlight search results
map <F5> :call system('pbcopy', @%)<cr> " Copy file path to clipboard
map <leader>p :CtrlP<cr>
map <leader>b :CtrlPBuffer<cr>

"" ctrl + hjkl
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Get rid of the delay when hitting esc!
 set noesckeys

" Make the omnicomplete text readable
:highlight PmenuSel ctermfg=black

" Snippets are activated by Shift+Tab
let g:snippetsEmu_key = "<S-Tab>"

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
set wildmode=list:longest,list:full
set complete=.,w,t
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>

"" Disable arrow keys
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

map <C-s> <esc>:w<CR>
imap <C-s> <esc>:w<CR>
map <C-x> <C-w>c
map <C-n> :cn<CR>
map <C-p> :cp<CR>

" Set the tag file search order
set tags=./tags;
