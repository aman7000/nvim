" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

    " Better Syntax Support
    "Plug 'sheerun/vim-polyglot'
    " File Explorer
    "Plug 'scrooloose/NERDTree'
    " Auto pairs for '(' '[' '{'
    "Plug 'jiangmiao/auto-pairs'
    
    Plug 'mhinz/vim-startify'
    Plug 'keitokuch/vterm'
    Plug 'vimwiki/vimwiki'
    " Task warrier
    "Plug 'tbabej/taskwiki'
    " Plug 'tools-life/taskwiki'
    Plug 'plasticboy/vim-markdown'
    Plug 'blindFS/vim-taskwarrior'
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
    Plug 'tmux-plugins/vim-tmux'    

    Plug 'github/copilot.vim'
    Plug 'preservim/tagbar'
    Plug 'tpope/vim-commentary'
    Plug 'ur4ltz/surround.nvim'
    Plug 'mg979/vim-visual-multi', {'branch': 'master'}
    Plug 'junegunn/goyo.vim'
    Plug 'AckslD/nvim-neoclip.lua'
    Plug 'dhruvmanila/telescope-bookmarks.nvim'
    Plug 'tami5/sqlite.lua'
    Plug 'MattesGroeger/vim-bookmarks'
    Plug 'matveyt/neoclip'

    " fast search and reaching anywhere in 2 keystrokes
    Plug 'ggandor/lightspeed.nvim'


    " requires
    Plug 'kyazdani42/nvim-web-devicons' " for file icons
    Plug 'kyazdani42/nvim-tree.lua'


    " Completion framework
    Plug 'hrsh7th/nvim-cmp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'saadparwaiz1/cmp_luasnip'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-nvim-lua'
    Plug 'hrsh7th/cmp-cmdline'

    Plug 'L3MON4D3/LuaSnip'
    Plug 'rafamadriz/friendly-snippets'
    
    " Plug 'hrsh7th/cmp-vsnip'
    " Plug 'hrsh7th/vim-vsnip'
    
    Plug 'neovim/nvim-lspconfig'
    Plug 'tami5/lspsaga.nvim'
    
    Plug 'williamboman/nvim-lsp-installer'
    Plug 'RRethy/vim-illuminate'

    " Extentions to built-in LSP, for example, providing type inlay hints
    Plug 'nvim-lua/lsp_extensions.nvim'
    
    
    Plug 'simrat39/rust-tools.nvim'
    Plug 'RishabhRD/popfix'
    Plug 'hood/popui.nvim'

    " Optional dependencies
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-telescope/telescope-ui-select.nvim'
    Plug 'hood/popui.nvim'
    " Debugging (needs plenary from above as well)
    Plug 'mfussenegger/nvim-dap'
    Plug 'rcarriga/nvim-dap-ui'
    Plug 'ravenxrz/DAPInstall.nvim'

    " Color scheme used in the GIFs!
    Plug 'arcticicestudio/nord-vim'
    Plug 'joshdick/onedark.vim'
    Plug 'morhetz/gruvbox'
    Plug 'rebelot/kanagawa.nvim'
    Plug 'altercation/vim-colors-solarized'
    Plug 'vim-scripts/xoria256.vim'
    Plug 'folke/tokyonight.nvim', { 'branch': 'main' }


    " Status line
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    Plug 'powerline/powerline-fonts'

    " git
    Plug 'mhinz/vim-signify'
    "Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-rhubarb'
    Plug 'junegunn/gv.vim'
    Plug 'voldikss/vim-floaterm'

    " java
    "Plug 'nvim-lua/lsp-status.nvim'
    "Plug 'onsails/lspkind-nvim'
    Plug 'hrsh7th/nvim-compe'
    Plug 'mfussenegger/nvim-jdtls'
    Plug 'RishabhRD/nvim-lsputils' 

    " javaScript, typeScript
    Plug 'jose-elias-alvarez/null-ls.nvim'
    Plug 'jose-elias-alvarez/nvim-lsp-ts-utils'
    
    Plug 'windwp/nvim-autopairs'
    "Plug 'jiangmiao/auto-pairs' "this will auto close ( [ {
    
    " javascript development
    "Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'} " this is for auto complete, prettier and tslinting
    "let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier']  " list of CoC extensions needed
    " these two plugins will add highlighting and indenting to JSX and TSX files.
    "Plug 'yuezk/vim-js'
    "Plug 'HerringtonDarkholme/yats.vim'
    "Plug 'maxmellon/vim-jsx-pretty'
    
    Plug 'sbdchd/neoformat'

    " Add maktaba and codefmt to the runtimepath.
    " (The latter must be installed before it can be used.)
    Plug 'google/vim-maktaba'
    Plug 'google/vim-codefmt'
    " Also add Glaive, which is used to configure codefmt's maktaba flags. See
    " `:help :Glaive` for usage.
    Plug 'google/vim-glaive'

      
    Plug 'ray-x/lsp_signature.nvim'


    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

call plug#end()

"=============== Update all plugins weekly =============
function! OnVimEnter() abort
  " Run PlugUpdate every week automatically when entering Vim.
  if exists('g:plug_home')
    let l:filename = printf('%s/.vim_plug_update', g:plug_home)
    if filereadable(l:filename) == 0
      call writefile([], l:filename)
    endif

    let l:this_week = strftime('%Y_%V')
    let l:contents = readfile(l:filename)
    if index(l:contents, l:this_week) < 0
      call execute('PlugUpdate')
      call writefile([l:this_week], l:filename, 'a')
    endif
  endif
endfunction

autocmd VimEnter * call OnVimEnter()
"========================================================
"
" surround    conflict with lightspeed
"lua require"surround".setup{}


" =========== Dashboard ===============
" returns all modified files of the current git repo
" `2>/dev/null` makes the command fail quietly, so that when we are not
" in a git repo, the list will be empty
function! s:gitModified()
    let files = systemlist('git ls-files -m 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

" same as above, but show untracked files, honouring .gitignore
function! s:gitUntracked()
    let files = systemlist('git ls-files -o --exclude-standard 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

let g:startify_lists = [
        \ { 'type': 'files',     'header': ['   MRU']            },
        \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
        \ { 'type': 'sessions',  'header': ['   Sessions']       },
        \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
        \ { 'type': function('s:gitModified'),  'header': ['   git modified']},
        \ { 'type': function('s:gitUntracked'), 'header': ['   git untracked']},
        \ { 'type': 'commands',  'header': ['   Commands']       },
        \ ]

let g:startify_bookmarks = [ 
        \ {'z': '~/.config/zsh/.zshrc'},
        \ {'t': '~/.tmux.conf'},
        \ {'a': '~/.config/alacritty/alacritty.yml'}
        \ ]

let g:startify_fortune_use_unicode = 1
let g:startify_session_dir = '~/.config/sessions'
let g:startify_change_to_vcs_root = 1
"============ end ====================

augroup autoformat_settings
  autocmd FileType bzl AutoFormatBuffer buildifier
  autocmd FileType c,cpp,proto,javascript,arduino AutoFormatBuffer clang-format
  autocmd FileType dart AutoFormatBuffer dartfmt
  autocmd FileType go AutoFormatBuffer gofmt
  autocmd FileType gn AutoFormatBuffer gn
  autocmd FileType html,css,sass,scss,less,json AutoFormatBuffer js-beautify
  autocmd FileType java AutoFormatBuffer clang-format
  autocmd FileType python AutoFormatBuffer yapf
  " Alternative: autocmd FileType python AutoFormatBuffer autopep8
  "autocmd FileType rust AutoFormatBuffer rustfmt
  autocmd FileType vue AutoFormatBuffer prettier
augroup END

autocmd BufWritePre *.js Neoformat    " Found to be working well

" augroup fmt
"   autocmd!
"   autocmd BufWritePre * undojoin | Neoformat
" augroup end
" let g:neoformat_enabled_java = ['uncrustify']

"source $HOME/.config/nvim/vim-install.lua

syntax on

" =========== JAVA-LS =================

" augroup lsp
"   au!
"   au FileType java source $HOME/.config/nvim/lua/java_dap1.lua
" augroup end
"
"
" augroup lsp
"   au!
"   au FileType java lua require'lua/java_dap1'.setup()
"   au FileType java lua require'lua/java_dap2'.setup()
" augroup end
" augroup lsp
"   au!
"   au FileType java lua require'jdtls_config'.setup()
" augroup end
" lua require'completion_config'
" =========== JAVASCRIPT, TYPESCRIPT ==
" source $HOME/.config/nvim/javascript.lua
"  ========== RUST SECTION ============
"
" Set completeopt to have a better completion experience
" :help completeopt
" menuone: popup even when there's only one match
" noinsert: Do not insert text until a selection is made
" noselect: Do not select, force user to select one from the menu
"set completeopt=menuone,noinsert,noselect

" Avoid showing extra messages when using completion
set shortmess+=c

"source $HOME/.config/nvim/lua/java.lua
"source $HOME/.config/nvim/lua/java_config.lua
"source $HOME/.config/nvim/lua/java_dap.lua
"source $HOME/.config/nvim/rust.lua

source $HOME/.config/nvim/misc.lua

" Set updatetime for CursorHold
" 300ms of no cursor movement to trigger CursorHold
"set updatetime=300
" Show diagnostic popup on cursor hold
"autocmd CursorHold *.rs lua vim.diagnostic.open_float(nil, { focusable = false })

" have a fixed column for the diagnostics to appear in
" this removes the jitter when warnings/errors flow in
set signcolumn=yes

"autocmd BufWritePre *.rs lua vim.lsp.buf.formatting_sync(nil, 200)

" Enable type inlay hints
" autocmd CursorMoved,InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost *.rs
" \ lua require'lsp_extensions'.inlay_hints{ prefix = '', highlight = "Comment", enabled = {"TypeHint", "ChainingHint", "ParameterHint"} }
"  ========== RUST SECTION END ============




let g:nvim_tree_quit_on_open = 1 "0 by default, closes the tree when you open a file
let g:nvim_tree_indent_markers = 1 "0 by default, this option shows indent markers when folders are open
let g:nvim_tree_git_hl = 1 "0 by default, will enable file highlight for git attributes (can be used without the icons).
let g:nvim_tree_highlight_opened_files = 1 "0 by default, will enable folder and file icon highlight for opened files/directories.
let g:nvim_tree_root_folder_modifier = ':~' "This is the default. See :help filename-modifiers for more options
let g:nvim_tree_add_trailing = 1 "0 by default, append a trailing slash to folder names
let g:nvim_tree_group_empty = 1 " 0 by default, compact folders that only contain a single folder into one node in the file tree
let g:nvim_tree_disable_window_picker = 1 "0 by default, will disable the window picker.
let g:nvim_tree_icon_padding = ' ' "one space by default, used for rendering the space between the icon and the filename. Use with caution, it could break rendering if you set an empty string depending on your font.
let g:nvim_tree_symlink_arrow = ' >> ' " defaults to ' ➛ '. used as a separator between symlinks' source and target.
let g:nvim_tree_respect_buf_cwd = 0 "0 by default, will change cwd of nvim-tree to that of new buffer's when opening nvim-tree.
let g:nvim_tree_create_in_closed_folder = 0 "1 by default, When creating files, sets the path of a file when cursor is on a closed folder to the parent folder when 0, and inside the folder when 1.
let g:nvim_tree_refresh_wait = 500 "1000 by default, control how often the tree can be refreshed, 1000 means the tree can be refresh once per 1000ms.
let g:nvim_tree_window_picker_exclude = {
    \   'filetype': [
    \     'notify',
    \     'packer',
    \     'qf'
    \   ],
    \   'buftype': [
    \     'terminal'
    \   ]
    \ }
" Dictionary of buffer option names mapped to a list of option values that
" indicates to the window picker that the buffer's window should not be
" selectable.
let g:nvim_tree_special_files = { 'README.md': 1, 'Makefile': 1, 'MAKEFILE': 1 } " List of filenames that gets highlighted with NvimTreeSpecialFile
let g:nvim_tree_show_icons = {
    \ 'git': 1,
    \ 'folders': 0,
    \ 'files': 0,
    \ 'folder_arrows': 0,
    \ }
"If 0, do not show the icons for one of 'git' 'folder' and 'files'
"1 by default, notice that if 'files' is 1, it will only display
"if nvim-web-devicons is installed and on your runtimepath.
"if folder is 1, you can also tell folder_arrows 1 to show small arrows next to the folder icons.
"but this will not work when you set indent_markers (because of UI conflict)

" default will show icon by default if no icon is provided
" default shows no icon by default
let g:nvim_tree_icons = {
    \ 'default': '',
    \ 'symlink': '',
    \ 'git': {
    \   'unstaged': "✗",
    \   'staged': "✓",
    \   'unmerged': "",
    \   'renamed': "➜",
    \   'untracked': "★",
    \   'deleted': "",
    \   'ignored': "◌"
    \   },
    \ 'folder': {
    \   'arrow_open': "",
    \   'arrow_closed': "",
    \   'default': "",
    \   'open': "",
    \   'empty': "",
    \   'empty_open': "",
    \   'symlink': "",
    \   'symlink_open': "",
    \   }
    \ }

" NvimTreeOpen, NvimTreeClose, NvimTreeFocus and NvimTreeResize are also available if you need them

set termguicolors " this variable must be enabled for colors to be applied properly

" a list of groups can be found at `:help nvim_tree_highlight`
highlight NvimTreeFolderIcon guibg=blue

