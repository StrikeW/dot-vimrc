source ~/.vim/bundles.vim

" encoding dectection
set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1

" enable filetype dectection and ft specific plugin/indent
filetype plugin indent on

" enable syntax hightlight and completion
syntax on

" map <Leader> to ','
let mapleader=","

" share clipboard
set clipboard=unnamed

" deal with eggcache paste multiple times
" p' to paste, 'gv' to re-select what was originally selected. 'y' to copy it again
xnoremap p pgvy

" make vsplit put the new buffer on the right
set splitright

" make split put the new buffer below the current buffer
set splitbelow

"--------
" Vim UI
"--------
" color scheme
set background=dark
colorscheme Tomorrow-Night-Bright

" cursorline will slow down scrolling, just disables it
set nocursorline nocursorcolumn

" disable cursor blinking in normal mode
let &guicursor = substitute(&guicursor, 'n-v-c:', '&blinkon0-', '')

" search
set incsearch

"set highlight 	" conflict with highlight current line
set ignorecase
set smartcase

" editor settings
set history=1000
set nocompatible
set nofoldenable                                                  " disable folding"
set confirm                                                       " prompt when existing from an unsaved file
set backspace=indent,eol,start                                    " More powerful backspacing
set t_Co=256                                                      " Explicitly tell vim that the terminal has 256 colors "
set mouse=a                                                       " use mouse in all modes
set report=0                                                      " always report number of lines changed                "
set nowrap                                                        " dont wrap lines
set scrolloff=5                                                   " 5 lines above/below cursor when scrolling
set number                                                        " show line numbers
set showmatch                                                     " show matching bracket (briefly jump)
set showcmd                                                       " show typed command in status bar
set title                                                         " show file in titlebar
set laststatus=2                                                  " use 2 lines for the status bar
set matchtime=2                                                   " show matching bracket for 0.2 seconds
set matchpairs+=<:>                                               " specially for html
" set relativenumber

" Default Indentation
set autoindent
set smartindent     " indent when
set tabstop=4       " tab width
set softtabstop=4   " backspace
set shiftwidth=4    " indent width
" set smarttab
set expandtab       " expand tab to space
set textwidth=120

" file type stuffs
autocmd FileType c setlocal tabstop=4 shiftwidth=4 softtabstop=4
autocmd FileType cpp setlocal tabstop=4 shiftwidth=4 softtabstop=4
autocmd FileType ruby setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120
" 'syntax on' to fix highlight not working on php file
autocmd FileType php syntax on setlocal tabstop=4 shiftwidth=4 softtabstop=4 textwidth=120
autocmd FileType coffee,javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120
autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4 textwidth=120
"autocmd FileType html,htmldjango,xhtml,haml setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=0
autocmd FileType sass,scss,css setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120

" let .cu to be seen as .cpp
autocmd FileType cuda set ft=cpp

" syntax support
autocmd Syntax javascript set syntax=jquery   " JQuery syntax support
" js
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"

" remove all trailing whitespace of current file
fun! TrimWhitespace()
    let l:save_cursor = getpos('.')
    %s/\s\+$//e
    call setpos('.', l:save_cursor)
endfun


"-----------------
" Plugin settings
"-----------------
" === Rainbow parentheses for Lisp and variants ===
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 16
autocmd Syntax lisp,scheme,clojure,racket RainbowParenthesesToggle

" === tabbar ===
" let g:Tb_MaxSize = 2
" let g:Tb_TabWrap = 1

" hi Tb_Normal guifg=white ctermfg=white
" hi Tb_Changed guifg=green ctermfg=green
" hi Tb_VisibleNormal ctermbg=252 ctermfg=235
" hi Tb_VisibleChanged guifg=green ctermbg=252 ctermfg=white

" === easy-motion ===
let g:EasyMotion_leader_key = '<Leader>'

" === Tagbar ===
let g:tagbar_left=1
let g:tagbar_width=30
let g:tagbar_autofocus = 1
let g:tagbar_sort = 0
let g:tagbar_compact = 1
" " tag for coffee
" if executable('coffeetags')
  " let g:tagbar_type_coffee = {
        " \ 'ctagsbin' : 'coffeetags',
        " \ 'ctagsargs' : '',
        " \ 'kinds' : [
        " \ 'f:functions',
        " \ 'o:object',
        " \ ],
        " \ 'sro' : ".",
        " \ 'kind2scope' : {
        " \ 'f' : 'object',
        " \ 'o' : 'object',
        " \ }
        " \ }

  " let g:tagbar_type_markdown = {
    " \ 'ctagstype' : 'markdown',
    " \ 'sort' : 0,
    " \ 'kinds' : [
        " \ 'h:sections'
    " \ ]
    " \ }
" endif

" === Nerd Tree ===
let g:nerdtree_tabs_open_on_gui_startup=0
let g:nerdtree_tabs_open_on_console_startup=0
let NERDChristmasTree=0
let NERDTreeWinSize=30
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
" let NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$',  '\~$']
let NERDTreeShowBookmarks=1
let NERDTreeWinPos = "right"

" === nerdcommenter ===
let NERDSpaceDelims=1
nnoremap <D-/> :NERDComToggleComment<cr>
let NERDCompactSexyComs=1

" powerline
let g:Powerline_symbols = 'fancy'

