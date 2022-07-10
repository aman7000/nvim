source $HOME/.config/nvim/vim-plug/plugins.vim
source $HOME/.config/nvim/airline.vim
source $HOME/.config/nvim/signify.vim

" for lightspeed plugin
source $HOME/.config/nvim/repeat.vim

nnoremap ,d :lua require'popui.diagnostics-navigator'()<CR>

set mouse=a

"colorscheme nord
"colorscheme onedark
"colorscheme gruvbox
"colorscheme kanagawa
colorscheme xoria256
"colorscheme solarized
"colorscheme tokyonight

set background=dark

highlight Normal ctermbg=none
highlight NonText ctermbg=none
highlight Normal guibg=none
highlight NonText guibg=none

"let mapleader = " "
nnoremap <C-\> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>
nnoremap <leader>h :Startify<CR>
 
" Find files using Telescope command-line sugar.
nnoremap <leader>ft <cmd>Telescope<cr>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fgf <cmd>Telescope git_files<cr>
nnoremap <leader>fgr <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fp <cmd>Telescope neoclip<cr>
nnoremap <leader>fo <cmd>Telescope bookmarks<cr>

" tagbar
nmap <F8> :TagbarToggle<CR>

" Markdown
nmap <C-s> <Plug>MarkdownPreview
nmap <M-s> <Plug>MarkdownPreviewStop
nmap <C-p> <Plug>MarkdownPreviewToggle

set splitbelow splitright

" window movements
nnoremap <C-h> <C-w><C-h>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>

" window resize
nnoremap <ESC><up> :res -5<CR>
nnoremap <ESC><down> :res +5<CR>
nnoremap <ESC><left> :vert res -5<CR>
nnoremap <ESC><right> :vert res +5<CR>

" from vert to horizontal, from horizontal to vertical
nnoremap <ESC>th  <C-w>t<C-w>H
nnoremap <ESC>tk  <C-w>t<C-w>K

" Bookmarks
nmap <Leader><Leader> <Plug>BookmarkToggle
nmap <Leader>i <Plug>BookmarkAnnotate
nmap <Leader>a <Plug>BookmarkShowAll
nmap <Leader>j <Plug>BookmarkNext
nmap <Leader>k <Plug>BookmarkPrev
nmap <Leader>c <Plug>BookmarkClear
nmap <Leader>x <Plug>BookmarkClearAll
nmap <Leader>kk <Plug>BookmarkMoveUp
nmap <Leader>jj <Plug>BookmarkMoveDown
nmap <Leader>g <Plug>BookmarkMoveToLine

nnoremap <silent> <F5> :lua require'dap'.continue()<CR>
nnoremap <silent> <F10> :lua require'dap'.step_over()<CR>
nnoremap <silent> <F11> :lua require'dap'.step_into()<CR>
nnoremap <silent> <F12> :lua require'dap'.step_out()<CR>
nnoremap <silent> <leader>b :lua require'dap'.toggle_breakpoint()<CR>
nnoremap <silent> <leader>B :lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
nnoremap <silent> <leader>lp :lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>
nnoremap <silent> <leader>dr :lua require'dap'.repl.open()<CR>
nnoremap <silent> <leader>dl :lua require'dap'.run_last()<CR>

vnoremap <M-k> <Cmd>lua require("dapui").eval()<CR>

" Code navigation shortcuts
nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> gy   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>

" Code actions are also very useful.
nnoremap <silent> ga    <cmd>lua vim.lsp.buf.code_action()<CR>

" Goto previous/next diagnostic warning/error
nnoremap <silent> g[ <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> g] <cmd>lua vim.lsp.diagnostic.goto_next()<CR>

"nmap <leader>gg :FloatermNew --height=1.0 --width=1.0 gitui<CR>
nmap <leader>gi :FloatermNew --height=1.0 --width=1.0 lazygit<CR>

" signify : Jump though hunks
"nmap <leader>gj <plug>(signify-next-hunk)
"nmap <leader>gk <plug>(signify-prev-hunk)
"nmap <leader>gJ 9999<leader>gJ
"nmap <leader>gK 9999<leader>gk

" puremourning/vimspector
" let g:vimspector_enable_mappings = 'HUMAN'
" nnoremap <leader>da :call vimspector#Launch()<CR>
" nnoremap <leader>dx :call vimspector#Reset()<CR>
" nnoremap <S-k> :call vimspector#StepOut()<CR>
" nnoremap <S-l> :call vimspector#StepInto()<CR>
" nnoremap <S-j> :call vimspector#StepOver()<CR>
" nnoremap <leader>d_ :call vimspector#Restart()<CR>
" nnoremap <leader>dn :call vimspector#Continue()<CR>
" nnoremap <leader>drc :call vimspector#RunToCursor()<CR>
" nnoremap <leader>dh :call vimspector#ToggleBreakpoint()<CR>
" nnoremap <leader>de :call vimspector#ToggleConditionalBreakpoint()<CR>
" nnoremap <leader>dX :call vimspector#ClearBreakpoints()<CR>
" autocmd FileType java nmap <leader>dd :CocCommand java.debug.vimspector.start<CR>


set clipboard+=unnamedplus

let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_ext2syntax = {'.md':'markdown','.markdown':'markdown','.mdown':'markdown'}

"Makes vimviki markdown links as [text](text.md) instead of [text](text.md)
let g:vimwiki_markdown_link_ext = 1

let g:taskwiki_markup_syntax = 'markdown'
let g:markdown_folding = 1

"set expandtab
"set tabstop=2
"set softtabstop=2
"set shiftwidth=2
"autocmd Filetype css setlocal tabstop=2

nnoremap <silent> <c-1> i'<esc>xkea'<esc>k

set ruler
"set number
set cursorline
"set formatoptions-=cro
set laststatus=0
" Alternate way to save
"nnoremap <C-s> :w<CR>
" Better tabbing
vnoremap < <gv
vnoremap > >gv

