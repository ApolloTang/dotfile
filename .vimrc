" ### Apollo Tang vimrc file
" todo:
" command to refresh file :e!
" command to rename file
"
" learning bookmark
" http://learnvimscriptthehardway.stevelosh.com/chapters/08.html
"

call pathogen#infect()

" Environment {
    " Identify platform {
        silent function! OSX()
            return has('macunix')
        endfunction
        silent function! LINUX()
            return has('unix') && !has('macunix') && !has('win32unix')
        endfunction
        silent function! WINDOWS()
            return  (has('win16') || has('win32') || has('win64'))
        endfunction
    " }

    " Basics {
        set nocompatible        " Must be first line
        if !WINDOWS()
            set shell=/bin/sh
        endif
        " set shell=bash
        "/ previously use use the above line, not sure what window
    " }

    " Windows Compatible {
        "/ On Windows, also use '.vim' instead of 'vimfiles'; this makes synchronization
        "/ across (heterogeneous) systems easier.
        if WINDOWS()
            set winaltkeys=yes
            "/ set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
        endif
    " }

    "/ For ssh session
    "set term=cons25
    "/ The above fix displaying A B C D on remote shell on pressing arrow key
    "/ http://vim.wikia.com/wiki/Fix_arrow_keys_that_display_A_B_C_D_on_remote_shel
" }


" Plateform pattern {
    if !WINDOWS()
        "echom 'Runtime envrionment: Not windows'
    endif
    if WINDOWS()
        "echom 'Runtime envrionment: Windows'
    endif
    if OSX()
        "echom 'Runtime envrionment: OSX'
    endif
    if LINUX()
        "echom 'Runtime envrionment: Linux'
    endif
" }


" Plateform pattern template {
    " if !WINDOWS()
    " endif
    " if WINDOWS()
    " endif
    " if OSX()
    " endif
    " if LINUX()
    " endif
" }


" Setting to sort { ------------------------------------------------------
    let mapleader=","
    let maplocalleader="\\"                 "\ leader that targat specific file type

    inoremap <leader><leader> <Esc>hhhh     "\ back to normal mode; the 4h (hhhh) fix cusor jump around
    imap <c-c> <esc>                        "\ undecided about if I sould keep this

    syntax enable                           " Turn on syntax highlighting.
    filetype plugin indent on               " Turn on file type detection.

    runtime macros/matchit.vim              " Load the matchit plugin.

    set showcmd                             " Display incomplete commands.
    set showmode                            " Display the mode you're in.

    set backspace=indent,eol,start          " Intuitive backspacing.
    "set whichwrap+=<,>,h,l                 " what is this?

    set hidden                              " Handle multiple buffers better.
    set history=1000                        " Rememember more commands and search history
    set wildmenu                            " Enhanced command line completion.
    set wildmode=list:longest               " Complete files like a shell.

    set ignorecase                          " Case-insensitive searching.
    set smartcase                           " But case-sensitive if expression contains a capital letter.

    set number                              " Show line numbers.
    set ruler                               " Show cursor position.

    set incsearch                           " Highlight matches as you type.
    set hlsearch                            " Highlight matches.

    set scrolloff=3                         " Show 3 lines of context around the cursor.

    set title                               " Set the terminal's title

    set autoread                            " auto read when a file is changed from outside
    set nobackup                            " Don't make a backup before overwriting a file.
    set nowritebackup                       " And again.
    set noswapfile                          " no swap files
    "set directory=$HOME/.vim/tmp//,.       " Keep swap files in one location

    set laststatus=2                        " Show the status line all the time

    set nocursorline                        " do not show cursor line
    set cmdheight=2
    set switchbuf=useopen
    set numberwidth=5
    set showtabline=2
    "set winwidth=150                       " do not set width, if set window will size it self
    set winheight=6
    set winminheight=5

    "\ Display trailing white= spaces
    set encoding=utf-8
    set list listchars=tab:·\ ,trail:·

    "\ Status information at bottom of screen
    set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P

    " No sound on errors
    set noerrorbells
    "set visualbell                    " No beeping.
    set novisualbell                   " No flashing
    set tm=500
    "/ disable bell in mac. http://stackoverflow.com/questions/16047146/disable-bell-in-macvim
    autocmd! GUIEnter * set vb t_vb=
