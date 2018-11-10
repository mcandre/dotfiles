; Create shortcut in %APPDATA%\Roaming\Microsoft\Windows\Start Menu\Programs\Startup

; Control+Alt+T launches Console2
^!t::
    SetWorkingDir %userprofile%
    run "C:\Program Files\ConEmu\ConEmu64.exe"
    return

; Control+Alt+E launches Emacs
^!e::
    run runemacs.exe
    return

; Control+Alt+G launches a Web Browser
^!g::
    run "C:\Program Files\Mozilla Firefox\firefox.exe"
    return

; Control+Alt+S launches Steam
^!s::
    run steam.exe
    return

; Control+Alt+W launches Todoist
^!w::
    run cmd /c "start todoist:"
    return

; ; Invert mouse scroll
; WheelUp::
;     send {WheelDown}
;     return
; WheelDown::
;     send {WheelUp}
;     return
