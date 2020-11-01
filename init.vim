set hidden
set mouse=a

if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
  set termguicolors
endif

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" homebrew fzf to the vim path:
set rtp+=/usr/local/opt/fzf

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
Plug 'junegunn/vim-github-dashboard'

" NERDTree
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'

" Colorschemes
Plug 'chriskempson/base16-vim'
Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'
Plug 'dracula/vim'
Plug 'rakr/vim-one'
Plug 'tomasr/molokai'
Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'nanotech/jellybeans.vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'NLKNguyen/papercolor-theme'
Plug 'w0ng/vim-hybrid'
Plug 'kaicataldo/material.vim'
Plug 'mhartington/oceanic-next'
Plug 'arcticicestudio/nord-vim'
Plug 'ayu-theme/ayu-vim'
Plug 'KeitaNakamura/neodark.vim'
Plug 'tyrannicaltoucan/vim-quantum'
Plug 'cocopon/iceberg.vim'
Plug 'haishanh/night-owl.vim'
Plug 'tomasiser/vim-code-dark'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
Plug 'sainnhe/sonokai'
Plug 'sainnhe/gruvbox-material'
Plug 'sainnhe/forest-night'

" uncategorized
Plug 'junegunn/fzf.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdcommenter'
Plug 'jlanzarotta/bufexplorer'

" languages supporting
Plug 'sheerun/vim-polyglot'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'leafgarland/typescript-vim'
Plug 'kkoomen/vim-doge'
Plug 'neoclide/jsonc.vim'

" git things
Plug 'airblade/vim-gitgutter'

" common plugins
Plug 'mattn/emmet-vim'
Plug 'othree/xml.vim'
Plug 'tpope/vim-fugitive'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'Yggdroot/indentLine'
Plug 'ap/vim-css-color'

" lightline
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'

" initialize plugin system
call plug#end()

" main configuration
syntax on
set cursorline
set number
let g:gruvbox_material_background = 'hard'
colorscheme gruvbox-material


" lightline configuration
set showtabline=2
let g:lightline = { 'colorscheme': 'gruvbox_material', 	
    \ 'active': {
	\   'left': [ [ 'mode', 'paste' ],
	\             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
	\ },
	\ 'component_function': {
	\   'cocstatus': 'coc#status'
	\ },
    \ 'tabline': {
    \   'left': [ ['buffers'] ]
    \ },
    \ 'component_expand': {
    \   'buffers': 'lightline#bufferline#buffers'
    \ },
    \ 'component_type': {
    \   'buffers': 'tabsel'
    \ }
  \ }

let g:lightline#bufferline#enable_devicons  = 1
let g:lightline#bufferline#enable_nerdfont = 1

autocmd BufWritePost,TextChanged,TextChangedI * call lightline#update()


" keybindings
let mapleader = ","
nnoremap <silent> <C-g> :BufExplorer<CR>
nnoremap <leader>l :bn<CR>
nnoremap <leader>h :bp<CR>

" system clipboard
" copy to sys clipboard
vnoremap <C-c> "+y

nmap <C-P> :GitFiles<CR>
nmap <C-O> :Rg<CR>

let g:indentLine_color_term = 239
let g:indentLine_char = '▏'

" coc explorer
" map <C-n> :CocCommand explorer<CR>

" nerdtree
map <C-n> :NERDTreeToggle<CR>
map <C-m> :NERDTreeFind<CR>
let g:NERDTreeIgnore = ['^node_modules$', '.DS_Store$']
let g:NERDTreeWinPos = "right"
let g:NERDTreeShowHidden = 1
let NERDTreeMinimalUI = 1

" coc configuration
"let g:coc_global_extensions = ['coc-tsserver', 'coc-eslint', 'coc-prettier', 'coc-json', 'coc-tslint-plugin']
" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')
" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)
" navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" Fix autofix problem of current line
nmap <leader>qf <Plug>(coc-fix-current)
nmap <silent> gtd <Plug>(coc-definition)

" prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile

set tabstop=4
set shiftwidth=2
set expandtab

" nerdcommenter
vmap ++ <plug>NERDCommenterToggle
nmap ++ <plug>NERDCommenterToggle

let g:vim_markdown_conceal = 0

set lazyredraw
let NERDTreeHighlightCursorline = 0

autocmd BufRead,BufNewFile tsconfig.json set filetype=jsonc


" fzf
let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'highlight': 'Todo' } }
let $FZF_DEFAULT_OPTS = '--layout=reverse --info=inline'
let $FZF_DEFAULT_COMMAND="rg --files --hidden"

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

"Get Files
command! -bang -nargs=? -complete=dir GitFiles
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)

" Get text in files with Rg
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

