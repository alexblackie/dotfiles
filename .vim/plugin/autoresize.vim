" Title: autoresize.vim : Automatically Resizing Splitted Current Window Size Larger.
" File: autoresize.vim
" Author: Omi Taku (mail@nanasi.jp)
" URL: http://nanasi.jp/
" Version: 0.7
" Last Modified: November 30, 2007
"
" Overview
" --------
" This plugin updates vim splitted window size automatically large.
" Current window size will be large, and the other window size will be
" small.
"
" Installation
" ------------
" 1. Copy the autoresize.vim script to the $HOME/.vim/plugin or
"    the $HOME/vimfiles/plugin. Refer to the ':help add-plugin',
"    ':help add-global-plugin' and ':help runtimepath' topics for
"    more details about Vim plugins.
" 2. Restart Vim.
"
" Usage
" -----
" 1. Split vim window, and so current window height or width is automatically
"    updated with large value. 
" 2. You move cursor to the other window from one, the other window size is
"    automatically updated.
" 3. If you check this script,
"    split vim window with ":split" or ":vsplit",
"    and push <C-W><C-W><C-W><C-W><C-W><C-W>....
"
" Configuration
" -------------
" 1. Minimum window size.
"    Script use "g:AUTORESIZE_ANOTHER_WINDOW_HEIGHT" variables when you split window
"    horizontally.  If you split window vertically then, script use
"    "g:AUTORESIZE_ANOTHER_WINDOW_WIDTH" variables.
"    These variables are used as the other window size parameter. (not a current)
"
"    example.
"        :let g:AUTORESIZE_ANOTHER_WINDOW_HEIGHT = 5
"        :let g:AUTORESIZE_ANOTHER_WINDOW_WIDTH = 12
"
" 2. Disable script defined autocommands.
"    Script add 1 autocommand to your vim environment.
"    If you want make this autocommand disable,
"    set "g:AUTORESIZE_AUTOCMD_DISABLE" variables to "1".
"
"    example.
"        :let g:AUTORESIZE_AUTOCMD_DISABLE = 1
"
" 3. Run autocommand in specific filetype.
"    If you use this script only in some filetype, add this autocommand to your vimrc.
"
"    example.
"        :let g:AUTORESIZE_AUTOCMD_DISABLE = 1
"        :autocmd WinEnter *.txt :AutoWindowResize
"
" 4. Run script on your action
"    If you run this script with some your action (for example, push F4),
"    add this configuration to your vimrc.
"
"    example.
"        :let g:AUTORESIZE_AUTOCMD_DISABLE = 1
"        :nmap <F4> :AutoWindowResize<CR>
"
" Limitation
" ----------
" 1. This script will run only on 2 window. Vim run on 3 splitted window,
"    on 4 splitted window, or on 1 window then, this script is not running.
"
" Note
" ----
" 1. Should see ":help window-moving", ":help window-resize".
"
"

" loaded check
:if exists('loaded_autoresize')
    :finish
:endif
:let loaded_autoresize = 1

" config values
:if !exists('g:AUTORESIZE_ANOTHER_WINDOW_HEIGHT')
  :let g:AUTORESIZE_ANOTHER_WINDOW_HEIGHT = 5
:endif
:if !exists('g:AUTORESIZE_ANOTHER_WINDOW_WIDTH')
  :let g:AUTORESIZE_ANOTHER_WINDOW_WIDTH = 12
:endif

" autocmd
:if !exists('g:AUTORESIZE_AUTOCMD_DISABLE')
  :autocmd WinEnter * :silent call s:AutoWindowResize()
:endif

" command
:command! -nargs=0 AutoWindowResize :silent call s:AutoWindowResize()

" const values
:let s:VERTICAL_SPLIT = 1
:let s:HORIZONTAL_SPLIT = 2
:let s:NIL = 0

" user setting values
:let s:user_winheight = &winheight
:let s:user_winwidth  = &winwidth

" check user window state,
" and update window size if window count is 2
:function s:AutoWindowResize()
  echo "call WinEnter"
  " check not update or not update window size
  "
  " anyone who know how to escape "diff mode" ?
  " if you know how, please tell me.
  :if &foldmethod == "diff"
    :call s:ResetEnvironment()
    :return
  :endif
  :if winnr("$") != 2
    :call s:ResetEnvironment()
    :return
  :endif

  " vertical or horizontal
  :let s:vertical_or_horizontal = s:NIL

  :let s:win1_height = winheight(1)
  :let s:win2_height = winheight(2)
  :let s:win1_width  = winwidth(1)
  :let s:win2_width  = winwidth(2)

  :if s:win1_height != s:win2_height
    :let s:vertical_or_horizontal = s:HORIZONTAL_SPLIT
  :endif
  :if s:win1_width != s:win2_width
    :let s:vertical_or_horizontal = s:VERTICAL_SPLIT
  :endif

  :if s:vertical_or_horizontal == s:NIL
    :if s:win1_height + s:win2_height < &columns
      :let s:vertical_or_horizontal = s:HORIZONTAL_SPLIT
    :endif
    :if s:win1_width + s:win2_width < &lines
      :let s:vertical_or_horizontal = s:VERTICAL_SPLIT
    :endif
  :endif

  " update window size
  :call s:UpdateWindowSize(s:vertical_or_horizontal)
  :unlet s:vertical_or_horizontal
  :unlet s:win1_height
  :unlet s:win2_height
  :unlet s:win1_width
  :unlet s:win2_width
:endfunction

" update window size
:function s:UpdateWindowSize(type)
  :if a:type == s:HORIZONTAL_SPLIT
    :let &winheight = &lines - &cmdheight - 1 - g:AUTORESIZE_ANOTHER_WINDOW_HEIGHT
    :let &winwidth  = s:user_winwidth
  :endif
  :if a:type == s:VERTICAL_SPLIT
    :let &winheight = s:user_winheight
    :let &winwidth  = &columns - 1 - g:AUTORESIZE_ANOTHER_WINDOW_WIDTH
  :endif
:endfunction

" reset window state
:function s:ResetEnvironment()
  :let &winheight = s:user_winheight
  :let &winwidth  = s:user_winwidth
:endfunction
