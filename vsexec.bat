:: Execute the specified command within a Visual Studio context,
:: where the necessary environment variables are sufficiently configured.
::
:: Usage: vsexec.bat <command>
::
:: Requires a Command Prompt or PowerShell context to operate.

call "C:\\Program Files (x86)\Microsoft Visual Studio\2017\BuildTools\VC\Auxiliary\Build\vcvarsall.bat" amd64
%*
