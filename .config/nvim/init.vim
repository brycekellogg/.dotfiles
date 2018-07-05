" Install Vim-Plug
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


" Choose Plugins
call plug#begin('~/.local/share/nvim/plugged')
Plug 'scrooloose/nerdtree',
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'micha/vim-colors-solarized'
Plug 'ludovicchabant/vim-gutentags'
Plug 'majutsushi/tagbar'
Plug 'christoomey/vim-tmux-navigator'
call plug#end()

" Close vim if NERDTree is only thing left
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Auto start NERDTree
autocmd VimEnter * if &filetype !=# 'gitcommit' | NERDTree | wincmd p | endif

" Have NERDTree ignore some files
let NERDTreeIgnore=['\.o$', '\~$', '\.git']
let NERDTreeMinimalUI = 1

" Vim/Tmux Integration Mappings
let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <M-Left> :TmuxNavigateLeft<cr>
nnoremap <silent> <M-Down> :TmuxNavigateDown<cr>
nnoremap <silent> <M-Up> :TmuxNavigateUp<cr>
nnoremap <silent> <M-Right> :TmuxNavigateRight<cr>
"nnoremap <silent> {Previous-Mapping} :TmuxNavigatePrevious<cr>

set mouse=a

" Visual Changes
set nowrap
set ruler
set number

" Set tab settings (always use 4 spaces)
set expandtab
set tabstop=4
set shiftwidth=4

" Set clipboard to system clipboard
set clipboard+=unnamedplus

" Remap window movement to ctrl+arrows
nmap <silent> <C-Up> :wincmd k<CR>
nmap <silent> <C-Down> :wincmd j<CR>
nmap <silent> <C-Left> :wincmd h<CR>
nmap <silent> <C-Right> :wincmd l<CR>

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
