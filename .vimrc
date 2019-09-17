call plug#begin('~/.vim/plugged')
Plug 'liuchengxu/space-vim-theme'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'vim-syntastic/syntastic'
" Plug 'neoclide/coc.nvim', {'branch':'release'}
Plug 'vim-airline/vim-airline-themes'
Plug 'wakatime/vim-wakatime'
Plug 'mhinz/vim-signify'
Plug 'vim-airline/vim-airline'
Plug 'Shougo/neoinclude.vim'
Plug 'Chiel92/vim-autoformat'
Plug 'sheerun/vim-polyglot'
Plug 'joshdick/onedark.vim'
Plug 'rust-lang/rust.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'SirVer/UltiSnips'
Plug 'ycm-core/YouCompleteMe'
call plug#end()

set ruler laststatus=2 number title hlsearch autoindent showtabline=2 nocp
set encoding=UTF-8
syntax on
filetype indent plugin on
colorscheme space_vim_theme
hi Comment guifg=#5C6370 ctermfg=59
"   Range:   233 (darkest) ~ 238 (lightest)
"   Default: 235
let g:space_vim_dark_background = 233
color space-vim-dark
set background=dark
set listchars=tab:>·,trail:~,extends:>,precedes:<,
set list

set hidden
let g:racer_cmd = "/home/user/.cargo/bin/racer"
let g:racer_experimental_completer = 1

set number relativenumber

augroup numbertoggle
	autocmd!
	autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
	autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

let g:airline_theme ='deus'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
" set guifont=Source\ Code\ Pro\ for\ Powerline\ 11
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

nmap <F12> :NERDTreeToggle<CR>﻿
imap <F12> <Esc>:NERDTreeToggle<CR>
nmap <F8> :TagbarToggle<CR>
nmap <F4> @='^I//<C-V><Esc>j'<CR>
nmap <F2> :w<CR>
imap <F2> <Esc>:w<CR>
nmap <F3> :wq<CR>
imap <F3> <Esc>:wq<CR>
nmap J 5j
nmap H ^
nmap K 5k
nmap L $
nmap ; @='A;<C-V><Esc>^j'<CR>
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
nnoremap <Leader>s :%s/\<<C-r><C-w>\>//g<Left><Left>
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" au BufWrite * :Autoformat
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

autocmd FileType rust map <buffer> <F5> :w<CR> :!cargo build<CR>
autocmd FileType rust map <buffer> <F6> :w<CR> :!cargo run<CR>
autocmd FileType rust map <buffer> <F7> :w<CR> :!cargo test<CR>

autocmd FileType python map <buffer> <F5> :!python3 %<CR>

autocmd FileType c nmap <buffer> <F5> :!clang %<CR>
autocmd FileType c nmap <buffer> <F6> :make<CR>

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_quiet_messages = { "type": "style" }

let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
let g:ycm_semantic_triggers =  { 'cpp,objcpp' : ['->', '.', '::', 'gl', 'GL'] }
let g:ycm_semantic_triggers = {	'c' : ['->', '.', 'SDL', 'sdl', 'gl', 'GL'] }
let g:ycm_collect_identifiers_from_tag_files = 1
let g:ycm_key_list_select_completion = ['<tab>']
let g:ycm_key_list_previous_completion = ['<C-tab>']
let g:ycm_rust_src_path = '/home/fenrir/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src/'

let g:rustfmt_autosave = 1

set completeopt=longest,menu

let g:tagbar_type_go = {
			\ 'ctagstype' : 'go',
			\ 'kinds'     : [
			\ 'p:package',
			\ 'i:imports:1',
			\ 'c:constants',
			\ 'v:variables',
			\ 't:types',
			\ 'n:interfaces',
			\ 'w:fields',
			\ 'e:embedded',
			\ 'm:methods',
			\ 'r:constructor',
			\ 'f:functions'
			\ ],
			\ 'sro' : '.',
			\ 'kind2scope' : {
			\ 't' : 'ctype',
			\ 'n' : 'ntype'
			\ },
			\ 'scope2kind' : {
			\ 'ctype' : 't',
			\ 'ntype' : 'n'
			\ },
			\ 'ctagsbin'  : 'gotags',
			\ 'ctagsargs' : '-sort -silent'
			\ }

" let g:tagbar_type_rust = {
"    \ 'ctagstype' : 'rust',
""    \ 'kinds' : [
""        \'T:types,type definitions',
""        \'f:functions,function definitions',
""        \'g:enum,enumeration names',
""        \'s:structure names',
""        \'m:modules,module names',
""        \'c:consts,static constants',
""        \'t:traits',
""        \'i:impls,trait implementations',
""    \]
""    \}

au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
	exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
	exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('cpp', 'blue', 'none', 'blue', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('c', 'red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')

function! g:UltiSnips_Complete()
	call UltiSnips#ExpandSnippet()
	if g:ulti_expand_res == 0
		if pumvisible()
			return "\<C-n>"
		else
			call UltiSnips#JumpForwards()
			if g:ulti_jump_forwards_res == 0
				return "\<TAB>"
			endif
		endif
	endif
	return ""
endfunction

function! g:UltiSnips_Reverse()
	call UltiSnips#JumpBackwards()
	if g:ulti_jump_backwards_res == 0
		return "\<C-P>"
	endif

	return ""
endfunction


if !exists("g:UltiSnipsJumpForwardTrigger")
	let g:UltiSnipsJumpForwardTrigger = "<tab>"
endif

if !exists("g:UltiSnipsJumpBackwardTrigger")
	let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
endif

au InsertEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger     . " <C-R>=g:UltiSnips_Complete()<cr>"
au InsertEnter * exec "inoremap <silent> " .     g:UltiSnipsJumpBackwardTrigger . " <C-R>=g:UltiSnips_Reverse()<cr>"
