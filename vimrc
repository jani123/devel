execute pathogen#infect()

set nocompatible

set showcmd

filetype on
filetype plugin on
syntax enable
set noexpandtab
set copyindent
set preserveindent
set softtabstop=0
set shiftwidth=4
set tabstop=4
set autoindent

"set autoindent
"set shiftwidth=4
"set softtabstop=4
"set tabstop=4

if version >= 700
	set spl=en spell
	set nospell
endif

set wildmenu
set wildmode=list:longest,full
set backspace=2
set number
set nuw=6

" allow write to file if you did not use sudo
cmap w!! %!sudo tee > /dev/null %
set incsearch
set hlsearch
set nohidden
highlight MatchParen ctermbg=4

if has("gui_running")
   " Remove Toolbar
   set guioptions=em
endif

colorscheme desert

set laststatus=2
set statusline=%F%m%r%h%w\ (%{&ff}){%Y}\ [%l,%v][%p%%]
map N Nzz
map n nzz
filetype plugin indent on
syntax on

" Toggle paste mode with F2
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

" Code folding with F9. Creating fold:  select some lines and press f9
inoremap <F9> <C-O>za
nnoremap <F9> za
onoremap <F9> <C-C>za
vnoremap <F9> zf

" Saving the view of files: eg folding info
" autocmd BufWinLeave *.* mkview
" autocmd BufWinEnter *.* silent loadview

" Insert <Tab> or complete identifier
" if the cursor is after a keyword character
function MyTabOrComplete()
 let col = col('.')-1
 if !col || getline('.')[col-1] !~ '\k'
 return "\<tab>"
 else
 return "\<C-N>"
 endif
endfunction
inoremap <Tab> <C-R>=MyTabOrComplete()<CR>

" Next tab
noremap <C-l> gt

" Previous tab
noremap <C-k> gT

" Backspace to normal mode
noremap <BS> <left><del>

"autocmd BufEnter * silent! lcd %:p:h

if &term =~ '^screen'
    " tmux will send xterm-style keys when its xterm-keys option is on
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
endif

if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" Goto middle of the line
map gm :call cursor(0, virtcol('$')/2)

" List white spaces with F3
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
nnoremap <F3> :set invlist list?<CR>