" NeoComplCache
let g:neocomplcache_enable_at_startup=1
let g:neoComplcache_disableautocomplete=1
"let g:neocomplcache_enable_underbar_completion = 1
"let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_smart_case=1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
set completeopt-=preview

"imap <C-k> <Plug>(neocomplcache_snippets_force_expand)
"smap <C-k> <Plug>(neocomplcache_snippets_force_expand)
"imap <C-l> <Plug>(neocomplcache_snippets_force_jump)
"smap <C-l> <Plug>(neocomplcache_snippets_force_jump)

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType c setlocal omnifunc=ccomplete#Complete
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.erlang = '[a-zA-Z]\|:'

" === cscope_maps ===
nmap <silent> <F2> :!cscope -Rbq<cr>:cscope reset<cr>

" === bbye ===
nmap <silent> <leader>q :Bdelete<cr>


" === ctrlp ===
set wildignore+=*/tmp/*,*.so,*.o,*.a,*.obj,*.swp,*.zip,*.pyc,*.pyo,*.class,.DS_Store  " MacOSX/Linux
let g:ctrlp_by_filename = 1
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'
let g:ctrlp_map = '<C-p>'
let g:ctrlp_cmd = 'CtrlPCurWD' " default to current working dir file mode
nnoremap <F1> :CtrlPBufTagAll<cr>

" === vim-operator-hightlight ===
let g:ophigh_color = '#00e5e5'

" === syntastic ===
let g:syntastic_check_on_open = 1
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'

" === ultisnips ===
let g:UltiSnipsExpandTrigger = "<c-e>"
let g:UltiSnipsListSnippets = "<c-tab>"  " list all available snippets
let g:UltiSnipsJumpForwardTrigger = "<C-l>"
let g:UltiSnipsJumpBackwardTrigger = "<C-k>"
let g:UltiSnipsUsePythonVersion = 2

" === YCM ===
au BufNewFile,BufRead *.c set filetype=cpp  " set filetype of .c file to cpp for YCM
let g:ycm_collect_identifiers_from_tags_files = 1
" let g:ycm_auto_trigger = 0  " use completer mannually
let g:ycm_min_num_of_chars_for_completion = 2
let g:ycm_confirm_extra_conf = 0
let g:ycm_filetype_specific_completion_to_disable = "{'javascript' : 1}"
let g:ycm_key_invoke_completion = '<C-Space>'
let g:ycm_show_diagnostics_ui = 0   " disable annoying syntastic diagnostics
let g:ycm_enable_diagnostic_highlighting = 0
nnoremap <leader>d :YcmCompleter GoToDefinition<CR>
nnoremap <leader>s :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>t :YcmCompleter GetType<CR>

" === delimitMate ===
au FileType c,cpp let b:delimitMate_matchpairs = "(:),[:],{:}"

" === vim-go ===
" let g:go_version_warning = 0
let g:go_snippet_engine = 'ultisnips'


" Keybindings for plugin toggle
"nnoremap <F2> :set invpaste paste?<CR>
"set pastetoggle=<F2>
"nnoremap <F2> :YcmForceCompileAndDiagnostics
nnoremap <F4> :TagbarToggle<cr>
nnoremap <F5> :NERDTreeTabsToggle<cr>
" nnoremap <F8> :GundoToggle<cr>
nnoremap <F10> :!./push.sh<cr>
"nmap <F4> :IndentGuidesToggle<cr>
nmap  <D-/> :
nnoremap <leader>a :Ack
nnoremap <leader>v V`]

"------------------
" Useful Functions
"------------------
" easier navigation between split windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" When editing a file, always jump to the last cursor position
autocmd BufReadPost *
      \ if ! exists("g:leave_my_cursor_position_alone") |
      \     if line("'\"") > 0 && line ("'\"") <= line("$") |
      \         exe "normal g'\"" |
      \     endif |
      \ endif

" w!! to sudo & write a file
cmap w!! %!sudo tee >/dev/null %

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" sublime key bindings
nmap <D-]> >>
nmap <D-[> <<
vmap <D-[> <gv
vmap <D-]> >gv

" eggcache vim
nnoremap ; :
" :command W w
" :command WQ wq
" :command Wq wq
" :command Q q
" :command Qa qa
" :command QA qa

" tabpage switch
noremap 1 1gt
noremap 2 2gt
noremap 3 3gt
noremap 4 4gt
noremap 5 4gt
noremap 6 6gt
noremap 7 7gt
noremap 8 8gt

" for macvim
if has("gui_running")
    set go=Ace  " remove toolbar; 'a': copy on selection
    "set transparency=10
    set guifont=Menlo:h14
    set showtabline=2
    set columns=140
    set lines=40
    set linespace=2
    noremap <D-M-Left> :tabprevious<cr>
    noremap <D-M-Right> :tabnext<cr>
    " cycle through buffers
    noremap <Tab> :bnext<cr>
    noremap <S-Tab> :bprevious<cr>
    map <D-1> 1gt
    map <D-2> 2gt
    map <D-3> 3gt
    map <D-4> 4gt
    map <D-5> 5gt
    map <D-6> 6gt
    map <D-7> 7gt
    map <D-8> 8gt
    map <D-9> 9gt
    map <D-0> :tablast<CR>
endif
" if &diff
   " colors peaksea
" endif



