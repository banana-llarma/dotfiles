" Ale
let b:ale_linters = ['eslint', 'autopep8', 'stylelint'] 
let b:ale_fixers = {
      \ 'javascript': 'eslint',
      \ 'typescript': 'eslint',
      \ 'python': 'autopep8',
      \ 'scss': 'stylelint'
      \ }
let g:ale_fix_on_save = 1
let g:ale_linters_explicit = 1
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'

"Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#show_tabs = 0
"let g:airline#extensions#tabline#left_sep = ''
"let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline_powerline_fonts = 1
"let g:airline_left_sep = ''
"let g:airline_right_sep = ''

"Emmet
let g:user_emmet_install_global = 1

" Scalpel
let g:ScalpelCommand='S'

" Nvim-Lsp
" pip install 'python-language-server[all]'
lua << END
require'nvim_lsp'.tsserver.setup{}
require'nvim_lsp'.vimls.setup{}
require'nvim_lsp'.jsonls.setup{}
require'nvim_lsp'.pyls.setup{}
require'nvim_lsp'.cssls.setup{}
require'nvim_lsp'.clangd.setup{}
END

let g:coc_global_extensions = ['coc-json', 'coc-snippets', 'coc-emmet']
let g:coc_snippet_next = '<tab>'

" Vista.vim
let g:vista_fzf_preview = ['right:50%']
let g:vista_default_executive = 'ctags'
let g:vista_executive_for = {
      \ 'javascript': 'nvim_lsp',
      \ 'typescript': 'nvim_lsp',
      \ 'python': 'nvim_lsp',
      \ 'vim': 'nvim_lsp',
      \ 'json': 'nvim_lsp',
      \ 'css' : 'nvim_lsp',
      \ 'scss': 'nvim_lsp'
      \}


" startify
let g:startify_session_dir = '~/.config/nvim/session'
let g:startify_lists = [
      \ { 'type': 'bookmarks', 'header': ['Configs']      },
      \ { 'type': 'sessions',  'header': ['Sessions']       },
      \ ]
let g:startify_bookmarks = [
      \ { 'zsh': '~/.zshrc' },
      \ { 'bsh': '~/.bashrc' },
      \ { 'mux': '~/.tmux.conf' },
      \ { 'vrc': '~/.config/nvim/init.vim' },
      \ { 'vma': '~/.config/nvim/mappings.vim' },
      \ { 'vpc': '~/.config/nvim/plugin-configs.vim' },
      \ { 'vpl': '~/.config/nvim/plugins.vim' },
      \ { 'irc': '~/.config/i3/config' },
      \ { 'pol': '~/.config/polybar/config' },
      \ { 'kit': '~/.config/kitty/kitty.conf' },
      \ { 'sxh': '~/.config/sxhkd/sxhkdrc' },
      \ ]
" vim-livedown
let g:livedown_browser = "brave"

" vim-rooter
let g:rooter_patterns = ['.git', '=notes', '=node_modules' ]

" vim-fzf
let g:fzf_preview_window = 'right:70%'

" vimwiki

let g:vimwiki_table_mappings = 0
nmap <f1> <Plug>VimwikiNextLink
nmap <f2> <Plug>VimwikiAddHeaderLevel
nmap <f3> <Plug>VimwikiDiaryNextDay
nmap <f4> <Plug>VimwikiDiaryPrevDay

let g:vimwiki_table_auto_fmt=0
let g:vimwiki_list = [{
      \ 'path': '~/dotfiles/notes',
      \ 'syntax': 'markdown',
      \ 'ext':'.md',
      \}]

let g:mkdp_auto_start = 0
let g:mkdp_browser = 'brave'

