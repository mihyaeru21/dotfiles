augroup filetypedetect
    autocmd! BufNewFile,BufRead *.coffee  setfiletype coffee
    autocmd! BufNewFile,BufRead *.gp      setfiletype gnuplot
    autocmd! BufNewFile,BufRead *.json    setfiletype json5
    autocmd! BufNewFile,BufRead *.md      setfiletype markdown
    autocmd! BufNewFile,BufRead *.psgi    setfiletype perl
    autocmd! BufNewFile,BufRead *.t       setfiletype perl
    autocmd! BufNewFile,BufRead *.tt      setfiletype perl
    autocmd! BufNewFile,BufRead cpanfile  setfiletype perl
    autocmd! BufNewFile,BufRead *.podspec setfiletype ruby
    autocmd! BufNewFile,BufRead Podfile   setfiletype ruby
    autocmd! BufNewFile,BufRead *.swift   setfiletype swift
    autocmd! BufNewFile,BufRead *.tex     setfiletype tex
    autocmd! BufNewFile,BufRead *.tx      setfiletype xslate
augroup END

