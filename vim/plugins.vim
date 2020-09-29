" =================================================================================================
" Plugins

call plug#begin('~/.config/nvim/plugged')

" lua
Plug 'norcalli/nvim-colorizer.lua'

" Programming
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'dense-analysis/ale'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-eunuch'
Plug 'SirVer/ultisnips'
Plug 'tpope/vim-commentary'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-repeat'

" Testing
Plug 'voldikss/vim-floaterm'
Plug 'machakann/vim-sandwich'

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