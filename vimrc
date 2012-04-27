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
map <Leader>cw <esc>:cw<cr>
map <C-F6> <esc>:cn<cr>
map <C-F7> <esc>:cp<cr>

autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete
