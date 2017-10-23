set shiftround
set showcmd			" Helps avoid command-mode typos.
set showmatch
set tildeop			" I always thought '~' should work this way...
set nomodeline
set ruler			" I like to know where I am.
set cpoptions=aABceF		" The default setting for this includes the
				" 's' option; I disable that so that
				" certain buffer settings (like the ones
				" below) don't have to be set and reset
				" every time we enter or leave a buffer.

" Set various options according to the type of file we're editing.
augroup settings
autocmd BufNewFile,BufReadPost *.c*,*.h*,*.cc,*.inl set cindent cinoptions=(0,g0
autocmd BufNewFile,BufReadPost *.*vimrc,*.vim,.exrc,_*vimrc,_exrc set comments=b:\"
autocmd BufNewFile,BufReadPost *.tex,*.sty set comments=:%
autocmd BufNewFile,BufReadPost *.pl,*.pm,*.PL set cindent cinoptions=(0
autocmd BufNewFile,BufReadPost *.gene set autoindent comments=n:#
autocmd BufNewFile,BufReadPost *.py set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
augroup END

set number
set mouse=a
set backspace=indent,eol,start
set hlsearch
set noswapfile
if has("cscope")
	set nocscopeverbose
	set csto=1
	set cscopetag
endif
let b:delimitMate_expand_cr=1
highlight MatchParen term=reverse ctermbg=6 ctermfg=0 guibg=DarkCyan

" Auto comment
autocmd FileType c,cpp,sh,conf set formatoptions+=r
" Resumes from the last position on the file
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Clears search hightlights (on Ctrl+L)
nnoremap <C-L> :nohl<CR><C-L>
" Recently openned files (on \o)
nnoremap <Leader>o :browse old<CR>
" Switch between currently openned files (on \b)
nnoremap <Leader>b :ls<CR>:let nr=input("Switch to: ")<Bar>exe "buf" . nr<CR>
" See the man page for the word under cursor (on \m)
nnoremap <Leader>m :!man <C-r><C-w><CR>
" Open NERDTree file browser (on \m)
nnoremap <Leader>n :NERDTree<CR><C-L>
" Rename all occurances of the word under cursor (on \s)
nnoremap <Leader>s :%s/\<<C-r><C-w>\>//gc<Left><Left><Left>
" When I edit a new file, there's no "#!" line at the top by which to set
" syntax highlighting and other file-specific options; this mapping lets me
" recheck those after adding the "#!" line.
nmap <F1> :doau syntax BufReadPost <Bar> doau settings BufReadPost
"Enable and disable mouse use
noremap <F2> :call ToggleMouse() <CR>
function! ToggleMouse()
  if &mouse == 'a'
    set mouse=
    set nonumber
    echo "Mouse usage disabled"
  else
    set mouse=a
    set number
    echo "Mouse usage enabled"
  endif
endfunction
set pastetoggle=<F12>

if version >= 500
  " I've gotten too used to the reformat command living on the 'Q' key.
  nmap Q gq
  omap Q gq
  if !has("gui_running")
    set background=dark
  endif
  " Activate optional features of the Perl syntax file.
  let perl_extended_vars = 1
  let perl_highlight_matches = 1
  let perl_embedded_pod = 1
  let perl_want_scope_in_variables = 1
  " These settings allow me to use color highlighting in rxvt without
  " having to manually reset TERM from "xterm" to "rxvt".
  set t_Co=16
  set t_Sb=[4%p1%dm
  set t_Sf=[3%p1%dm

  if has("syntax")
  " Enable syntax highlighting.
    syntax on
  endif
endif

" Plugins
call plug#begin('~/.vim/plugged')
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'
Plug 'Raimondi/delimitMate'
Plug 'scrooloose/nerdtree'
call plug#end()
