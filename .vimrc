call plug#begin('~/vim-plugins/plugged')

Plug 'tpope/vim-surround'
Plug 'tomtom/tcomment_vim'
Plug 'tmhedberg/matchit'
Plug 'freeo/vim-kalisi'
Plug 'scrooloose/nerdtree'
"plugin on GitHub repo
Plug 'tpope/vim-fugitive'
Plug 'christoomey/vim-tmux-navigator'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'}
Plug 'junegunn/fzf.vim'
"youcompleteme
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
"pair completion
Plug 'raimondi/delimitmate'
let delimitMate_expand_cr = 1
"air line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"tab completion
Plug 'ervandew/supertab'
"colorscheme
Plug 'crusoexia/vim-monokai'
Plug 'dracula/vim'
Plug 'mhartington/oceanic-next'
call plug#end()
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"relative line numbering
set relativenumber
set number
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"tabs and spaces
set smarttab
set tabstop=2
set shiftwidth=2
set expandtab
set title " set terminal title

" Searching
set ignorecase " case insensitive searching
set smartcase " case-sensitive if expresson contains a capital letter
set hlsearch
set incsearch " set incremental search, like modern browsers
set nolazyredraw " don't redraw while executing macros

set magic " Set magic on, for regex

set showmatch " show matching braces
set mat=2 " how many tenths of a second to blink

" error bells
set noerrorbells
set visualbell
set t_vb=
set tm=500

set t_Co=256 " Explicitly tell vim that the terminal supports 256 colors"
set wrap "turn on line wrapping
set wrapmargin=8 " wrap lines when coming within n characters from side
set linebreak " set soft wrapping
set showbreak=… " show ellipsis at breaking
set autoindent " automatically set indent of new line
set smartindent
""""""""""""""""""""""""""""""""""""""""
set history=1000 " change history to 1000
set textwidth=120
" code folding settings
set foldmethod=syntax " fold based on indent
set foldnestmax=10 " deepest fold is 10 levels
set nofoldenable " don't fold by default
set foldlevel=1
""""""""""""""""""""""""""""""""''''"powerline/airline""""""""""""""""""""""""""""""""""""""""""""""""""""""
set noshowmode
set guifont=Liberation\ Mono\ for\ Powerline\ 10
let g:airline_powerline_fonts = 1
let g:airline_theme='powerlineish'
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
let g:bufferline_echo = 0
let g:airline#extensions#whitespace#enabled = 0
set mouse=c

" trying to get youcompleteme and snipmate to stop fighting
" YouCompleteMe and UltiSnips compatibility, with the helper of supertab
let g:ycm_key_list_select_completion   = ['<C-j>', '<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<C-p>', '<Up>']

let g:SuperTabDefaultCompletionType    = '<C-n>'
let g:SuperTabCrMapping                = 0

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
" highlight Pmenu guibg=brown gui=bold
" highlight Pmenu ctermbg=238 gui=bold
" hi Normal ctermbg=none
"disable search highlighting
nnoremap <CR> :noh<CR><CR>
"reload vim without closing
nnoremap rv :source $MYVIMRC<CR>

"save and restore sessions
map <F7> :mksession! ~/vim_session <cr> " Quick write session with <F7>
map <F8> :source ~/vim_session <cr>     " And load session with <F8>

"remove trailing whitespaces
autocmd BufWritePre * :%s/\s\+$//e

" disable Ex mode
noremap Q <NOP>
" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
set nobackup
set nowritebackup
set noswapfile
" make yank copy to the global system clipboard
set clipboard=unnamed

"move in insert mode
inoremap <a-h> <left>
inoremap <a-j> <down>
inoremap <a-k> <up>
inoremap <a-l> <right>

"stop delays
set timeoutlen=1000 ttimeoutlen=0
nnoremap ; :
nnoremap : ;
nnoremap ' `
nnoremap ` '
""""""""""""""""""""""""""""""fix file types"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"fix some file types
autocmd BufNewFile,BufRead *.ejs set filetype=html
autocmd BufNewFile,BufRead *.ino set filetype=c
autocmd BufNewFile,BufRead *.svg set filetype=xml
autocmd BufNewFile,BufRead .babelrc set filetype=json
autocmd BufNewFile,BufRead .jshintrc set filetype=json
autocmd BufNewFile,BufRead .eslintrc set filetype=json
autocmd BufNewFile,BufRead *.es6 set filetype=javascript
" don't hide quotes in json files
let g:vim_json_syntax_conceal = 0
"turon on es6 syntax highlighting
let g:jsx_ext_required = 0
"""""""""""""""""""""""""""""""""" toggle invisible characters"""""""""""""""""""""""""""""""""""""""'
set list
set listchars=tab:→\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
highlight SpecialKey ctermbg=none ctermfg=8 " make the highlighting of tabs less annoying
highlight NonText ctermbg=none ctermfg=8
set showbreak=↪
""""""""""""""""""""""""""""""""""""" LEADER KEY BINDINGS""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader ="\<Space>"
let g:mapleader = "\<Space>"
" markdown to html
nmap <leader>md :%!markdown --html4tags <cr>
"inset semicolon to end of the line
inoremap <leader>; <c-o>A;
inoremap <leader>, <c-o>A,
inoremap <leader>. <c-o>A.
inoremap <leader>] <c-o>A]
inoremap <leader>} <c-o>A}
inoremap <leader>) <c-o>A)
inoremap <leader><space> <c-o>A

nnoremap <leader>h :tabprevious<CR>
nnoremap <leader>l :tabnext<CR>
nnoremap <leader>t :tabnew<CR>
nnoremap <leader>w :tabclose<CR>
nnoremap <leader>1 1gt
nnoremap <leader>2 2gt
nnoremap <leader>3 3gt
nnoremap <leader>4 4gt
nnoremap <leader>5 5gt
nnoremap <leader>6 6gt
nnoremap <leader>7 7gt
nnoremap <leader>8 8gt
nnoremap <leader>9 9gt
map <leader>o o<ESC>
map <leader>O O<ESC>
" console.log word under cursor
nmap <leader>cl yiwoconsole.log('<c-r>"', <c-r>");<esc>^
nmap <leader>se yiwoconsole.log("////////////////////////////////");<esc>^
" noremap <leader>t :tab all<esc>
noremap <leader>d :r!date<esc>
noremap <leader>n :E<esc>
noremap <leader>s :w !sudo tee %<esc>
noremap <leader>q :s/\"\(.*\)\"/\'\1\'<esc>

" search for word under the cursor
nnoremap <leader>/ "fyiw :/<c-r>f<cr>
vmap <leader>" S"lvi"
vmap <leader>' S'lvi'
vmap <leader>` S`lvi`
vmap <leader>( S)lvi(
vmap <leader>{ S}lvi{
vmap <leader>[ S]lvi[
vmap <leader>< S>lvi<
"""""""""""""""""""""""""""""""""""""""OTHER KEY BINDINGS""""""""""""""""""""""""""""""""""""""""""""""""
" toggle cursor line
let g:fzf_layout = { 'down': '~25%' }
"select newly pasted text
nnoremap gV `[v`]
"fzf to ctrl p
noremap <c-p> <Esc>:FZF<CR>
"open all files in their own tab
" :au BufAdd,BufNewFile,BufRead * nested tab sball
" :au BufNewFile,BufRead * nested tab sball
"au BufNewFile,BufRead * nested
  "\ if &buftype != "help" |
  "\   tab sball |
  "\ endif
" :hi TabLineFill term=bold cterm=bold ctermbg=0
set cursorline
let g:netrw_liststyle=3

:let g:AirlineTheme='durant'
