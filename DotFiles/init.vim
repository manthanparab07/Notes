syntax on

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'morhetz/gruvbox'
Plug 'scrooloose/nerdTree'
Plug 'tpope/vim-surround'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
Plug 'google/vim-glaive'

" dependencies for code format 
Plug 'rhysd/vim-clang-format'
Plug 'maksimr/vim-jsbeautify'
" List ends here. Plugins become visible to Vim after this call.
call plug#end()

colorscheme gruvbox

set background=dark    " Setting dark mode
" set background=light " Setting light mode

set relativenumber
set ignorecase
set autoindent

" activate the plugin
set mouse=a

" remap keys for NerdTree to Ctrl+n
nmap <C-n> :NERDTreeToggle<CR>

" Airline Theme
let g:airline_theme='luna'


" indentation settings -- unless otherwise specified by a filetype, use 4-space tab and expanded tabs
set shiftwidth=4
set softtabstop=4
set tabstop=4
set autoindent

" AutoFormat automatically 
augroup autoformat_settings
  autocmd FileType bzl AutoFormatBuffer buildifier
  autocmd FileType c,cpp,proto,javascript AutoFormatBuffer clang-format
  autocmd FileType dart AutoFormatBuffer dartfmt
  autocmd FileType go AutoFormatBuffer gofmt
  autocmd FileType gn AutoFormatBuffer gn
  autocmd FileType html,css,sass,scss,less,json AutoFormatBuffer js-beautify
  autocmd FileType java AutoFormatBuffer google-java-format
  autocmd FileType python AutoFormatBuffer yapf
  " Alternative: autocmd FileType python AutoFormatBuffer autopep8
  autocmd FileType rust AutoFormatBuffer rustfmt
  autocmd FileType vue AutoFormatBuffer prettier
augroup END

" Auto-open NerdTree on start
autocmd vimenter * NERDTree
" Go to previous (last accessed) window.
autocmd VimEnter * wincmd p
" Close NerdTree on Selecting File to edit
let NERDTreeQuitOnOpen = 1

" Minimalizing NerdTree
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1


" Go to tab by number
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

" Switch tab using Ctrl -> or <- 
nnoremap <C-h> :tabprevious<CR>
nnoremap <C-l> :tabnext<CR>

set showcmd             " Show command in bottom bar
set cursorline          " highlight currentline
set lazyredraw          " redraw only when we need to.
set showmatch           " highlight matching [{()}]
set incsearch           " search as characters are entered
set hlsearch            " highlight matches

" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" move to beginning/end of line
nnoremap B ^
nnoremap E $

" $/^ doesn't do anything
nnoremap $ <nop>
nnoremap ^ <nop>

" highlight last inserted text
nnoremap gV `[v`]<Paste>

let mapleader=","       " leader is comma

set nobackup
set nowritebackup
set noswapfile

" Use a bar-shaped cursor for insert mode, even through tmux.
 if exists('$TMUX')
     let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
         let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
         else
             let &t_SI = "\<Esc>]50;CursorShape=1\x7"
                 let &t_EI = "\<Esc>]50;CursorShape=0\x7"
                 endif

set t_Co=256                " 256 colors terminal

" Quit NerdTree on Opening a File
let NERDTreeQuitOnOpen = 1

" Quit on Open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Specify NerdTree Window
let g:NERDTreeWinSize=17

