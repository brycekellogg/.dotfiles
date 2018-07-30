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
Plug 'kien/ctrlp.vim'
Plug 'mileszs/ack.vim'
call plug#end()

cnoreabbrev ack Ack!

" Set ag as seach program
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" Highligh search term in ack.vim
let g:ackhighlight = 1

" Fix windows with NERDTree and ack.vim
let g:ack_mappings = {'v':  '<C-W><CR><C-W>L<C-W>p<C-W>J<C-W>p'}

" Close vim if NERDTree is only thing left
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Auto start NERDTree
autocmd VimEnter * if &filetype !=# 'gitcommit' | NERDTree | wincmd p | endif

" Have NERDTree ignore some files
let NERDTreeIgnore=['\.o$', '\~$', '\.git', 'tags']
let NERDTreeMinimalUI = 1

" Vim/Tmux Integration Mappings
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <M-Left> :TmuxNavigateLeft<cr>
nnoremap <silent> <M-Down> :TmuxNavigateDown<cr>
nnoremap <silent> <M-Up> :TmuxNavigateUp<cr>
nnoremap <silent> <M-Right> :TmuxNavigateRight<cr>

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
