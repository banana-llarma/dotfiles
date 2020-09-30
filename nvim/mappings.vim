"==================================================================================================

" Basic Movement
nnoremap <up> gkzz
nnoremap <down> gjzz
nnoremap dl :normal 0d$<cr>
nnoremap cl :normal 0c$<cr>
nnoremap yl :normal 0y$<cr>
nnoremap { {zz
nnoremap } }zz
nnoremap <pageup> <c-u>zz
nnoremap <pagedown> <c-d>zz
nnoremap G Gzz
nnoremap <c-o> <c-o>zz
nnoremap <c-i> <c-i>zz
nnoremap <home> ^
nnoremap <s-right> v<right>
nnoremap <s-left> v<left>
nnoremap <s-down> v<down>
nnoremap <s-up> v<up>
vnoremap <s-right> <right>
vnoremap <s-left> <left>
vnoremap <s-down> <down>
vnoremap <s-up> <up>
inoremap <home> <c-o>^

" Buffers
nnoremap <c-s> :w!<cr>
inoremap <c-s> <c-o>:w!<cr>

" Splits
nnoremap <space><up> <c-w>k
nnoremap <space><down> <c-w>j
nnoremap <space><left> <c-w>h
nnoremap <space><right> <c-w>l
nnoremap <space>vs :vnew<cr>

" Tabs
nnoremap <tab> :tabn<cr>
nnoremap <space>n :tabnew<cr>

" Extra
nnoremap y "*y
nnoremap yi "*yi
inoremap <c-h> <c-w>
nnoremap <space>rg :Rg! <C-R>=expand("<cword>")<cr><cr>
nnoremap <space>hw :h <c-r>=expand("<cword>>")<cr><cr>
cnoremap <c-h> <c-w>
nnoremap <esc> <esc>:nohl<cr>
inoremap <c-k> <c-x><c-k>
inoremap <esc> <right><esc>
nnoremap gf <c-w>gf

" Unmap
nnoremap K <nop>
nnoremap Q <nop>
nnoremap <c-z> <nop>
nnoremap S <nop>
nnoremap H <nop>
nnoremap L <nop>
nnoremap r <nop>
nnoremap R <nop>

" Visuale
vnoremap <up> <up>zz
vnoremap <down> <down>zz
vnoremap { {zz
vnoremap } }zz
vnoremap y "*y
vnoremap p "_dP

"Substitutions 
nnoremap SS :s/<c-r>=expand("<cWORD>>")<cr>//g<left><left>
nnoremap ss :s/<c-r>=expand("<cword>")<cr>//g<left><left>
vnoremap ss :s///gi<left><left><left><left>

"Filetype Mappings 

" Command Mode
ca ex !chmod +x %<C-R>=Eatchar('\s')<cr>
ca vrc tabe ~/dotfiles/nvim/init.vim
ca vma tabe ~/dotfiles/nvim/mappings.vim
ca vpl tabe ~/dotfiles/nvim/plugins.vim
ca vpc tabe ~/dotfiles/nvim/plugin-configs.vim
ca irc tabe ~/dotfiles/i3/config
ca pol tabe ~/dotfiles/polybar/config
ca kit tabe ~/dotfiles/kitty/kitty.conf
ca sxh tabe ~/dotfiles/sxhkd/sxhkdrc
ca bsp tabe ~/dotfiles/bspwm/bspwmrc
ca zsh tabe ~/dotfiles/zsh/.zshrc
ca mux tabe ~/dotfiles/tmux/tmux.conf
ca lrc tabe ~/dotfiles/nvim/lua/init.lua
ca p <c-r>=expand("%:.:h")<cr>/<c-r>=Eatchar('\s')<cr>
ca f <c-r>=expand("%:.")<cr><c-r>=Eatchar('\s')<cr>
ca ft <c-r>=expand(&ft)<cr><c-r>=Eatchar('\s')<cr>
ca w <c-r>=expand("<cword>")<cr><c-r>=Eatchar('\s')<cr>
ca W <c-r>=expand("<cWORD>")<cr><c-r>=Eatchar('\s')<cr>
ca sub %s///g<left><left><left><c-r>=Eatchar('\s')<cr>
ca dsub DSub

