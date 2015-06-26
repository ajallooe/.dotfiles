set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/.vim/bundle/pyclewn/
let $PATH .= ":" . $HOME . "/.vim/bundle/pyclewn-bin/bin"
let $PYTHONPATH .= ":" . $HOME . "/.vim/bundle/pyclewn-bin/lib/python"

call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}

Plugin 'ervandew/supertab'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'bling/vim-airline'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'kien/ctrlp.vim'
"Plugin 'Shougo/unite.vim'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'vim-scripts/a.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'scrooloose/nerdtree'
Plugin 'fholgado/vim-autoclose'
Plugin 'kana/vim-operator-user'
Plugin 'weynhamz/vim-plugin-minibufexpl'
Plugin 'sjl/gundo.vim'
Plugin 'edsono/vim-matchit'
Plugin 'rdnetto/YCM-Generator'
Plugin 'tpope/vim-dispatch'
" Plugin 'lox/vim-easytags'
Plugin 'rking/ag.vim'

Plugin 'altercation/vim-colors-solarized.git'
Plugin 'flazz/vim-colorschemes'
Plugin 'tomasr/molokai'
Plugin 'sickill/vim-monokai'
Plugin 'w0ng/vim-hybrid'
Plugin 'chriskempson/base16-vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
"filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update 
"                     or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to 
"                     auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" To install YCM:
" cd ~/.vim/bundle/YouCompleteMe
" ./install.sh --clang-completer

"let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0

" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.


" Misc
set hidden               " Make buffer hidden (instead of unloaded) when 
                         " changing buffers. AT LAST
                         " undo history is not lost on :edit or :bnext

set modeline            " allow per-file settings via modeline
set showmatch           " Show matching brackets.
set wrap                " Enable dynamic wrapping
set linebreak           " Display dynamic wrapping linebreaks 
set display=uhex   
set ruler               " show cursor position in status bar
set number              " show absolute line number of the current line
set numberwidth=4
set cursorline
map <F12> :b #<CR>      " Jump to alternate buffer
set pastetoggle=<F11>   " Go in paste mode (no more autoindent, very useful 
                        " when pasting with mouse)
set encoding=utf-8      " default to UTF-8 for editing
set fileencoding=utf-8  " saving and encoding
set termencoding=utf-8

filetype on
filetype plugin indent on
syntax on

set formatoptions-=o

let mapleader = ','

function MouseSwitchMode()
    if &mouse == ''
        if has('clipboard')
            set mouse=a
        else
            set mouse=nvc
        endif
    else
        set mouse=
    endif
endfunction
map <F2> :call MouseSwitchMode()<CR>
call MouseSwitchMode()

" Make backspace delete anything
set backspace=indent,start,eol

" Search
set ignorecase          " Do case insensitive matching
set smartcase           " Fall back to case sensitive if search pattern has an 
                        " upper case character
set incsearch           " Incremental search
set hlsearch            " Highlight search 
map <F10> :nohlsearch<CR>   " Temporarily disable highlighting, re-enabled for 
                            " the next search

" Tab and indent handling
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=8
set expandtab

" Status line
set showcmd             " Show (partial) command in status line.
set showmode            " Display current mode (insert, replace, ...)
set laststatus=2        " Always display status line
set statusline=%f\ %h%r\ %=%l/%L,%c%10.n%5.P
set statusline=%-40.40f%<\ [%.20{getcwd()}]%h%r\ %=%l/%L,%c%10.n%14.PM

" Save and restore last position in buffer
:au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | 
            \ exe "normal g'\"" | endif

" Ignore whitespace changes by default in diff
set diffopt=filler,iwhite
if v:version >= 700
    set diffopt+=vertical
endif
set encoding=utf-8
set shellpipe=2>&1\|\ tee\ -i
set wildmenu
set textwidth=79
set scrolloff=10        " scroll the window so we can always see 10 lines
                        " around the cursor
set spell spelllang=en_us
set nospell

set background=dark
colorscheme base16-ocean
set t_Co=256
let base16colorspace=256  " Access colors present in 256 colorspace

set exrc
set secure

" highlight the 80th column

" In Vim >= 7.3, also highlight columns 120+
if exists('+colorcolumn')
   " (I picked 120-320 because you have to provide an upper bound and 500
   " seems to be enough.)
    let &colorcolumn="80,".join(range(120,500),",")
else
    " fallback for Vim < v7.3
    autocmd BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%'>80v.\+', -1)
endif

inoremap jk <ESC>

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" If you want :UltiSnipsEdit to split your window.
"let g:UltiSnipsEditSplit="vertical"

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


let g:autoclose_vim_commentmode = 1

map <C-I> :pyf path_to_clang_format/clang-format.py<CR>
imap <C-I> <ESC>:pyf path_to_clang_format/clang-format.py<CR>i

" Set minibufexplorer keys
let g:miniBufExplMapWindowNavVim = 1 

if executable('ag')
      " Use Ag over Grep
      set grepprg=ag\ --nogroup\ --nocolor
       
      " Use ag in CtrlP for listing files. Lightning fast and respects
      " .gitignore
      let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPLastMode'
let g:ctrlp_extensions = ['buffertag', 'tag', 'line', 'dir']

"call unite#filters#matcher_default#use(['matcher_fuzzy'])
"call unite#filters#sorter_default#use(['sorter_rank'])
"call unite#custom#source('file,file/new,buffer,file_rec,line', 'matchers', 
            "\ 'matcher_fuzzy')
"nnoremap <C-k> :<C-u>Unite -buffer-name=search -start-insert line<cr>

set makeprg=make\ -j2

nnoremap <silent> <Leader>b :TagbarToggle<CR>
nnoremap <leader>. :CtrlPTag<cr>
nnoremap <F4> :Make!<cr>

" nnoremap <F5> :!./my_great_program<cr>
