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
Plug 'valloric/youcompleteme', { 'do': './install.py --clang-completer' }
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'bling/vim-bufferline'
Plug 'qpkorr/vim-bufkill'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'tpope/vim-fugitive'
Plug 'kien/ctrlp.vim'
call plug#end()


" Airline Configuration
let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'
let g:airline_powerline_fonts = 1
let g:airline_section_b = '%{airline#util#wrap(airline#extensions#branch#get_head(),80)}'
let g:airline_section_y = ''
let g:airline_section_x = ''
let g:airline_section_error = ''
let g:airline_section_warning = ''
let g:airline_skip_empty_sections = 1
let g:airline#extensions#wordcount#enabled = 0
set noshowmode

let g:airline#extensions#default#section_truncate_width = {
  \ 'b': 95,
  \ 'x': 95,
  \ 'z': 95,
  \ }

" bufkill: kill buffers with <C-c>
"map <C-c> :BD<cr>
map <C-x> :q<cr>
nnoremap <silent> <expr> <C-c>   (expand('%') =~ 'NERD_tree' ? '' : ':BD<cr>')

" Bufferline
let g:bufferline_rotate = 1
let g:bufferline_fixed_index =  -2
let g:bufferline_echo = 0
autocmd VimEnter *
\ let &statusline='%{bufferline#refresh_status()}'
  \ .bufferline#get_status_string()

" Changing Buffers (but disable in NERDtree
nnoremap <silent> <expr> <C-PageUp>   (expand('%') =~ 'NERD_tree' ? '' : ':bp<cr>')
nnoremap <silent> <expr> <C-PageDown> (expand('%') =~ 'NERD_tree' ? '' : ':bn<cr>')


" Gutentags Config
"
" Disable gutentags for git commits and git rebase.
" This solves a problem where gutentags was erroring
" out when closing a git commit. Solution taken from:
"
" https://github.com/ludovicchabant/vim-gutentags/issues/168
au FileType gitcommit,gitrebase let g:gutentags_enabled=0

" YouCompleteMe Config
"
" Automatically close preview window (little window at bottom/top)
" when we leave insert mode. YouCompleteMe uses the preview window
" to show the documentation of the currently selected completion
" when using symantic completion.
let g:ycm_autoclose_preview_window_after_insertion = 1


" Python Syntax Highlighting
let g:python_highlight_all = 1

" GitGutter Config
nmap g<PageUp>   <Plug>GitGutterPrevHunk
nmap g<PageDown> <Plug>GitGutterNextHunk
"set updatetime=100


cnoreabbrev ack Ack!

" Set ag as seach program
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" Highligh search term in ack.vim
let g:ackhighlight = 1

" NERDcommenter Config
"
" This plugin allows easy commenting of various
" code blocks. It automatically chooses the correct
" comment character for the current source file type.
"
" Make NERDcommenter use C++ style comments for C files
" and remap <CTRL-/> to toggle comments on/off in all
" of insert, normal, and visual modes.
let g:NERDCustomDelimiters = { 'c': { 'left': '//'} }
let g:NERDDefaultAlign = 'left'
inoremap <silent> <C-_> <C-o>:call NERDComment(0,"toggle")<C-m>
nnoremap <silent> <C-_> :call NERDComment(0,"toggle")<Enter>
vnoremap <silent> <C-_> :call NERDComment(0,"toggle")<Enter>
let g:NERDTreeStatusline = -1 ""git>>" . trim(system('git rev-parse --abbrev-ref HEAD'))

" NERDTree highlighting
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1

" Sort Order
let g:NERDTreeSortOrder = ['\/$',  '\.vim$', '\.h$', '\.c$', '*', 'foobar']

" Fix windows with NERDTree and ack.vim
let g:ack_mappings = {'v':  '<C-W><CR><C-W>L<C-W>p<C-W>J<C-W>p'}

" NERDTree Config
"
" Automatically delete the buffers of
" files deleted in NERDTree.
let NERDTreeAutoDeleteBuffer = 1

" Close NERDTree if it's the only thing left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Auto start NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in")  | NERDTree | wincmd p | endif

" Keyboard shortcut for NERDTree
nnoremap <silent> <Leader>f :NERDTreeToggle<Enter>:wincmd =<Enter>
nnoremap -  :split<cr>
nnoremap \| :vsplit<cr>
let NERDTreeMapOpenSplit='-'
let NERDTreeMapOpenVSplit='<Bar>'

" Have NERDTree ignore some files
let NERDTreeIgnore=['__pycache__', '\.map','\.o$', '\~$', '\.git$', '\.zhistory$', '\.zcompdump', '\.zcompcache$', 'tags', '\.aux', '\.blg', '\.fdb_latexmk', '\.fls', '\.log', '\.out', '\.toc', '\.obj']
let NERDTreeMinimalUI = 1
"let g:NERDTreeStatusline = " "

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

" Allow us to have unsaved
" hidden buffers.
set hidden

" Set cursor scrolling offset
set scrolloff=10

" Allow scrolling with ctrl-up/down
map <C-Up>   <C-y>
map <C-Down> <C-e>
imap <C-Up>   <C-o><C-y>
imap <C-Down> <C-o><C-e>

set mouse=a

" Visual Changes
set nowrap
set ruler
set number
set colorcolumn=80,120

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

" Fix for issue with NERDTree line highlighting with
" NERDTree-syntax-highlighing installed. Solution from:
"
" https://github.com/neovim/neovim/issues/9019#issuecomment-439921147
highlight NERDTreeFile ctermfg=14
hi Normal ctermbg=none

" Dimming inactive vim windows
hi InactiveWindow ctermbg=black
set winhighlight=Normal:ActiveWindow,NormalNC:InactiveWindow

" Cursor Line
set cursorline
