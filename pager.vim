"
"
"
"
" Choose Plugins
call plug#begin('~/.local/share/nvim/plugged')
Plug 'micha/vim-colors-solarized'
Plug 'heewa/vim-tmux-navigator', {'branch': 'add-no-wrap-option'}
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'sheerun/vim-polyglot'
Plug 'airblade/vim-gitgutter'
call plug#end()


" Close on q
"
" We're trying to mimic the behavior of less for the
" pager. Thus vim should exit when 'q' is pressed.
nnoremap <silent> <buffer> <nowait> q :lclose<CR>:q<CR>


" Allow scrolling with ctrl-up/down
"
" This lets us use ctrl-up/down to scroll
" just the buffer view while keeping the cursor
" located at where it was.
map <C-Up>   <C-y>
map <C-Down> <C-e>
imap <C-Up>   <C-o><C-y>
imap <C-Down> <C-o><C-e>


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


" Remove command bar
"
" When using as a pager, I don't want to see
" the status bar on the bottom. These settings
" hide all the stuff down there. We can still
" see commands as they are typed in the command
" bar (such as searching)
set noshowmode
set noruler
set laststatus=0


" Disable showcmd
"
" When showcmd is set, commands are printed
" in the bottom right. When scrolling, this
" results in repeated prints of the scrolling
" command. Disable this because it's disctracting.
set noshowcmd


" Disable line wrapping
"
" By default vim will wrap a line when it gets too long
" to fit in the current window size. I hate line wrapping
" and would rather it just gets cut off. This does that.
set nowrap


" Set clipboard to system clipboard
set clipboard+=unnamedplus


" Set cursor scrolling offset
set scrolloff=10


" Solarized Colors
set background=dark
colorscheme solarized


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



