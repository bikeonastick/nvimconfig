" for livedown
"let g:livedown_browser = "safari"

" the port on which Livedown server will run
" let g:livedown_port = 1337

" for closing html tags
:iabbrev <// </<C-X><C-O>

" for vertical splits for Gdiff
set diffopt+=vertical

" for pasting code. turns indent off press f2 again to return to indent
set pastetoggle=<F2> 

" leader is a comma
let mapleader = ","

" syntax highlighting is on
syntax on

" incremental search is cool
set incsearch

" we're not keeping tabs around 
set expandtab

" open the vimrc file
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>

" source the vimrc file - nice for writing scripts
nnoremap <leader>rc :source $MYVIMRC<cr>

" run the shell
nnoremap <leader>! :Shell

" Press F4 to toggle highlighting on/off, and show current value.
:noremap <F4> :set hlsearch! hlsearch?<CR>

" toggle hlsearch with <leader>h (same as F4 above 
nnoremap <leader>h :set hlsearch! hlsearch?<CR>

" toggle highlight of word under the cursor
nnoremap <leader>hw *# :set hlsearch! hlsearch?<CR>

" toggle line numbers
nnoremap <C-N><C-N> :set invnumber<CR>

" turn on indentation based on the filetype plugin
filetype plugin indent on

" set the clipboard to unnamed so it uses the system clipboard
set clipboard=unnamed

" tell vim NOT to run in Vi compatible mode
set nocompatible

" show line numbers
set number
set ruler

" keep buffers opened in background until :q or :q!
set hidden

" Number of : command entries to keep track of as history
set history=10000

" Set the word wrap character limit, this will force word wrap past the
" specified column.
set textwidth=80

" Default to tab size of two spaces and enable auto indent
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent

" Show matching bracket when a bracket is inserted
set showmatch

" Highlight searches matching the search pattern
set hlsearch

" Make searches case-sensetive only if they include upper-case characters
set ignorecase smartcase

" Highlight the line the cursor is currently on for easy spotting
set cursorline

" Highlight the column the cursor is currently on for easy spottintg
set cursorcolumn

" Make the command entry area consume two rows
set cmdheight=2

" Set preference for switching buffers, :help switchbuf for details
set switchbuf=useopen

" Min number of characters to use for line number column
set numberwidth=5

" Show tab lines always
set showtabline=2

" Soft min width for the active window
set winwidth=79

" Soft min height for the active window
set winheight=29

" The shell to use when using :!
set shell=bash

" Prevent Vim from clobbering the scrollback buffer. See
" http://www.shallowsky.com/linux/noaltscreen.html
set t_ti= t_te=

" Minimum number of lines of context to keep around cursor
set scrolloff=3

" Settings for file swaps and backups
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" show incomplete command
set showcmd

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Enable file type detection.
" " Use the default filetype settings, so that mail gets 'tw' set to 72,
" " 'cindent' is on in C files, etc.
" " Also load indent files, to automatically do language-dependent indenting.
filetype plugin indent on

" tab completion mode for files, etc.
set wildmode=longest,list

" make tab completion for files/buffers act like bash
set wildmenu

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CUSTOM AUTOCMDS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup vimrcEx
  " Clear all autocmds in the group
  autocmd!
  autocmd FileType text setlocal textwidth=78
  " Jump to last cursor position unless it's invalid or in an event handler
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  "for ruby, autoindent with two spaces, always expand tabs
  autocmd FileType ruby,haml,eruby,yaml,html,sass,cucumber set ai sw=2 sts=2 et
  autocmd FileType python set sw=4 sts=4 et
  autocmd FileType javascript set ai sw=4 sts=4 ts=4 et

  autocmd BufRead *.md  set ai sw=4 sts=4 ts=4 et formatoptions=tcroqn2 comments=n:&gt;

  " Before writing a file check if the path for it exists. If it doesn't then
  " mkdir -p the path so that the file can be saved.
  autocmd BufWritePre * if expand("<afile>")!~#'^\w\+:/' && !isdirectory(expand("%:h")) | execute "silent! !mkdir -p ".shellescape(expand('%:h'), 1) | redraw! | endif

augroup END

" standardize on dark background
set background=dark
" but... you can quickly toggle to solarized light, with this

" enable quick bg change light or dark
map <F10> :let &background = ( &background == "dark"? "light" : "dark" )<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" STATUS LINE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
:set statusline=%<%f\ (%{&ft})\ %-4(%m%)%=%-19(%3l,%02c%03V%)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MISC KEY MAPS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>y "*y
" Move around splits with <c-hjkl>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
" Can't be bothered to understand ESC vs <c-c> in insert mode
imap <c-c> <esc>
" Clear the search buffer when hitting return
:nnoremap <CR> :nohlsearch<cr>
nnoremap <leader><leader> <c-^>

