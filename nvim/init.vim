
source ~/.config/nvim/functions.vim
source ~/.config/nvim/plugins.vim
source ~/.config/nvim/plugin-configs.vim
source ~/.config/nvim/mappings.vim

"==================================================================================================
" Theme

colorscheme gruvbox
set background=dark
" set number
set guicursor=
set relativenumber
set termguicolors
autocmd vimenter,SourcePost * hi ActiveWindow guibg=#282828
autocmd vimenter,SourcePost * hi InactiveWindow guibg=#202020
set winhighlight=Normal:ActiveWindow,NormalNC:InactiveWindow

""==================================================================================================
"" Lua

if has('nvim-0.5')
  lua require 'init'
endif

""==================================================================================================
"" Basic Config

syntax on
filetype plugin indent on
set wildmode=longest,full
if has('nvim')
  set listchars=tab:→\ ,eol:↲,trail:•,precedes:←,extends:→,nbsp:·
endif
set nobackup
set nowritebackup
set noswapfile
set nowrap
set hidden
set tabstop=2
set shiftwidth=0
set expandtab
set smarttab
set smartindent
set autoindent
set splitbelow
set splitright
set showmode
set smartcase
set ignorecase
set mouse=a
set clipboard+=unnamed
set updatetime=50
set path+=.,**
set laststatus=2
set spelllang=en_gb
set matchpairs+=<:>
set shortmess+=c
set lazyredraw
set backspace=indent,eol,start
set omnifunc=v:lua.vim.lsp.omnifunc
" set scrolloff=5
set list
" set completeopt=menuone,noinsert,noselect
set completeopt=menuone,noinsert

set noshowmode
set hlsearch
set nocompatible
set timeoutlen=500
set noshowmode
set noruler
set laststatus=2
set showcmd
set timeoutlen=1000 " how long vim waits for next key press
set rtp+=~/.config/nvim/autoload/functions.vim
set pumheight=10 " completion menu hight
set pumwidth=30 " completion munu widtha
" =============================================================================
" Vimscript
augroup autocmds
  autocmd!
  autocmd FileType vimwiki setlocal spell
  autocmd VimEnter,SourcePost * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))|   PlugInstall --sync | q| endif " PlugInstall on uninstalld plugins
  autocmd BufReadPost * normal g'"
  autocmd BufWritePre * if (&filetype != 'make')| %s/\t/  /ge | endif
  autocmd BufWinEnter,WinEnter term://* start " if terminal window auto enter insert mode
  autocmd BufWrite ~/.tmux.conf silent !tmux source-file ~/.tmux.conf " source ~/.tmux.conf when you save ~/.tmux.conf
  autocmd BufRead ~/dotfiles/nvim/snippets/* set ft=jsonc
  " autocmd BufWritePost * normalc to mmgg=G`m
  " autocmd CursorMoved,BufWritePost * normal zz
  autocmd BufNewFile,BufRead ~/.config/i3/config set filetype=i3config
  autocmd VimEnter * RainbowParenthesesToggle
  autocmd Syntax * RainbowParenthesesLoadRound
  autocmd Syntax * RainbowParenthesesLoadSquare
  autocmd Syntax * RainbowParenthesesLoadBraces
  autocmd FileType vim nnoremap <silent><buffer><c-s> :w<cr>:so $MYVIMRC<cr>
  " autocmd BufReadPre ~/dotfiles/nvim/lua/* nnoremap <silent><buffer><c-s> :w<cr>:luafile %<cr>
  " autocmd Focus * highlight Normal guibg=#000000
" autocmd BufEnter * highlight Normal guibg=#000000
" autocmd BufLeave * highlight Normal guibg=#ffffff 



  if has('nvim-0.5')
    autocmd TextYankPost * silent! lua vim.highlight.on_yank { higroup='IncSearch', timeout=500 } -- highlight what was just yanked
    autocmd TextYankPost * call setreg("+", getreg("*")) " makes the + register the same as the * register
    autocmd BufEnter * lua require'completion'.on_attach() -- completion-nvim on all buffers
  endif
augroup end

