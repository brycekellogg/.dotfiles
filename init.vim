" Install Vim-Plug
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


" Choose Plugins
call plug#begin('~/.local/share/nvim/plugged')
" Visual Plugins
Plug 'micha/vim-colors-solarized'
Plug 'bronson/vim-trailing-whitespace'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Window/Buffer Management Plugins
Plug 'qpkorr/vim-bufkill'
Plug 'heewa/vim-tmux-navigator', {'branch': 'add-no-wrap-option'}

" File Browser Plugins
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

Plug 'scrooloose/nerdcommenter'
Plug 'ludovicchabant/vim-gutentags'
"Plug 'majutsushi/tagbar'

" Git Plugins
Plug 'airblade/vim-gitgutter'

" Search Plugins
Plug 'jremmen/vim-ripgrep'
Plug 'kien/ctrlp.vim'

" Syntax Highlighting Plugins
Plug 'vim-python/python-syntax'
Plug 'sheerun/vim-polyglot'


"Plug 'valloric/youcompleteme', {'for': ['c', 'c++', 'python'], 'do': './install.py --clang-completer' }
"Plug 'tpope/vim-surround'
"Plug 'tpope/vim-repeat'
call plug#end()









"" Gutentags Config
""
"" Disable gutentags for git commits and git rebase.
"" This solves a problem where gutentags was erroring
"" out when closing a git commit. Solution taken from:
""
"" https://github.com/ludovicchabant/vim-gutentags/issues/168
au FileType gitcommit,gitrebase let g:gutentags_enabled=0


"" YouCompleteMe Config
""
"" Automatically close preview window (little window at bottom/top)
"" when we leave insert mode. YouCompleteMe uses the preview window
"" to show the documentation of the currently selected completion
"" when using symantic completion.
"let g:ycm_autoclose_preview_window_after_insertion = 1





"" Limit popup height
"set pumheight=10




"""""""""""""
" Searching "
"""""""""""""

" Remap question mark to search for a word
" using RipGrep (Rg) in all files under cwd
nnoremap ? :Rg <cword><cr>

" Abbreviation for RipGrep so I don't need to
" use the shift to type the search command.
:abbreviate rg Rg

" Highligh search term when we use RipGrep.
" This highlights both in quickfix and buffers.
let g:rg_highlight = 1

" Have RipGrep plugin derive git root so that
" searching happens from the top level in git repo.
let g:rg_derive_root = 1


" Enable CtrlP Plugin for Tags
"
" To do this, we enable the tag extension and then
" map a key combination to the CtrlPTag
"let g:ctrlp_extensions = ['tag']
"nnoremap <silent> <expr> <Leader>t  :CtrlPTag<cr>

" Ignore certain files when searching with CtrlP
"
" TODO: ???
let g:ctrlp_custom_ignore = 'build\|git'

" TODO: this isn't working???
let g:gutentags_ctags_exclude = ['**/*.json']

" Use git to list files
"
" Gutentags supports a custom command for listing files.
" We generally only want to use files that are checked
" in to a git repo. This might be awskward with new files
" that are not yet checked in.
let g:gutentags_file_list_command = 'git ls-files'



"""""""""""""""""""""""""""""
" Coding Language Specifics "
"""""""""""""""""""""""""""""

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

" Tab settings
"
" A tab should be shown as 4 spaces, and
" any time a tab in inserted, replace
" with 4 spaces instead.
set expandtab
set tabstop=4
set shiftwidth=4

" Override python tabstop
"
" Python recommends a bad number of spaces for
" tabs. We reset it to a good value here.
let g:python_recommended_style=0

" Python Syntax Highlighting
"
" Have the python syntax highlighter
" highlight  more stuff.
let g:python_highlight_all = 1



"""""""""""""""""""""""""""
" File Browser (NerdTree) "
"""""""""""""""""""""""""""

" Automatically delete the buffers of
" files that are deleted in NERDTree.
let NERDTreeAutoDeleteBuffer = 1

" NERDTree highlighting
"
"
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1

" Sort Order
let g:NERDTreeSortOrder = ['\/$',  '\.vim$', '\.h$', '\.c$', '\.cpp$', '*']


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

"" Have NERDTree ignore some files
let NERDTreeIgnore=['__pycache__', '\.map', '\.class$', '\.o$', '\~$', '\.git$', '\.zhistory$', '\.zcompdump', '\.zcompcache$', 'tags', '\.aux', '\.blg', '\.fdb_latexmk', '\.fls', '\.log', '\.out', '\.toc', '\.obj']
let NERDTreeMinimalUI = 1
let g:NERDTreeStatusline = " "

"" Close NERDTree after selecting a file
let NERDTreeQuitOnOpen=1

" Fix for issue with NERDTree line highlighting with
" NERDTree-syntax-highlighing installed. Solution from:
"
" https://github.com/neovim/neovim/issues/9019#issuecomment-439921147
highlight NERDTreeFile ctermfg=14



"""""""""""""""""""""""""""""""""""""
" Buffer & Split & Window Interface "
"""""""""""""""""""""""""""""""""""""

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

" Enable Hidden Buffers
"
" Allow us to have unsaved hidden buffers which act
" similar to how tabs in other editors are used.
set hidden

" Changing Buffers/Tabs
"
" In normal mode we switch between buffers using <C-PageUp/Down>.
" This should be disabled in some windows, such as NerdTree, TagBar,
" search results, etc. TODO: expand ignore list to include others.
function! SwitchBuffer(dir)
    let ignoreFileTypes = ["nerdtree", "help", "qf"]
    let ignoreBufTypes = []
    if index(ignoreFileTypes, &filetype) < 0 && index(ignoreBufTypes, &buftype) < 0
        execute {"left": "bp", "right": "bn"}[a:dir]

        " If we switch to an ignored buffer, move past it
        if index(ignoreFileTypes, &filetype) >= 0 || index(ignoreBufTypes, &buftype) >= 0
            execute {"left": "bp", "right": "bn"}[a:dir]
        endif
    endif
