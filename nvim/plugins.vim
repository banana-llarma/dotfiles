" =================================================================================================
" Plugins

call plug#begin('~/.config/nvim/plugged')
" lua
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'steelsojka/completion-buffers'
Plug 'nvim-lua/diagnostic-nvim'
Plug 'norcalli/nvim-colorizer.lua'

" Programming
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'dense-analysis/ale'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-eunuch'
Plug 'SirVer/ultisnips'

" Testing
Plug 'voldikss/vim-floaterm'
Plug 'mattn/emmet-vim'
Plug 'embark-theme/vim', { 'as': 'embark' }

" Vim Traning
Plug 'ThePrimeagen/vim-be-good'

" Notetaking
Plug 'vimwiki/vimwiki'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

" Theam
Plug 'morhetz/gruvbox'
Plug 'sheerun/vim-polyglot'
Plug 'mboughaba/i3config.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'shmargum/vim-sass-colors'
Plug 'ryanoasis/vim-devicons'
call plug#end()

" =================================================================================================