" adds all files with the same extension to the argslist
command Argadd execute 'argadd **/*%:e'
command! -nargs=0 -bar Qargs execute 'args' QuickfixFilenames()
command -nargs=* DSub execute 'call DSub(<f-args>)'

" Terminal mappings
nnoremap <space>tt :FloatermNew<cr>
tnoremap <esc> <c-\><c-n>

" Testing

" Plugin Mappings 
nnoremap <space>sn :UltiSnipsEdit<cr>
nmap <f1> <Plug>VimwikiNextLink
nmap <f2> <Plug>VimwikiAddHeaderLevel
nmap <f3> <Plug>VimwikiDiaryNextDay
nmap <f4> <Plug>VimwikiDiaryPrevDay
nmap <f5> <Plug>VimwikiPrevLink
nmap <f6> <Plug>VimwikiGoBackLink
ca mv Move
ca mk Mkdir
inoremap <c-space> <c-r>=(UltiSnips#ExpandSnippetOrJump())<cr>
nnoremap <space><space> :Files<cr>
nnoremap <space>f :Files ~<cr>
nnoremap <space><cr> :Vista finder!<cr>
imap <silent><expr><tab>
      \ pumvisible() ? "\<Plug>(completion_confirm_completion)" :
      \ <sid>check_back_space() ? "\<tab>" :
      \  completion#trigger_completion()
inoremap <silent><expr><up>
      \ pumvisible() ? "\<c-p>" :
      \ "\<up>"
inoremap <silent><expr><down>
      \ pumvisible() ? "\<c-n>" :
      \ "\<down>"
inoremap <silent><expr><cr>
      \ pumvisible() ? "\<c-g>u<cr>" :
      \ "\<cr>"
inoremap <silent><expr><right>
      \ pumvisible() ? "\<c-g>u<right>" :
      \ "\<right>"
inoremap <silent><expr><left>
      \ pumvisible() ? "\<c-g>u<left>" :
      \ "\<left>"

"==================================================================================================
" Functions

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

function IsASnippet()
  return !empty(UltiSnips#SnippetsInCurrentScope())
endfunction
function! Eatchar(pat)
  let c = nr2char(getchar(0))
  return (c =~ a:pat) ? '' : c
endfunction

function! QuickfixFilenames()
  let buffer_numbers = {}
  for quickfix_item in getqflist()
    let buffer_numbers[quickfix_item['bufnr']] = bufname(quickfix_item['bufnr'])
  endfor
  return join(map(values(buffer_numbers), 'fnameescape(v:val)'))
endfunction

function! DSub(arg1, arg2)
  Argadd
  vimgrep /a:arg1/ ##
  Qargs
  exec 'argdo %s/' . a:arg1 . '/' . a:arg2 . '/ge'
endfunction


"==================================================================================================


if has('nvim')
  nnoremap <silent>gr <cmd>lua vim.lsp.buf.references()<CR>
  nnoremap <silent>gd :lua vim.lsp.buf.definition()<cr>
  nnoremap <silent><space>rn :lua vim.lsp.buf.rename()<cr>
  nnoremap <silent><c-h> :lua vim.lsp.buf.hover()<cr>
else
  " is vim 
  nnoremap <silent> <esc>OA <up>
  nnoremap <silent> <esc>OB <down>
  nnoremap <silent> <esc>OC <right>
  nnoremap <silent> <esc>OD <left>
  inoremap <silent> <esc>OA <up>
  inoremap <silent> <esc>OB <down>
  inoremap <silent> <esc>OC <right>
  inoremap <silent> <esc>OD <left>
endif

