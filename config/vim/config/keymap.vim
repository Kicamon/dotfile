let leadermap=" "
map H 0
map L $
map J <c-d>
map K <c-u>
nnoremap W :w<CR>
nnoremap Q :q<CR>
nnoremap tt <cmd>20 Lex<CR>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap sh <cmd>set nosplitright<CR>:vsplit<CR>
nnoremap sj <cmd>set splitbelow<CR>:split<CR>
nnoremap sk <cmd>set nosplitbelow<CR>:split<CR>
nnoremap sl <cmd>set splitright<CR>:vsplit<CR>
inoremap ( ()<ESC>i
inoremap { {}<ESC>i
inoremap ' ''<ESC>i
inoremap " ""<ESC>i
inoremap <C-l> <Right>
nnoremap tu :tabe<CR>:edit<space>
nnoremap tn :+tabnext<CR>
nnoremap tp :-tabnext<CR>
vnoremap Y "+y
nnoremap ca :%+y<CR>
nnoremap <leader><CR> :noh<CR>
vnoremap N :normal 
tnoremap <C-n> <C-\><C-N>
tnoremap <C-o> <C-\><C-N><C-O>

function! HandleCurlyBraces()
	let l:pos = getpos('.')
	let l:line = getline('.')
	let l:col = l:pos[2]

	let l:char_before = l:col >= 1 ? l:line[l:col - 2] : ''
	let l:char_after = l:col <= len(l:line) ? l:line[l:col - 1] : ''

	if l:char_before == '{' && l:char_after == '}'
		return "\<ESC>f}xa\<CR>}\<ESC>O"
	else
		return "\<CR>"
	endif
endfunction

inoremap <expr> <CR> HandleCurlyBraces()
