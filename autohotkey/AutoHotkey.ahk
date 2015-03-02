; Create shortcut in C:\Users\%USERNAME%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup

; Control+Alt+T launches Console2
^!t::
  run console.exe
  return

; Control+Alt+E launches Emacs
^!e::
  run runemacs.exe
  return

; Control+Alt+G launches Google Chrome
^!g::
  run chrome.exe
  return

; Control+Alt+S launches Steam
^!s::
  run steam.exe
  return

; Control+Alt+W launches Wunderlist
^!w::
  run wunderlist.exe
  return
