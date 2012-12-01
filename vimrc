syntax on
set background=dark
set showcmd
set showmatch
set mouse=a

set number
set autoindent

set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

let $makejarg=""
fun! SetMkfile()
  let filemk = "Makefile"
  let buildpt = "build/"
  let pathmk = "./"
  let depth = 1
  while depth < 4
    if filereadable(pathmk . filemk)
      return pathmk
    endif
    if filereadable(pathmk . buildpt . filemk)
      return pathmk . buildpt
    endif
    let depth += 1
    let pathmk = "../" . pathmk
  endwhile
  return "."
endf
command! -nargs=* Make | let $mkpath=SetMkfile() | make <args> $makejarg -C $mkpath | cwindow 5 

map <Leader>mk <esc>:Make<cr>
map <C-F7> <esc>:NERDTreeToggle<cr>

map <Leader>sh <esc>:shell<cr>

let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType cpp set omnifunc=ccomplete#Complete

" highlight if 80 char per line is exceeded
autocmd FileType cpp highlight OverLength ctermbg=red ctermfg=white guibg=#592929
autocmd FileType cpp match OverLength /\%81v.\+/
