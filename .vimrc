syntax on
set nocompatible
set encoding=utf-8
set synmaxcol=2048                " Don't syntax highlight super-long lines (for performance)
 
set cursorline
set autoindent                    " automatically indent lines and try to do it intelligently
set smartindent
set backspace=indent,eol,start    " backspace behaves 'normally'
 
" set softtabstop=2
set smartindent
set shiftwidth=4                  " [2]
set tabstop=4                     " tab is 4 spaces [2]
set noexpandtab                   " use tabs
 
set textwidth=0
set nolinebreak
set nowrap
 
set hlsearch                      " highlight search terms
set incsearch                     " search incrementally
set ignorecase                    " ignore case in searches...
set smartcase                     " ...but not really. Case sensitive if capitals are included.
set wrapscan                      " Set the search scan to wrap around the file
 
set number                        " show line numbers
set numberwidth=5
set ruler                         " display coordinates in status bar
set showcmd                       " display unfinished commands
set showmatch                     " show matching bracket (briefly jump)
set title                         " show file in titlebar
set scrolloff=3                   " When the page starts to scroll, keep the cursor 3 lines from top/bottom
set cmdheight=2                   " Make command line two lines high
 
" add json syntax highlighting
au BufNewFile,BufRead *.json set ft=javascript
 
au BufRead,BufNewFile *.txt call s:setupWrapping()
 
" Maps Alt-[n,p] for moving next and previous window respectively
map <silent> <A-n> <C-w><C-w>
map <silent> <A-p> <C-w><S-w>
 
nnoremap ;; : " ?