endfunction

nnoremap <silent> <expr> <C-PageUp>     ":call SwitchBuffer('left')<cr>"
nnoremap <silent> <expr> <C-PageDown>   ":call SwitchBuffer('right')<cr>"

" Killing Buffers
"
" Use <Leader>c for killing buffers. For some specific buffers
" (nerdtree, help, etc) we want to close the containing window
" instead of killing the buffer and keeping the window. This
" function looks at a list of custom close commands and executes
" those instead of the default vim-bufkill command if found.
function! KillBuffer()
    let customClose = {
            \ "nerdtree": "close",
            \ "help": "close",
            \ "qf": "close"
        \ }

    if has_key(customClose, &filetype)
        execute customClose[&filetype]
        return
    endif

    if has_key(customClose, &buftype)
        return
    endif

    execute "BD"
endfunction
nnoremap <silent> <expr> <Leader>c  ":call KillBuffer()<cr>"

" Killing Windows
"
" Use <Leader>x for killing windows. When killing windows, never close
" last window and (or only content window if nerdtree or help is open)
function! KillWindow()
    let ignoreFileTypes = ["nerdtree", "help"]

    let count = 0
    for windowNumber in range(1, winnr('$'))
        let bufferNumber = winbufnr(windowNumber)
        let fileType = getbufvar(bufferNumber, '&filetype')
        if index(ignoreFileTypes, fileType) < 0
            let count = count + 1
        endif
    endfor

    if count == 1 && index(ignoreFileTypes, &filetype) < 0
        echom "Use :q to exit"
        return
    endif

    execute "close"
endfunction
nnoremap <silent> <expr> <Leader>x  ":call KillWindow()<cr>"

" Resize splits automatically
autocmd VimResized * wincmd =

" Split below and right
set splitbelow
set splitright



""""""""""""""
" Git Config "
""""""""""""""

" GitGutter Key Mappings
"
" We map g-page up/down to hopping between
" git hunks.
nmap g<PageUp>   <Plug>(GitGutterPrevHunk)
nmap g<PageDown> <Plug>(GitGutterNextHunk)



"""""""""""""""""""""""
" Visual Improvements "
"""""""""""""""""""""""

" Solarized Colors
"
" We need to set the background to dark before setting
" the colorscheme so that we get Solarized-Dark theme
set background=dark
colorscheme solarized

" Enable cursor line
"
" This option creates a slightly lighter background line
" for the line the cursor is on. It really helps with
" easily visually identifying the current cursor line.
set cursorline

" Dimming inactive vim windows
"
" When a windows is not active, it should become the same
" background color as an inactive tmux pane. We do this via
" the highlight and winghighlight functionality.
highlight Normal ctermbg=none
highlight InactiveWindow ctermbg=black
set winhighlight=Normal:ActiveWindow,NormalNC:InactiveWindow

" Disable showcmd
"
" When showcmd is set, commands are printed
" in the bottom right. When scrolling, this
" results in repeated prints of the scrolling
" command. Disable this because it's disctracting.
set noshowcmd

" Show line numbers
"
" This will show line numbers in
" the far left column in each pane.
set number

" Show line length column
"
" This will have a lighter colored column
" at the specified number of characters
" running vertically down the pane. I
" want two for the two commonly used line
" length limits.
set colorcolumn=80,120

" Disable line wrapping
"
" By default vim will wrap a line when it gets too long
" to fit in the current window size. I hate line wrapping
" and would rather it just gets cut off. This does that.
set nowrap

" Airline Theme
"
" We want the airline theme to match our solarized
" dark color scheme, as well as to use fancy fonts.
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
let g:airline#extensions#default#section_truncate_width = {'b': 95, 'x': 95, 'z': 95}

" Aitline Solarized Text Color
"
" It's pretty glaring to use the default airline text color
" so we use this setting to set it to a dark text color.
let g:airline_solarized_dark_text = 1

" Airline Tab Bar
"
" The airline plugin has native support for displaying open
" buffers in the Vim tabline. This flag enables that.
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_splits = 1
set noshowmode

" Cursor scrolling offset
"
" Vim uses this setting to decide when to scroll
" a window as the cursor approaches the top or
" bottom of the screen. This is the number of
" lines away from the edge at which vim will scroll.
set scrolloff=10

" Lazy Drawing Speed Improvements
"
" This setting will let vim batch redraw operations
" ans is supposed to improve performace, especially
" when scrolling.
set lazyredraw



""""""""""""""""""""""""""""""""""""""""
" Additional Mouse & Keyboard Settings "
""""""""""""""""""""""""""""""""""""""""

" Mouse Configuration
"
" I want to enable mouse usage, in all modes, but right
" click should be passed through to tmux. This is because
" tmux right click behavior is more useful.
" TODO: pass through right click
set mouse=a

" Allow scrolling with ctrl-up/down
"
" This lets us use ctrl-up/down to scroll
" just the buffer view while keeping the cursor
" located at where it was.
map <C-Up>   <C-y>
map <C-Down> <C-e>
imap <C-Up>   <C-o><C-y>
imap <C-Down> <C-o><C-e>

" Unmap annoying q issues
nnoremap q: <nop>
nnoremap Q <nop>

" Set clipboard to system clipboard
set clipboard+=unnamedplus

