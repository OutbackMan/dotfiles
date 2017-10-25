syntax on

set number
set softtabstop=4
set tabstop=4
set nobackup
set noundofile

let in_hex_mode = 0

noremap <C-H> :call Hexmode()<CR>
inoremap <C-H> <Esc>:call Hexmode()<CR>

function! Hexmode()
	if g:in_hex_mode == 0
		silent %!xxd
		let g:in_hex_mode = 1
	else
		silent %!xxd -r
		let g:in_hex_mode = 0
	endif	
endfunction

" If writing in hex mode, save in 'normal' mode than revert back
autocmd BufWritePre * if g:in_hex_mode == 1 | silent %!xxd -r
autocmd BufWritePre * endif
autocmd BufWritePost * if g:in_hex_mode == 1 | silent %!xxd
autocmd BufWritePost * endif