" jump to buffer if already open, even if in another tab
let g:ctrlp_switch_buffer = 2
" set the local working directory to the nearest .git/ .hg/ .svn/ .bzr/
let g:ctrlp_working_path_mode = 2
" enable cross-session caching by not deleting cache files on exit
let g:ctrlp_clear_cache_on_exit = 0
" set the best match to be the top
let g:ctrlp_match_window_reversed = 0
" set max height of match window
let g:ctrlp_max_height = 20
" tell ctrlp to ignore some files
let g:ctrlp_custom_ignore = 'tags$\|\.DS_Store$\|\.git$\|_site$'

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
" RENAME CURRENT FILE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction
map <leader>n :call RenameFile()<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RUNNING TESTS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! RunTests(filename)
    " Write the file and run tests for the given filename
    :w
    if match(a:filename, '\.feature') != -1
        "exec ":!script/features " . a:filename
        call s:RunShellCommand('bundle exec cucumber --no-color ' .expand('%:p'))
    else
        "exec ":!bundle exec rspec --color " . a:filename
        call s:RunShellCommand('bundle exec rspec --no-color ' .expand('%:p'))
    end
endfunction

function! SetTestFile()
    " Set the spec file that tests will be run for.
    let t:grb_test_file=@%
endfunction

function! RunTestFile(...)
    if a:0
        let command_suffix = a:1
    else
        let command_suffix = ""
    endif

    " Run the tests for the previously-marked file.
    let in_test_file = match(expand("%"), '\(.feature\|_spec.rb\)$') != -1
    if in_test_file
        call SetTestFile()
    elseif !exists("t:grb_test_file")
        return
    end
    call RunTests(t:grb_test_file . command_suffix)
endfunction

function! RunNearestTest()
    let spec_line_number = line('.')
    call RunTestFile(":" . spec_line_number)
endfunction

map <leader>t :call RunTestFile()<cr>
map <leader>T :call RunNearestTest()<cr>
map <leader>a :call RunTests('')<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" adapted this function from here:
" http://vim.wikia.com/wiki/Display_output_of_shell_commands_in_new_window
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! s:RunShellCommand(cmdline)
  echo a:cmdline
  let expanded_cmdline = a:cmdline
  for part in split(a:cmdline, ' ')
     if part[0] =~ '\v[%#<]'
        let expanded_part = fnameescape(expand(part))
        let expanded_cmdline = substitute(expanded_cmdline, part, expanded_part, '')
     endif
  endfor
  botright new
  setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
  call setline(1, 'You entered:    ' . a:cmdline)
  call setline(2, 'Expanded Form:  ' .expanded_cmdline)
  call setline(3,substitute(getline(2),'.','=','g'))
  execute '$read !'. expanded_cmdline
  setlocal nomodifiable
  1
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" gets the text selected using visual mode
" found this function here:
" https://github.com/roma1n/vim-googurl/blob/master/googurl.vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! s:GetVisualSelection()
  try
    let a_save = @a
    normal! gv"ay
    return @a
  finally
    let @a = a_save
  endtry
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" tags commands
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <C-W>] <C-W>]:tab split<CR>gT:q<CR>gt 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" diff commands
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
command! -complete=file -nargs=? Mydiff call s:runDiffNoFile(<q-args>)
command! -complete=shellcmd -nargs=+ Git call s:RunShellCommand('git ' .<q-args>)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" search commands
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" - search project ruby files for the word under the cursor
command! Srchwr call s:RunShellCommand('find . -name \*.rb -exec grep -H --regexp="' .expand("<cword>").'" {} \;')
" - search project groovy files for the word under the cursor
command! Srchwg call s:RunShellCommand('find . -name \*.groovy -exec grep -H --regexp="' .expand("<cword>").'" {} \;')
" - search project by file extension and grep for word under cursor
command! -nargs=+ Srchw call s:RunShellCommand('find . -name \*.' .<q-args>. ' -exec grep -H --regexp="' .expand("<cword>").'" {} \;')
" - search all project files via Ack for word under cursor
command! Ackw call s:RunShellCommand('ack ' .expand("<cword>"))
" - search project by file extension and grep for selected text
command! -nargs=+ Srchv call s:RunShellCommand('find . -name \*.' .<q-args>. ' -exec grep -H --regexp="' .s:GetVisualSelection().'" {} \;')
" - search all project files via ack for selected text
command! Ackv call s:RunShellCommand('ack ' .s:GetVisualSelection())
command! -nargs=+ Ackx call s:RunShellCommand('ack ' .<q-args>)
" - recursive find by file type for specific word
command! -complete=shellcmd -nargs=+ SrchR call s:RunShellCommand('find . -name \*.rb -exec grep -H --regexp="' .<q-args>.'" {} \;')
command! -complete=shellcmd -nargs=+ SrchG call s:RunShellCommand('find . -name \*.groovy -exec grep -H --regexp="' .<q-args>.'" {} \;')
command! -complete=shellcmd -nargs=+ SrchJava call s:RunShellCommand('find . -name \*.java -exec grep -H --regexp="' .<q-args>.'" {} \;')
command! -complete=shellcmd -nargs=+ SrchJs call s:RunShellCommand('find . -name \*.js -exec grep -H --regexp="' .<q-args>.'" {} \;')
command! -complete=shellcmd -nargs=+ SrchGsp call s:RunShellCommand('find . -name \*.gsp -exec grep -H --regexp="' .<q-args>.'" {} \;')

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" execute 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" - current file in ruby
command! Rb call s:RunShellCommand('ruby ' .expand('%:p'))
" - Shell (used elsewhere)
command! -complete=shellcmd -nargs=+ Shell call s:RunShellCommand(<q-args>)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" commands for inserting text
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
:command! Iamp :normal! i <html <C-v>u26a1><ESC>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" setting up markdown composer
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"function! BuildComposer(info)
"  if a:info.status != 'unchanged' || a:info.force
"    if has('nvim')
"      !cargo build --release
"    else
"      !cargo build --release --no-default-features --features json-rpc
"    endif
"  endif
"endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" using vim-plug
" https://github.com/junegunn/vim-plug
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" setup for vim-plug
call plug#begin('~/.vim/plugged')

