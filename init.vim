" Install Vim-Plug
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


" Choose Plugins
call plug#begin('~/.local/share/nvim/plugged')
Plug 'micha/vim-colors-solarized'
Plug 'christoomey/vim-tmux-navigator'
Plug 'scrooloose/nerdtree',
Plug 'Xuyuanp/nerdtree-git-plugin',
Plug 'scrooloose/nerdcommenter'
Plug 'ludovicchabant/vim-gutentags'
Plug 'majutsushi/tagbar'
Plug 'airblade/vim-gitgutter'
Plug 'mileszs/ack.vim'
Plug 'vim-python/python-syntax'
Plug 'valloric/youcompleteme'
Plug 'octol/vim-cpp-enhanced-highlight'
call plug#end()


" Python Syntax Highlighting
let g:python_highlight_all = 1

" GitGutter Config
"set updatetime=100


cnoreabbrev ack Ack!

" Set ag as seach program
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" Highligh search term in ack.vim
let g:ackhighlight = 1

" Make NERDcommenter use // for C comments
let g:NERDCustomDelimiters = { 'c': { 'left': '//'} }

" Fix windows with NERDTree and ack.vim
let g:ack_mappings = {'v':  '<C-W><CR><C-W>L<C-W>p<C-W>J<C-W>p'}

" Close vim if NERDTree is only thing left
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Auto start NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in")  | NERDTree | wincmd p | endif

" Keyboard shortcut for NERDTree
nnoremap <Leader>f :NERDTreeToggle<Enter>:wincmd =<Enter>
nnoremap - <NOP>
nnoremap \| <NOP>
let NERDTreeMapOpenSplit='-'
let NERDTreeMapOpenVSplit='<Bar>'

" Have NERDTree ignore some files
let NERDTreeIgnore=['\.map', '\.o$', '\~$', '\.git', 'tags', '\.aux', '\.blg', '\.fdb_latexmk', '\.fls', '\.log', '\.out', '\.toc', '\.obj']
let NERDTreeMinimalUI = 1
let g:NERDTreeStatusline = " "

" Vim/Tmux Integration Mappings
"
" Plugin vim-tmux-navigator allows navigating
" vim splits and tmux panes seamlessly. These
" settings map <ALT>+<Arrow Keys> to the
" Navigation of these splits/panes.
"
" Additionally, disables moving out of vim when
" a vim split is the maximized tmux pane.
let g:tmux_navigator_no_mappings = 1
let g:tmux_navigator_disable_when_zoomed = 1
nnoremap <silent> <M-Left>  :TmuxNavigateLeft<cr>
nnoremap <silent> <M-Down>  :TmuxNavigateDown<cr>
nnoremap <silent> <M-Up>    :TmuxNavigateUp<cr>
nnoremap <silent> <M-Right> :TmuxNavigateRight<cr>

" Resize splits automatically
autocmd VimResized * wincmd =

set mouse=a

" Visual Changes
set nowrap
set ruler
set number
set colorcolumn=80

" Set tab settings (always use 4 spaces)
set expandtab
set tabstop=4
set shiftwidth=4
let g:python_recommended_style=0  " override python tabstop

" Set clipboard to system clipboard
set clipboard+=unnamedplus

" Split below and right
set splitbelow
set splitright

" Unmap annoying q issues
nnoremap q: <nop>
nnoremap Q <nop>

" Not Sure
filetype plugin on
syntax enable

" Solarized Colors
set background=dark
colorscheme solarized
