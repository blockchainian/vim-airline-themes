let g:airline#themes#kiss_dark#palette = {}

function! airline#themes#kiss_dark#refresh()
  let s:Ca = ['#080808', '#585858', 232, 240]
  let s:Ia = ['#008787', '#5f0087', 30 , 54]
  let s:Na = ['#008787', '#262626', 30, 235]
  let s:Va = ['#00af87', '#5f005f', 36, 53]
  let s:b = ['#00ffff', 'NONE', 14, 'NONE']

  let s:SL = airline#themes#get_highlight('StatusLine')
  let s:SLNC = airline#themes#get_highlight('StatusLineNC')

  " normal, including sections [a, b, c] and [x, y, z]
  let g:airline#themes#kiss_dark#palette.normal = airline#themes#generate_color_map(s:is_visual_mode() ? s:Va : s:Na, s:b, s:SL)
  let g:airline#themes#kiss_dark#palette.normal.airline_error   = s:SLNC
  let g:airline#themes#kiss_dark#palette.normal.airline_warning = s:SLNC
  let g:airline#themes#kiss_dark#palette.normal.airline_term    = s:SL

  " insertion
  let g:airline#themes#kiss_dark#palette.insert = airline#themes#generate_color_map(s:Ia, s:b, s:SL)
  let g:airline#themes#kiss_dark#palette.replace = copy(g:airline#themes#kiss_dark#palette.insert)
  let g:airline#themes#kiss_dark#palette.terminal = copy(g:airline#themes#kiss_dark#palette.insert)

  " visual
  let g:airline#themes#kiss_dark#palette.visual = airline#themes#generate_color_map(s:Va, s:b, s:SL)

  " command
  let g:airline#themes#kiss_dark#palette.commandline = airline#themes#generate_color_map(s:Ca, s:b, s:SL)

  " inactive
  let g:airline#themes#kiss_dark#palette.inactive = airline#themes#generate_color_map(s:SLNC, s:SLNC, s:SLNC)
endfunction

function! s:is_visual_mode()
    return index(['v', 'V', "\<C-V>"], mode()) >= 0
endfunction
