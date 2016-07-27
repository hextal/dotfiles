call plug#begin('~/config/nvim/plugged')

Plug 'tpope/vim-surround'
Plug 'tomtom/tcomment_vim'
Plug 'tmhedberg/matchit'
Plug 'freeo/vim-kalisi'
" plugin on GitHub repo
Plug 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
Plug 'L9'
" Git plugin not hosted on GitHub
Plug 'git://git.wincent.com/command-t.git'
"tern javascript
Plug 'ternjs/tern_for_vim'
"nerd tree 
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'christoomey/vim-tmux-navigator'
"testing this one out 
" Plug 'benmills/vimux' " tmux integration for vim

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'szw/vim-maximizer'
" Plug 'ctrlpvim/ctrlp.vim'
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" Plug 'junegunn/fzf.vim'
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim' " fuzzy file finder and so much more
" language-specific plugins
Plug 'mattn/emmet-vim', { 'for': 'html' } " emmet support for vim - easily create markdup wth CSS-like syntax
Plug 'gregsexton/MatchTag', { 'for': 'html' } " match tags in html, similar to paren support
Plug 'othree/html5.vim', { 'for': 'html' } " html5 support
Plug 'pangloss/vim-javascript', { 'for': 'javascript' } " JavaScript support
Plug 'gavocanov/vim-js-indent', { 'for': 'javascript' } " JavaScript indent support
Plug 'moll/vim-node', { 'for': 'javascript' } " node support
Plug 'othree/yajs.vim', { 'for': 'javascript' } " JavaScript syntax plugin
Plug 'mxw/vim-jsx', { 'for': 'jsx' } " JSX support
Plug 'elzr/vim-json', { 'for': 'json' } " JSON support
Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' } " sass scss syntax support
Plug 'ap/vim-css-color', { 'for': ['css','stylus','scss'] } " set the background of hex color values to the color
Plug 'hail2u/vim-css3-syntax', { 'for': 'css' } " CSS3 syntax support

Plug 'othree/es.next.syntax.vim', { 'for': 'javascript' } " ES6 and beyond syntax

Plug 'benekastah/neomake' " neovim replacement for syntastic using neovim's job control functonality
"youcompleteme
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
function! BuildYCM(info)
  " info is a dictionary with 3 fields
  " - name:   name of the plugin
  " - status: 'installed', 'updated', or 'unchanged'
  " - force:  set on PlugInstall! or PlugUpdate!
  if a:info.status == 'installed' || a:info.force
    !./install.py
  endif
endfunction

Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }

"pair completion 
Plug 'raimondi/delimitmate'
let delimitMate_expand_cr = 1
" Pass the path to set the runtimepath properly.
Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
"air line 
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"tab completion
Plug 'ervandew/supertab'




"colorscheme
Plug 'crusoexia/vim-monokai'
Plug 'dracula/vim'

"transparency
Plug  'miyakogi/seiya.vim'
" Default value: ['ctermbg']
let g:seiya_target_groups = has('nvim') ? ['guibg'] : ['ctermbg']
let g:seiya_auto_enable=1

