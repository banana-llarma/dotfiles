" =================================================================================================
" Plugins

call plug#begin('~/.config/nvim/plugged')
" lua
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'steelsojka/completion-buffers'
Plug 'nvim-lua/diagnostic-nvim'
Plug 'norcalli/snippets.nvim'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'

" Programming
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'dense-analysis/ale'
Plug 'vifm/vifm.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-eunuch'

" Testing
Plug 'voldikss/vim-floaterm'
Plug 'SirVer/ultisnips'

" Vim Traning
Plug 'ThePrimeagen/vim-be-good'

" Notetaking
Plug 'vimwiki/vimwiki'

" Theam
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'mboughaba/i3config.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'shmargum/vim-sass-colors'
Plug 'ryanoasis/vim-devicons'
Plug 'sheerun/vim-polyglot'
call plug#end()

" =================================================================================================