" }

" Colors and fonts {
    let g:solarized_termcolors=256
    set t_Co=256
    set background=dark
    " colorscheme grb256
    " colorscheme koehler
    colorscheme apollotang
    " set transparency=15

    if has("gui_running")
        if has("gui_gtk2")
            "colorscheme slate
            colorscheme apollotang
            set guifont=Inconsolata\ 9
        elseif has("gui_macvim")
            "set guifont=Menlo\ Regular:h14
            "set guifont=Andale\ Mono:h14
            "set guifont=Courier\ New\ Regular:h11
            "set guifont=PT\ Mono:h11
            "set guifont=Osaka-Mono:h14
            "set guifont=Monaco:h12
            "set guifont=Source\ Code\ Pro\ Light:h12
            set guifont=Source\ Code\ Pro\ ExtraLight:h12
            " set guifont=Consolas:h12
        elseif has("gui_win32")
            set guifont=Consolas:h9:cANSI
        endif
    endif
" }

" Syntax highlight { ------------------------------------------------------
    map <F6> :echo synIDattr(synIDtrans(synID(line("."), col("."), 1)), "name")
    "/ The above tell you "what kind syntax ID that it is thing under the given position"
    "/ http://linuxyz.blogspot.ca/search/label/VIM
" }

" Indentation setting { --------------------------------------------------
    "set noexpandtab                  " do not use space as tabs
    set expandtab                    " use space as tabs
    set tabstop=4                    " Global tab width.
    set shiftwidth=4                 " And again, related.
    set softtabstop=4

    " ##  Indentation short cut
    vmap << <gv
    vmap >> >gv
" }

" JSHint setting {
    "/ https://github.com/Shutnik/jshint2.vim

    " Plateform pattern {
        "   if !WINDOWS()
        "       "echom 'Runtime envrionment: Not windows'
        "   endif
    "   if WINDOWS()
    "       echom 'Runtime envrionment: Windows'
    "       let jshint2_command = '~/path/to/node_mobules/.bin/jshint'
    "   endif
        "   if OSX()
        "       "echom 'Runtime envrionment: OSX'
        "   endif
        "   if LINUX()
        "       "echom 'Runtime envrionment: Linux'
        "   endif
    " }

    " jshint validation
    nnoremap <silent><F1> :JSHint<CR>
    inoremap <silent><F1> <C-O>:JSHint<CR>
    vnoremap <silent><F1> :JSHint<CR>

    " show next jshint error
    nnoremap <silent><F2> :lnext<CR>
    inoremap <silent><F2> <C-O>:lnext<CR>
    vnoremap <silent><F2> :lnext<CR>

    " show previous jshint error
    nnoremap <silent><F3> :lprevious<CR>
    inoremap <silent><F3> <C-O>:lprevious<CR>
    vnoremap <silent><F3> :lprevious<CR>
" }


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CUSTOM AUTOCMDS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

augroup vimrcEx
" Clear all autocmds in the group
autocmd!

"autocmd FileType text setlocal textwidth=78

" Jump to last cursor position unless it's invalid or in an event handler
autocmd BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\ exe "normal g`\"" |
\ endif

au BufNewFile,BufRead *.jade set filetype=jade
au BufRead,BufNewFile *.sass setfiletype sass

"for ruby, autoindent with two spaces, always expand tabs
"autocmd FileType ruby,haml,eruby,yaml,html,javascript,sass,cucumber set ai sw=2 sts=2 et
autocmd FileType sass,jade set ai sw=2 sts=2 et
"autocmd FileType python set sw=4 sts=4 et


"/ Syntax for coffee script:
"/ https://github.com/kchmck/vim-coffee-script
"/ http://stackoverflow.com/questions/5602767/why-is-vim-not-detecting-my-coffescript-filetype
autocmd BufNewFile,BufRead *.coffee set filetype=coffee
autocmd FileType coffee set ai sw=2 sts=2 et

