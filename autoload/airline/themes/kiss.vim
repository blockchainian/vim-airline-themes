let g:airline#themes#kiss#palette = {}

function! airline#themes#kiss#refresh()
  let s:Ca = ['#949494', '#000000', 246, 0]
  let s:Ia = ['#000087', '#00ffff', 18 , 51]
  let s:Na = ['#000087', '#87afff', 18, 111]
  let s:Va = ['#000087', '#ffaf00', 18, 214]
  let s:b = ['#00ffff', 'NONE', 14, 'NONE']

  let s:SL = airline#themes#get_highlight('StatusLine')
  let s:SLNC = airline#themes#get_highlight('StatusLineNC')

  " normal, including sections [a, b, c] and [x, y, z]
  let g:airline#themes#kiss#palette.normal = airline#themes#generate_color_map(s:is_visual_mode() ? s:Va : s:Na, s:b, s:SL)
  let g:airline#themes#kiss#palette.normal.airline_error   = s:SLNC
  let g:airline#themes#kiss#palette.normal.airline_warning = s:SLNC
  let g:airline#themes#kiss#palette.normal.airline_term    = s:SL

  " insertion
  let g:airline#themes#kiss#palette.insert = airline#themes#generate_color_map(s:Ia, s:b, s:SL)
  let g:airline#themes#kiss#palette.replace = copy(g:airline#themes#kiss#palette.insert)
  let g:airline#themes#kiss#palette.terminal = copy(g:airline#themes#kiss#palette.insert)

  " visual
  let g:airline#themes#kiss#palette.visual = airline#themes#generate_color_map(s:Va, s:b, s:SL)

  " command
  let g:airline#themes#kiss#palette.commandline = airline#themes#generate_color_map(s:Ca, s:b, s:SL)

  " inactive
  let g:airline#themes#kiss#palette.inactive = airline#themes#generate_color_map(s:SLNC, s:SLNC, s:SLNC)
endfunction

function! s:is_visual_mode()
    return index(['v', 'V', "\<C-V>"], mode()) >= 0
endfunction
