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
    run "chrome.exe"
    return

; Control+Alt+W launches Nozbe
^!w::
    run "%userprofile%\AppData\Local\Programs\Nozbe\Nozbe.exe"
    return

; Disable mouse scroll
^WheelDown::return
^WheelUp::return
#MaxHotkeysPerInterval 1000