call plug#end()
"""""""""""""""""""""""""""""""""color schemes"""""""""""""""""""""""""""""""""""""""""""
colorscheme monokai 
" colorscheme dracula



filetype plugin indent on    " required
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
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""''
"nerd tree cursor 
"autocmd VimEnter * NERDTree | wincmd p
"""""""""""""""""""""""""""""""""""""""""""""""""""""""'
"close nerd tree 
function! NERDTreeQuit()
  redir => buffersoutput
  silent buffers
  redir END
"                     1BufNo  2Mods.     3File           4LineNo
  let pattern = '^\s*\(\d\+\)\(.....\) "\(.*\)"\s\+line \(\d\+\)$'
  let windowfound = 0

  for bline in split(buffersoutput, "\n")
    let m = matchlist(bline, pattern)

    if (len(m) > 0)
      if (m[2] =~ '..a..')
        let windowfound = 1
      endif
    endif
  endfor

  if (!windowfound)
    quitall
  endif
endfunction
autocmd WinEnter * call NERDTreeQuit()
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 "move splits with hjkl keys 
"     tnoremap <c-h> <C-\><C-n><C-w>h
"     tnoremap <c-j> <C-\><C-n><C-w>j
"     tnoremap <c-k> <C-\><C-n><C-w>k
"     tnoremap <c-l> <C-\><C-n><C-w>l
"     nnoremap <c-h> <C-w>h
"     nnoremap <c-j> <C-w>j
"     nnoremap <c-k> <C-w>k
"     nnoremap <c-l> <C-w>l
"""""""""""""""""""""""""""""""""""""""""""
" Ali: to indent json files on save
autocmd FileType json autocmd BufWritePre <buffer> %!python -m json.tool
"high light search results
set hlsearch
""""""""""""""""""""""""""""""""""""""""
"paste toggle
"set pastetoggle=<F2>
""""""""""""""""""""""""""""""""""""""""
"nerd tree toggle
map <F1> :NERDTreeToggle<CR>
" set a map leader for more key combos
 let mapleader ="\<Space>" 
 let g:mapleader = "\<Space>"
set history=1000 " change history to 1000
set textwidth=120
" code folding settings
set foldmethod=syntax " fold based on indent
set foldnestmax=10 " deepest fold is 10 levels
set nofoldenable " don't fold by default
set foldlevel=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => User Interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Searching
set ignorecase " case insensitive searching
set smartcase " case-sensitive if expresson contains a capital letter
set hlsearch
set incsearch " set incremental search, like modern browsers
set nolazyredraw " don't redraw while executing macros

" switch syntax highlighting on
syntax on
syntax enable
"set encoding=utf8
let base16colorspace=256  " Access colors present in 256 colorspace"
set t_Co=256
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
    set t_AB=^[[48;5;%dm
    set t_AF=^[[38;5;%dm
endif

set background=dark
set termguicolors
set autoindent " automatically set indent of new line
set smartindent

set laststatus=2 " show the satus line all the time
" show hidden files in NERDTree
"let NERDTreeShowHidden=1
"tern stuff 
let g:tern_map_keys=1
let g:tern_show_argument_hints='on_hold'
" enable line numbers
let NERDTreeShowLineNumbers=1
" make sure relative line numbers are used
autocmd FileType nerdtree setlocal relativenumber
"set completeopt-=preview
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
"auto complete html shit
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
"copy into clipboard 
set clipboard=unnamed

" faster redrawing
set ttyfast

set diffopt+=vertical

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

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
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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

let g:ctrlp_max_files=0
let g:ctrlp_working_path_mode = 0

"save and restore sessions 
map <F7> :mksession! ~/vim_session <cr> " Quick write session with <F7>
map <F8> :source ~/vim_session <cr>     " And load session with <F8>

set splitbelow
set splitright

"remove trailing whitespaces
autocmd BufWritePre *.py :%s/\s\+$//e

"inset semicolon to end of the line 
inoremap <leader>; <C-o>A;
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
"save with ctrl -s
" If the current buffer has never been saved, it will have no name,
" call the file browser to save it, otherwise just save it.
" command -nargs=0 -bar Update if &modified 
"                            \|    if empty(bufname('%'))
"                            \|        browse confirm write
"                            \|    else
"                            \|        confirm write
"                            \|    endif
"                            \|endif
" nnoremap <silent> <C-S> :<C-u>Update<CR>
" console.log word under cursor
nmap <Leader>cl yiwoconsole.log('<c-r>"', <c-r>");<Esc>^
nmap <Leader>se yiwoconsole.log("////////////////////////////////");<Esc>^

"select newly pasted text
nnoremap gv `[v`]
"fzf to ctrl p 
noremap <c-p> <Esc>:FZF<CR>
"fix some file types
    autocmd BufNewFile,BufRead *.ejs set filetype=html
    autocmd BufNewFile,BufRead *.ino set filetype=c
    autocmd BufNewFile,BufRead *.svg set filetype=xml
    autocmd BufNewFile,BufRead .babelrc set filetype=json
    autocmd BufNewFile,BufRead .jshintrc set filetype=json
    autocmd BufNewFile,BufRead .eslintrc set filetype=json
    autocmd BufNewFile,BufRead *.es6 set filetype=javascript

    let g:neomake_javascript_jshint_maker = {
    \ 'args': ['--verbose'],
    \ 'errorformat': '%A%f: line %l\, col %v\, %m \(%t%*\d\)',
\ }
    autocmd FileType javascript let g:neomake_javascript_enabled_makers = findfile('.jshintrc', '.;') != '' ? ['jshint'] : ['eslint']
