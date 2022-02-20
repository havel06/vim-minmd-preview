"Copyright (c) 2022 Michal Havlíček

"This program is free software: you can redistribute it and/or modify it under
"the terms of the GNU General Public License as published by the Free Software
"Foundation, either version 3 of the License, or (at your option) any later
"version.

"This program is distributed in the hope that it will be useful, but WITHOUT ANY
"WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
"PARTICULAR PURPOSE. See the GNU General Public License for more details.

"You should have received a copy of the GNU General Public License along with
"this program. If not, see <https://www.gnu.org/licenses/>.

let s:temp_path =  "/tmp/vimminmd.txt"

function! s:write_tmp()
	call writefile(getline(1,'$'), s:temp_path, "s")
endfunction

function! s:start_preview()
	call s:write_tmp()
	call system("minmd " . s:temp_path . " &")

	autocmd BufWritePost,CursorHold,CursorHoldI  * call s:write_tmp()
	autocmd VimLeave * call system("pkill minmd")
endfunction

command! StartminmdPreview call s:start_preview()
