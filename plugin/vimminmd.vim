let s:temp_path =  "/tmp/vimminmd.txt"

function! s:write_tmp()
	call writefile(getline(1,'$'), s:temp_path, "s")
endfunction

function! s:start_preview()
	call s:write_tmp()
	call system("minmd " . s:temp_path . " &")

	autocmd BufWritePost * call s:write_tmp()
	autocmd VimLeave * call system("pkill minmd")
endfunction

command! StartminmdPreview call s:start_preview()
