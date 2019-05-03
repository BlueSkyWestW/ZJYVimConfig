""""""""""""""""""""""""""""""""
"Interface
""""""""""""""""""""""""""""""""
set nu      "show line number
syntax enable   "syntax highlight  
syntax on

""""""""""""""""""""""""""""""""
"Key command
""""""""""""""""""""""""""""""""    
set tabstop=4   "set Tab = 4
set softtabstop=4       "indent= 4
set shiftwidth=4 
set cc=120
" set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set statusline=%F%m%r%h%w%=\ [TYPE=%Y]\ %{\"[ENCD=\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\"+\":\"\").\"]\"}\ [FMT=%{&ff}]\ [ASC=%03.3b]\ [HEX=%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set laststatus=2
""""""""""""""""""""""""""""""""
"Compile
""""""""""""""""""""""""""""""""
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        exec "!g++ % -o %<"
    exec "! ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ % -o %<"
        exec "! ./%<"
    elseif &filetype == 'java' 
        exec "!javac %" 
        exec "!java %<"
	elseif &filetype == 'python'
		exec "!time python3 %"
    elseif &filetype == 'sh'
        :!./%
    endif
endfunc

"""""""""""""""""""""""""""""""""
"Debug
"""""""""""""""""""""""""""""""""   
map <F6> :call Rungdb()<CR>
func! Rungdb()
    exec "w"
    exec "!g++ % -g -o %<"
    exec "!gdb ./%<"
endfunc

""""""""""""""""""""""""""""""""""
"Others
""""""""""""""""""""""""""""""""""
filetype plugin indent on
set autowrite               
set ruler           
set cursorline              
set magic                   
set guioptions-=T           
set guioptions-=m           
set autoindent
set cindent
set mouse=a  "always use mouse 
set backspace=indent,eol,start

""""""""""""""""""""""""""""""""""
"config for jedi
""""""""""""""""""""""""""""""""""
let g:completor_python_binary = '/usr/bin/python3'