"/ Syntax for JavaScript
"/ to use in conjunction with Syntax folding for Javascript, but is crap so
"/  comment out.
"autocmd BufNewFile,BufRead *.js set filetype=javascript


autocmd BufRead *.mkd set ai formatoptions=tcroqn2 comments=n:&gt;
autocmd BufRead *.markdown set ai formatoptions=tcroqn2 comments=n:&gt;

" Indent p tags
"autocmd FileType html,eruby if g:html_indent_tags !~ '\\|p\>' | let g:html_indent_tags .= '\|p\|li\|dt\|dd' | endif

" Don't syntax highlight markdown because it's often wrong
autocmd! FileType mkd setlocal syn=off

" recompile coffeescript files on write
" au BufWritePost *.coffee silent CoffeeMake! -b | cwindow | redraw!
augroup END

" code folding {----------------------------------------------------------
    set fdm=indent
    "highlight Folded guibg=black          " color for codefolding line
    "highlight Folded guibg=gray14       " color for codefolding line
    highlight Folded guifg=gray25 guibg=gray10

    "/ Syntax folding for Javascript
    "/ https://github.com/jelera/vim-javascript-syntax
    "/ this is crap, so commented out!
    "au FileType javascript call JavaScriptFold()
" }



" MISC KEY MAPS ----------------------------------------------------------

command! W :wa
"command! Q :q
"command! WQ :wq


" window { ---------------------------------------------------------------
    " ##  Window resizing
    nnoremap <leader>ww 75<c-w>>
    nnoremap <leader>nn 75<c-w><

    " ## Move around splits
    nnoremap <c-j> <c-w>j
    nnoremap <c-k> <c-w>k
    nnoremap <c-h> <c-w>h
    nnoremap <c-l> <c-w>l
" }


" ## Wrapping behaviour { ------------------------------------------------
    set nowrap nolinebreak list
    nmap <s-l> zl  "scroll left"
    nmap <s-h> zh  "scroll right"
    command! -nargs=* Wrapword set wrap linebreak nolist
    command! -nargs=* Wrap set wrap list
    command! -nargs=* Wrapoff set nowrap nolinebreak list

    " ## Break long line at 60 col
    nnoremap <leader>y 060lwbels<CR><ESC>

    "/ mapping to make movements operate on 1 screen line in wrap mode
    function! ScreenMovement(movement)
      let b:gmove = "yes"     "<---- added to fix error during Wrapword
      if &wrap && b:gmove == 'yes'
        return "g" . a:movement
      else
        return a:movement
      endif
    endfunction
    onoremap <silent> <expr> j ScreenMovement("j")
    onoremap <silent> <expr> k ScreenMovement("k")
    onoremap <silent> <expr> 0 ScreenMovement("0")
    onoremap <silent> <expr> ^ ScreenMovement("^")
    onoremap <silent> <expr> $ ScreenMovement("$")
    nnoremap <silent> <expr> j ScreenMovement("j")
    nnoremap <silent> <expr> k ScreenMovement("k")
    nnoremap <silent> <expr> 0 ScreenMovement("0")
    nnoremap <silent> <expr> ^ ScreenMovement("^")
    nnoremap <silent> <expr> $ ScreenMovement("$")
    vnoremap <silent> <expr> j ScreenMovement("j")
    vnoremap <silent> <expr> k ScreenMovement("k")
    vnoremap <silent> <expr> 0 ScreenMovement("0")
    vnoremap <silent> <expr> ^ ScreenMovement("^")
    vnoremap <silent> <expr> $ ScreenMovement("$")
    vnoremap <silent> <expr> j ScreenMovement("j")
    " toggle showbreak
    function! TYShowBreak()
      if &showbreak == ''
        set showbreak=>
      else
        set showbreak=
      endif
    endfunction
    let b:gmove = "yes"
    function! TYToggleBreakMove()
      if exists("b:gmove") && b:gmove == "yes"
        let b:gmove = "no"
      else
        let b:gmove = "yes"
      endif
    endfunction
    nmap  <expr> ,b  TYShowBreak()
    nmap  <expr> ,bb  TYToggleBreakMove()
    "/ ref: http://superuser.com/questions/498267/how-do-you-move-up-within-a-single-line-thats-word-wrapped-in-vim

