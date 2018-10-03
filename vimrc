call plug#begin('~/.vim/plugged')
Plug 'SirVer/ultisnips' 
Plug 'honza/vim-snippets'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'NLKNguyen/papercolor-theme'
Plug 'NLKNguyen/copy-cut-paste.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'davidhalter/jedi-vim'
Plug 'Townk/vim-autoclose'
Plug 'tomasr/molokai'
Plug 'joshdick/onedark.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'vim-scripts/AutoComplPop'
Plug 'altercation/vim-colors-solarized'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'fisadev/vim-ctrlp-cmdpalette'
Plug 'fisadev/fisa-vim-colorscheme'
Plug 'tpope/vim-surround'
Plug 'Shougo/neocomplcache.vim'
Plug 'fisadev/vim-isort'
Plug 'fisadev/dragvisuals.vim'
Plug 't9md/vim-choosewin'
Plug 'vim-scripts/Wombat'
Plug 'ervandew/supertab' 
Plug 'noahfrederick/vim-noctu'
Plug 'morhetz/gruvbox-contrib'
Plug 'morhetz/gruvbox'
call plug#end()

set shell=/bin/bash
"color
set t_Co =256
set guifont=Monaco:h12
set guifont=Monaco\ 12

if has('gui_runnig')
    colorscheme molokai
    set guifont=Monaco:h12
endif

syntax enable
set number
inore jj <Esc>
colorscheme gruvbox
set background=dark
let g:gruvbox_contrast_dark='hard'
let solarized_termcolors=256
let g:gruvbox_termcolors=256
set nowrap                      " don't wrap lines
set tabstop=4                   " a tab is four spaces
set smarttab
set tags=tags
set softtabstop=4               " when hitting <BS>, pretend like a tab is removed, even if spaces
set expandtab                   " expand tabs by default (overloadable per file type later)
set shiftwidth=4                " number of spaces to use for autoindenting
set shiftround                  " use multiple of shiftwidth when indenting with '<' and '>'
set autoindent                  " always set autoindenting on
set copyindent                  " copy the previous indentation on autoindenting
set ignorecase                  " ignore case when searching
set smartcase                   " ignore case if search pattern is all lowercase,
set noerrorbells                " don't beep
set splitbelow                  " create split below when doing horizontal split
set splitright                  " create split on right when doing a vertical split
set incsearch
set encoding=utf-8
set showmatch
set nocompatible
"
let mapleader = " "
let g:mapleader = " "

map <C-s> <esc>:wall<cr>
imap <C-s> <esc>:wall<cr>
nmap <leader>w :w<cr>
nmap <leader>q :q<cr>
nmap <Leader>Q :q!<cr>
map <C-t> <esc>:tabnew<cr>
nmap <Leader>% :so %<cr>
nnoremap vs :vsplit<cr>
nnoremap sp :split<cr>
" Open a new buffer
nmap <leader>n :new<cr>

" Tab handling
set nohidden "remove file from buffer when closing tab
map <leader>l :tabnext<cr>
map <leader>h :tabprevious<cr>

" Easier window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

let g:copy_cut_paste_no_mappings = 1
nmap <C-c> <Plug>CCP_CopyLine
vmap <C-c> <Plug>CCP_CopyText
nmap <C-v> <Plug>CCP_PasteText


" NerdTree Stuff
nmap <C-b> :NERDTreeToggle<cr>
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''
let g:NERDTreeMouseMode=2
let NERDTreeWinPos='left'
let NERDTreeMinimalUI=1
let NERDTreeBookmarksFile="~/.vim/NERDTreeBookmarks"
" Close vim if NERDTree is the only open buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"Youcompletme and snippets
"let g:ycm_key_list_select_completion = ['<C-n>']
"let g:ycm_key_list_previous_completion = ['<C-p>']
"let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"


"Ycm settings
set completeopt-=preview
" when scrolling, keep cursor 3 lines away from screen border
"set scrolloff=3

