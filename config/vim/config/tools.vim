" Code Running
nmap <F5> :call Run()<CR>
function! Run()
	echo " compiling..."
	if &filetype == 'c'
		:! gcc "%" -o "%<" && "./%<" && rm -f "./%<"
	elseif &filetype == 'cpp'
		:! g++ "%" -o "%<" -Wall -std=c++20 && "./%<" && rm -f "./%<"
	elseif &filetype == 'python'
		:! python "%"
	end
	redraw!
	echohl WarningMsg | echo " Running finish! :-)"
endfunction
