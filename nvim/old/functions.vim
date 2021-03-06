func! Enter()
  if getline('.')[col('.') - 2:col('.') - 1] == '><'
    return "\<c-g>u\<cr>\<c-o>O"
  elseif getline('.')[col('.') - 2:col('.') - 1] == '{}'
    return "\<c-g>u\<cr>\<c-o>O"
  elseif getline('.')[col('.') - 2:col('.') - 1] == '()'
    return "\<c-g>u\<cr>\<c-o>O"
  elseif getline('.')[col('.') - 2:col('.') - 1] == '[]'
    return "\<c-g>u\<cr>\<c-o>O"
  elseif getline('.')[col('.') - 2:col('.') - 1] == '``'
    return "\<c-g>u\<cr>\<c-o>O"
  else
    return "\<c-g>u\<cr>"
  endif
endfunc

func! Rbrak()
  if getline('.')[col('.') - 2:col('.') - 1] == '[]'
    return "\<right>"
  endif
  return "]"
endfunc

func! Rbrace()
  if getline('.')[col('.') - 2:col('.') - 1] == '{}'
    return "\<right>"
  endif
  return "}"
endfunc

func! Rpren()
  if getline('.')[col('.') - 2:col('.') - 1] == '()'
    return "\<right>"
  endif
  return ")"
endfunc

func! Backspace()
  if getline('.')[col('.') - 2:col('.') - 1] == '{}'
    return "\<right>\<bs>\<bs>"
  elseif getline('.')[col('.') - 2:col('.') - 1] == '()'
    return "\<right>\<bs>\<bs>"
    hats getline('.')[col('.') - 2:col('.') - 1] == '[]'
    return "\<right>\<bs>\<bs>"
  elseif getline('.')[col('.') - 3:col('.')] == '{  }'
    return "\<right>\<bs>\<bs>"
  elseif getline('.')[col('.') - 2:col('.') - 1] == "''"
    return "\<right>\<bs>\<bs>"
  elseif getline('.')[col('.') - 2:col('.') - 1] == '""'
    return "\<right>\<bs>\<bs>"
  elseif getline('.')[col('.') - 2:col('.') - 1] == '``'
    return "\<right>\<bs>\<bs>"
  endif
  return "\<bs>"
endfunc

func! Space()
  if getline('.')[col('.') - 2:col('.')] == '{}'
    return "\<space>\<space>\<left>"
  else
    return "\<space>"
  endif
endfunc


func! BufferClose()
  if len(getbufinfo({'buflisted':1})) > 1
    " more then one buffer open
    if &readonly == 1 || expand('%') == '' || &buftype == 'nofile'
      silent bd!
    else
      silent w | bd
    endif
  else
    " only one buffer open
    if &readonly == 1 || expand('%') == '' || &buftype == 'nofile'
      silent q!
    else
      silent wq!
    endif
  endif
endfunc

func! Check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" func! Space()
"   let line = getline('.')
"   if strlen(substitute(line, '\s*', "", "g")) == 0
"     return ""
"   else
"     return "\<space>"
"   endif
" endfunc

func! Sub(arg1, arg2)

  exec 's/\v' 
endfunc
