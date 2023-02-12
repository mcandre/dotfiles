; Create shortcut in %APPDATA%\Roaming\Microsoft\Windows\Start Menu\Programs\Startup

; Control+Alt+T launches terminal
^!t::
    run wt.exe
    return

; Control+Alt+E launches text editor
^!e::
    run "%userprofile%\AppData\Local\Programs\Microsoft VS Code\code.exe"
    return

; Control+Alt+G launches a Web Browser
^!g::
    run "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe"
    return

; Control+Alt+S launches Steam
^!s::
    run steam.exe
    return

; Control+Alt+W launches Microsoft To Do
^!w::
    run powershell.exe -Command Start-Process -WindowStyle Hidden "ms-to-do:"
    return

; Disable mouse scroll
^WheelDown::return
^WheelUp::return
#MaxHotkeysPerInterval 1000