" }


" Inserting stuff { --------------------------------------------------------
    " ## Insert a hash rocket with <c-l>l
    imap <c-l>l <space>=><space>
"}

" Clear the search buffer when hitting return
:nnoremap <CR> :nohlsearch<cr>
"nnoremap <leader><leader> <c-^>


" Map braces and brackets
imap [ []<left>
imap ( ()<left>
imap { {}<left>


" Open line (insert mode)
inoremap <leader>O <esc>O
inoremap <leader>o <esc>o
" Open line (normal mode)
nnoremap <leader>O O<esc>
nnoremap <leader>o o<esc>


" insert mode movements
inoremap <c-j> <down>
inoremap <c-k> <up>
inoremap <c-l> <right>
inoremap <c-h> <left>

"/ go to middle of current line
"/ http://superuser.com/questions/216411/go-to-middle-of-line-in-vim
map gm :call cursor(0, virtcol('$')/2)<CR>


" ##  Line Bubling (map to unimpaired plugin)
nmap <C-Up>   [e`[            " Bubling up one line
nmap <C-Down> ]e`[            " Bubling down one line
"nnoremap <C-Up> V:move '<-2<CR><Esc>0        " Bubble up one lines (after select with visual mode)
"nnoremap <C-Down> V:move '>+1<CR><Esc>0        " Bubble down one lines (after select with visual mode)


" cut and paste { --------------------------------------------------------
    " Plateform specific {
        if !WINDOWS()
        endif
        if WINDOWS()
            set clipboard=unnamed
        endif
        if OSX()
        endif
        if LINUX()
            set clipboard=unnamedplus
        endif
    " }

    " yank to clipboard
    map <c-b> "*y

    " paste clipboard under cursor
    nnoremap <c-f> "*P
    vnoremap <c-f> "*P

    " paste previous yank under cursor
    nnoremap <c-g> "0P
    vnoremap <c-g> "0P

    " paste clipboard *after* cursor
    nnoremap <leader>f "*p
    vnoremap <leader>f "*p

    " paste previous yank *after* cursor
    nnoremap <leader>g "0p
    vnoremap <leader>g "0p
"}


" Remove trailing spaces { -----------------------------------------------
    " Old version of remove trailing spaces {
        "/ ref http://www.bestofvim.com/tip/trailing-whitespace/
        " nnoremap <Leader>rtw :%s/\s\+$//e<CR>
        " function! TrimWhiteSpace()
        "     %s/\s\+$//e
        " endfunction
        " nnoremap <silent> <Leader>rts :call TrimWhiteSpace()<CR>
        " autocmd FileWritePre    * :call TrimWhiteSpace()
        " autocmd FileAppendPre   * :call TrimWhiteSpace()
        " autocmd FilterWritePre  * :call TrimWhiteSpace()
        " autocmd BufWritePre     * :call TrimWhiteSpace()
    " } End Old version of remove trailing spaces

    "/ ref: http://vimcasts.org/episodes/tidying-whitespace/
    function! <SID>StripTrailingWhitespaces()
        "/ Preparation: save last search, and cursor position.
        let _s=@/
        let l = line(".")
        let c = col(".")
        "/ Do the business:
        %s/\s\+$//e
        "/ Clean up: restore previous search history, and cursor position
        let @/=_s
        call cursor(l, c)
    endfunction
    nnoremap <silent> <leader>stw :call <SID>StripTrailingWhitespaces()<CR>
    autocmd BufWritePre *.py,*.xml,*,txt,*.html,*.sass,*.css,*.js :call <SID>StripTrailingWhitespaces()
" } End :: Remove trailing spaces



" Create current directory path
":nnoremap <leader>m :!mkdir -p %:h
"let g:ragtag_global_maps = 1


" { edit .vimrc file ------------------------------------------------------
    nnoremap <leader>ev :split $MYVIMRC<cr>
    nnoremap <leader>sv :source $MYVIMRC<cr>
" }

" Novice arrow disable { --------------------------------------------------
    map <Left>  :echo "             do not use arrow key!"<cr>
    map <Right> :echo "             do not use arrow key!"<cr>
    map <Up>    :echo "             do not use arrow key!"<cr>
    map <Down>  :echo "             do not use arrow key!"<cr>
" }

" Stuff to figure out { --------------------------------------------------
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " MULTIPURPOSE TAB KEY
    " Indent if we're at the beginning of a line. Else, do completion.
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
    return "\<tab>"
    else
    return "\<c-p>"
    endif
    endfunction
    inoremap <tab> <c-r>=InsertTabWrapper()<cr>
    inoremap <s-tab> <c-n>

    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " OPEN FILES IN DIRECTORY OF CURRENT FILE
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    cnoremap %% <C-R>=expand('%:h').'/'<cr>
    map <leader>e :edit %%
    map <leader>d :view %%

    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " RENAME CURRENT FILE
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'))
    if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
    endif
    endfunction
    nnoremap <leader>fr :call RenameFile()<cr>


    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " PROMOTE VARIABLE TO RSPEC LET
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    function! PromoteToLet()
    :normal! dd
    " :exec '?^\s*it\>'
    :normal! P
    :.s/\(\w\+\) = \(.*\)$/let(:\1) { \2 }/
    :normal ==
    endfunction
    :command! PromoteToLet :call PromoteToLet()
    :map <leader>pm :PromoteToLet<cr>



    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " MAPS TO JUMP TO SPECIFIC COMMAND-T TARGETS AND FILES
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    map <leader>gr :topleft :split config/routes.rb<cr>

    function! ShowRoutes()
    " Requires 'scratch' plugin
    :topleft 100 :split __Routes__
    " Make sure Vim doesn't write __Routes__ as a file
    :set buftype=nofile
    " Delete everything
    :normal 1GdG
    " Put routes output in buffer
    :0r! bundle exec rake -s routes
    " Size window to number of lines (1 plus rake output length)
    :exec ":normal " . line("$") . "_ "
    " Move cursor to bottom
    :normal 1GG
    " Delete empty trailing line
    :normal dd
    endfunction

    map <leader>gR :call ShowRoutes()<cr>
    map <leader>gv :CommandTFlush<cr>\|:CommandT app/views<cr>
    map <leader>gc :CommandTFlush<cr>\|:CommandT app/controllers<cr>
    map <leader>gm :CommandTFlush<cr>\|:CommandT app/models<cr>
    map <leader>gh :CommandTFlush<cr>\|:CommandT app/helpers<cr>
    map <leader>gl :CommandTFlush<cr>\|:CommandT lib<cr>
    map <leader>gp :CommandTFlush<cr>\|:CommandT public<cr>
    map <leader>gs :CommandTFlush<cr>\|:CommandT public/stylesheets/sass<cr>
    map <leader>gf :CommandTFlush<cr>\|:CommandT features<cr>
    map <leader>gg :topleft 100 :split Gemfile<cr>
    map <leader>gt :CommandTFlush<cr>\|:CommandTTag<cr>
    "map <leader>f :CommandTFlush<cr>\|:CommandT<cr>
    "map <leader>F :CommandTFlush<cr>\|:CommandT %%<cr>

    ",tags directory
    "set tags=./tags;
    " map <leader>rt :!ctags --extra=+f --exclude=.git --exclude=log --exclude=tags --exclude=doc -R * `rvm gemdir`/bundler/gems/*<CR><C-M>
    " map <leader>rt :!ctags --extra=+f --exclude=.git --exclude=log --exclude=tags --exclude=doc --exclude=public -R * `rvm gemdir`/bundler/gems/*<CR><C-M>
    " map <leader>rt :!ctags --extra=+f --exclude=.git --exclude=log --exclude=tags --exclude=doc --exclude=public -R * `bundle show --paths`<CR><C-M>
    " ctags usage:
    "   CTRL + ] to jump to method definition from a 'method call'
    "   CTRL + t to jump back from the method definition to the call
" }

" Abbreviations { --------------------------------------------------------
    iabbrev adn and
    iabbrev waht what
    iabbrev tehn then
    iabbrev -_- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    " ref: http://learnvimscriptthehardway.stevelosh.com/chapters/08.html
" }



" END .vimrc

