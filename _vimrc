set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'

Bundle 'tpope/vim-fugitive'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'mattn/zencoding-vim'
Bundle 'hallison/vim-markdown'
Bundle 'tpope/vim-surround'
Bundle 'vim-scripts/mru.vim'
Bundle 'skammer/vim-css-color'
Bundle 'vim-scripts/vydark'
Bundle 'vim-scripts/vylight'
Bundle 'vim-scripts/Cleanroom'
Bundle "altercation/solarized"
Bundle "vim-scripts/vimwiki"
Bundle "mjbrownie/browser.vim"

filetype plugin indent on
set history=10000
runtime macros/matchit.vim


:set shortmess +=I

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab


" Intuitive backspacing in insert mode
set backspace=indent,eol,start

syntax on
"syntax highlight

set hidden

nnoremap ' `
nnoremap ` '

let mapleader = ","

"space = :
nmap <space> :

let NERDTreeShowBookmarks=1
"let NERDTreeShowHidden=1

set title
set ruler
"set rulerformat=%l,%c%V%=%P
"let php_sql_query=1 #???
"let php_htmlInStrings=1 #???

"kódování češtiny
"zdroj http://www.abclinuxu.cz/poradna/linux/show/265256
function! ChangeFileencoding()
	let encodings = ['iso88592', 'utf8', 'cp1250']
	let prompt_encs = []
	let index = 0
	while index < len(encodings)
 		call add(prompt_encs, index.'. '.encodings[index])
		let index = index + 1
	endwhile
	let choice = inputlist(prompt_encs)
	if choice >= 0 && choice < len(encodings)
		execute 'e ++enc='.encodings[choice].' %:p'
	endif
endf

nmap <F8> :call ChangeFileencoding()<CR>

nmap <silent> <leader>n :silent :nohlsearch<CR>
"set listchars=tab:▸\ ,trail:·,eol:¬
nmap <silent> <leader>s :set nolist!<CR>
"set visualbell

set nu
set showmatch
scriptencoding utf-8

if !has('gui')
    "set term=$TERM          " Make arrow and other keys work
endif


set mouse=a                 " automatically enable mouse usage
set viewoptions=folds,options,cursor,unix,slash " better unix / windows compatibility
set virtualedit=onemore         " allow for cursor beyond last character
if has('cmdline_info')
    set ruler                   " show the ruler
endif


set laststatus=2
    set statusline=%<%f\    " Filename
    set statusline+=%w%h%m%r " Options
    set statusline+=%{fugitive#statusline()} "  Git Hotness
    set statusline+=\ [%{&ff}/%Y]            " filetype
    set statusline+=\ [%{getcwd()}]          " current dir
    set statusline+=\ [%{strlen(&fenc)?&fenc:'none'}] "file encoding

set wildmode=longest,list,full
set wildmenu

".vimrc se aplikuje (příkaz source) bez nutnosti restartu macvim
if has("autocmd")
    autocmd bufwritepost .vimrc source $MYVIMRC
endif

set relativenumber


nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <tab> %
vnoremap <tab> %

set linebreak

function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc

nnoremap <C-n> :call NumberToggle()<cr>

"vimwiki
let g:vimwiki_list = [{'path': '~/vimwiki/', 'ext': '.txt', 'path_html': '~/vimwiki/html/', 'template_path': '~/vimwiki/html/templates/', 'template_default': 'default', 'template_ext': '.html'}, {'path': '~/vimwiki2/', 'ext': '.txt'}]

set guifont=Inconsolata:h12

colorscheme peachpuff-v

set complete=.,w,b,t

" CDC = Change to Directory of Current file
command CDC cd %:p:h
