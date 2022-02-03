" my filetype file
if exists("did_load_filetypes")
  finish
endif
augroup filetypedetect
  au! BufRead,BufNewFile *.alt setfiletype altarica
  " au! BufRead,BufNewFile *.xyz		setfiletype drawing
augroup END
