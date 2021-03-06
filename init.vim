" Install Vim-Plug
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


" Choose Plugins
call plug#begin('~/.local/share/nvim/plugged')
Plug 'micha/vim-colors-solarized'
Plug 'heewa/vim-tmux-navigator', {'branch': 'add-no-wrap-option'}
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'scrooloose/nerdcommenter'
Plug 'ludovicchabant/vim-gutentags'
Plug 'airblade/vim-gitgutter'
Plug 'mileszs/ack.vim'
Plug 'vim-python/python-syntax'
Plug 'valloric/youcompleteme', {'for': ['c', 'c++', 'python'], 'do': './install.py --clang-completer' }
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'bling/vim-bufferline'
Plug 'qpkorr/vim-bufkill'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'kien/ctrlp.vim'
Plug 'sheerun/vim-polyglot'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'bronson/vim-trailing-whitespace'
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

" Killing Buffers & Windows
"
" Use <Leader>c for killing buffers and <Leader>x for killing
" windows. When killing windows, never close last window of close
" window so only NERDTree is left. When closing buffers, don't close
" the NERDTree buffer.
"
" TODO: Buffer kill ignore = [NERD_tree, quickfix, help, tagbar]
nnoremap <silent> <expr> <Leader>x   (winnr("$")==2 && bufwinnr("NERD_tree")!=-1 && expand('%')!~'NERD_tree' ? '' : ':close<cr>')
nnoremap <silent> <expr> <Leader>c   ((expand('%') =~ 'NERD_tree') \|\| (getwininfo(win_getid())[0]['quickfix']) ? '' : ':BD<cr>')

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
nmap g<PageUp>   <Plug>(GitGutterPrevHunk)
nmap g<PageDown> <Plug>(GitGutterNextHunk)
"set updatetime=100

" Remap question mark to search for a word
" using Ack (ag) in all files under cwd
nnoremap ? :Ack! <cword><cr>

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
let g:NERDCreateDefaultMappings = 0
inoremap <silent> <C-_> <C-o>:call NERDComment(0,"toggle")<C-m>
nnoremap <silent> <C-_> :call NERDComment(0,"toggle")<Enter>
vnoremap <silent> <C-_> :call NERDComment(0,"toggle")<Enter>

" NERDTree highlighting
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1

" Sort Order
let g:NERDTreeSortOrder = ['\/$',  '\.vim$', '\.h$', '\.c$', '\.cpp$', '*']

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
let NERDTreeIgnore=['__pycache__', '\.map', '\.class$', '\.o$', '\~$', '\.git$', '\.zhistory$', '\.zcompdump', '\.zcompcache$', 'tags', '\.aux', '\.blg', '\.fdb_latexmk', '\.fls', '\.log', '\.out', '\.toc', '\.obj']
let NERDTreeMinimalUI = 1
let g:NERDTreeStatusline = " "

" Close NERDTree after selecting a file
let NERDTreeQuitOnOpen=1

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
let g:tmux_navigator_no_wrap = 1
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
"
" This lets us use ctrl-up/down to scroll
" just the buffer view while keeping the cursor
" located at where it was.
map <C-Up>   <C-y>
map <C-Down> <C-e>
imap <C-Up>   <C-o><C-y>
imap <C-Down> <C-o><C-e>

" Mouse Configuration
"
" I want to enable mouse usage, in all modes, but right
" click should be passed through to tmux. This is because
" tmux right click behavior is more useful.
set mouse=a

" Visual Changes
set ruler
set number
set colorcolumn=80,120


" Disable line wrapping
"
" By default vim will wrap a line when it gets too long
" to fit in the current window size. I hate line wrapping
" and would rather it just gets cut off. This does that.
set nowrap


" Disable showcmd
"
" When showcmd is set, commands are printed
" in the bottom right. When scrolling, this
" results in repeated prints of the scrolling
" command. Disable this because it's disctracting.
set noshowcmd

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

" Limit popup height
set pumheight=10

" Solarized Colors
set background=dark
colorscheme solarized

" Fix for issue with NERDTree line highlighting with
" NERDTree-syntax-highlighing installed. Solution from:
"
" https://github.com/neovim/neovim/issues/9019#issuecomment-439921147
highlight NERDTreeFile ctermfg=14


" Dimming inactive vim windows
"
" When a windows is not active, it should become the same
" background color as an inactive tmux pane. We do this via
" the highlight and winghighlight functionality.
highlight Normal ctermbg=none
highlight InactiveWindow ctermbg=black
set winhighlight=Normal:ActiveWindow,NormalNC:InactiveWindow


" Enable cursor line
"
" This option creates a slightly lighter background line
" for the line the cursor is on. It really helps with
" easily visually identifying the current cursor line.
set cursorline