" plugins to load
" ack
Plug 'https://github.com/mileszs/ack.vim.git'
" gist-vim
Plug 'https://github.com/mattn/gist-vim.git'
" ruby-matchit
Plug 'https://github.com/vim-scripts/ruby-matchit.git'
" tcomment_vim
Plug 'https://github.com/tomtom/tcomment_vim.git'
" vim-clojure-static
Plug 'https://github.com/guns/vim-clojure-static.git'
" vim-colors-solarized
Plug 'https://github.com/altercation/vim-colors-solarized.git'
" vim-ctrlp
Plug 'https://github.com/ctrlpvim/ctrlp.vim.git'
" vim-dispatch
Plug 'https://github.com/tpope/vim-dispatch.git'
" vim-fugitive
Plug 'https://github.com/tpope/vim-fugitive.git'
" vim-rails
Plug 'https://github.com/tpope/vim-rails.git'
" vim-surround
Plug 'https://github.com/tpope/vim-surround.git'
" vim-markdown
"Plug 'https://github.com/tpope/vim-markdown.git'
" vim-elixir
Plug 'https://github.com/elixir-lang/vim-elixir.git'
" vim-go
Plug 'https://github.com/fatih/vim-go.git'
" vim-livedown
" Plug 'https://github.com/shime/vim-livedown.git'
" vim-matchit
Plug 'https://github.com/jwhitley/vim-matchit.git'
" webapi-vim
Plug 'https://github.com/vim-scripts/WebAPI.vim.git'
" python-syntax
Plug 'https://github.com/hdima/python-syntax.git'
" flutter
Plug 'https://github.com/thosakwe/vim-flutter.git'
" Dim paragraphs above and below the active paragraph.
Plug 'junegunn/limelight.vim'
" Distraction free writing by removing UI elements and centering everything.
Plug 'junegunn/goyo.vim'
"markdown support
Plug 'plasticboy/vim-markdown'
"browser preview for markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install' }

" enables neovim JS remote plugins
Plug 'neovim/node-host', { 'do': 'npm install -g neovim' }

" Add plugins to &runtimepath
call plug#end()

"...............................................................................
" plasticboy/vim-markdown
"...............................................................................
autocmd FileType markdown set conceallevel=0
autocmd FileType markdown normal zR

let g:vim_markdown_frontmatter=1

"...............................................................................
" iamcco/markdown-preview.nvim
"...............................................................................
let g:mkdp_refresh_slow=1
let g:mkdp_markdown_css='~/.config/nvim/md_preview_gh.css'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COLOR
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tell it to use the solarized color scheme
" http://ethanschoonover.com/solarized
" In order to have this work properly in iTerm2 you also need to setup the
" iTerm2 solarized color scheme.
" solarized is so awesome... just do it
colorscheme solarized