" autocompletion of files and commands behaves like shell
" (complete only the common part, list the options that match)
"set wildmode=list:longest


"Python
imap <F5> <Esc>:w<CR>:!clear;python %<CR>
map <F5> <Esc>:w<CR>:!clear;python %<CR>
" CtrlP ------------------------------

" file finder mapping
let g:ctrlp_map = ',q'
" tags (symbols) in current file finder mapping
nmap ,g :CtrlPBufTag<CR>
" tags (symbols) in all files finder mapping
nmap ,G :CtrlPBufTagAll<CR>
" general code finder in all files mapping
nmap ,f :CtrlPLine<CR>
" recent files finder mapping
nmap ,m :CtrlPMRUFiles<CR>
" commands finder mapping
nmap ,c :CtrlPCmdPalette<CR>
" to be able to call CtrlP with default search text
function! CtrlPWithSearchText(search_text, ctrlp_command_end)
    execute ':CtrlP' . a:ctrlp_command_end
    call feedkeys(a:search_text)
endfunction
" same as previous mappings, but calling with current word as default text
nmap ,wg :call CtrlPWithSearchText(expand('<cword>'), 'BufTag')<CR>
nmap ,wG :call CtrlPWithSearchText(expand('<cword>'), 'BufTagAll')<CR>
nmap ,wf :call CtrlPWithSearchText(expand('<cword>'), 'Line')<CR>
nmap ,we :call CtrlPWithSearchText(expand('<cword>'), '')<CR>
nmap ,pe :call CtrlPWithSearchText(expand('<cfile>'), '')<CR>
nmap ,wm :call CtrlPWithSearchText(expand('<cword>'), 'MRUFiles')<CR>
nmap ,wc :call CtrlPWithSearchText(expand('<cword>'), 'CmdPalette')<CR>
" don't change working directory
let g:ctrlp_working_path_mode = 'ra'
" ignore these files and folders on file finder
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.git|\.hg|\.svn|node_modules)$',
  \ 'file': '\.pyc$\|\.pyo$',
  \ }

let g:jedi#goto_command = ',d'
" Find ocurrences
let g:jedi#usages_command = ',o'
" Find assignments
let g:jedi#goto_assignments_command = ',a'
" Go to definition in new tab
nmap ,D :tab split<CR>:call jedi#goto()<CR>

" NeoComplCache ------------------------------

" most of them not documented because I'm not sure how they work
" (docs aren't good, had to do a lot of trial and error to make 
" it play nice)
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_ignore_case = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_auto_select = 1
let g:neocomplcache_enable_fuzzy_completion = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_fuzzy_completion_start_length = 1
let g:neocomplcache_auto_completion_start_length = 1
let g:neocomplcache_manual_completion_start_length = 1
let g:neocomplcache_min_keyword_length = 1
let g:neocomplcache_min_syntax_length = 1
" complete with workds from any opened file
let g:neocomplcache_same_filetype_lists = {}
let g:neocomplcache_same_filetype_lists._ = '_'
" mapping
nmap  -  <Plug>(choosewin)

"provide hjkl movements in Insert Mode via the <Alt> modifier key
"cnoremap <A-h> <Left>
"cnoremap <A-j> <Down>
"cnoremap <A-k> <Up>
"cnoremap <A-l> <Right>
"inoremap <A-h> <Left>
"inoremap <A-j> <Down>
"inoremap <A-k> <Up>
"inowremap <A-l> <Right>
noremap! <A-h> <left><cr>   "move cursor left
noremap! <A-j> <down>   "move cursor down
noremap! <A-k> <up>     "move cursor up   
noremap! <A-l> <right>  "move cursor right
noremap! <A-w> <esc>wi  "move one word forward
noremap! <A-e> <esc>ei  "move forward to the end of word
noremap! <A-b> <esc>bi  "move one word backward

"cursor settings
autocmd InsertEnter * set cul
autocmd InsertLeave * set cul

let &t_SI.="\e[5 q"
let &t_SR.="\e[4 q"
let &t_EI.="\e[1 q"

