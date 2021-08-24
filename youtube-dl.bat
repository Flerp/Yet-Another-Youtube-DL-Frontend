@echo off

:pythoncheck
python -V > "%configpath%\pythonver.txt"
set /p pythonver=<"%configpath%\pythonver.txt"
if "%pythonver%"=="" goto pythonmissing
del "%configpath%\pythonver.txt"
goto update

:update
cls
Echo Checking for youtube -dl updates
pip install --upgrade youtube-dl

:createconfigdir
if EXIST "%appdatae%\YTDL\" goto configpathset
mkdir "%appdata%\YTDL"
goto configpathset

:configpathset
set configpath=%appdata%\YTDL
goto configcheck

:configcheck
IF EXIST "%configpath%\ytdl_config.txt" goto pulldlpath
goto defaultpath

:defaultpath
set dlpath=%userprofile%\Downloads
goto ffmpegcheck

:pulldlpath
set /p dlpath1=<"%configpath%\ytdl_config.txt"
set dlpath=%dlpath1:~0,-1%
goto ffmpegcheck

:ffmpegcheck
ffmpeg -version > "%configpath%\ffmpegver.txt"
set /p ffmpegver=<"%configpath%\ffmpegver.txt"
if "%ffmpegver%"=="" goto ffmpegmissing
del "%configpath%\ffmpegver.txt"
goto menu

:pythonmissing
cls 
echo ===================================================
echo =                 Python Missing                  =
echo = Please install Python and run this script again =
echo ===================================================
echo Press any key to exit
pause >nul
exit

:ffmpegmissing
cls 
echo =============================================================================
echo =                              FFMPEG Missing                               =
echo = Please place ffmpeg.exe in your PATH or in the same folder as this script =
echo =============================================================================
echo Press any key to exit
pause >nul
exit

:menu
cls
echo ============================================
echo =                                          =
echo =  Current Download Directory              =
echo =  %dlpath%
echo =                                          =
echo = 1. Download via URL                      =
echo =                                          =
echo = 2. Update Channels From URL List         =
echo =                                          =
echo = 3. Change Download Directory             =
echo =                                          =
echo = 4. Edit URL List                         =
echo =                                          =
echo =                                          =
echo = 5. Exit                                  =
echo =                                          =
echo ============================================
CHOICE /N /C:12345 /M "Enter Corresponding Menu choice (1, 2, 3, 4, 5)"
IF ERRORLEVEL ==5 exit
IF ERRORLEVEL ==4 GOTO editurllist
IF ERRORLEVEL ==3 GOTO setdlpath
IF ERRORLEVEL ==2 GOTO updateurls
IF ERRORLEVEL ==1 GOTO setsingleurl

:setsingleurl
cls
set /p yturl="Enter Youtube URL: "
goto downloadsingleurl

:downloadsingleurl
youtube-dl.exe -i -o "%dlpath%\%%(uploader)s\%%(upload_date)s - %%(title)s.%%(ext)s" --ignore-config --hls-prefer-native -f "bestvideo+bestaudio/best" --download-archive %configpath%\downloaded_videos_list.txt "%yturl%"
cls 
echo ========================================
echo =               Done!                  =
echo =   Press any key to return to menu    =
echo ========================================
pause >nul
goto menu

:updateurls
youtube-dl.exe -i -o "%dlpath%\%%(uploader)s\%%(upload_date)s - %%(title)s.%%(ext)s" --ignore-config --hls-prefer-native -f "bestvideo+bestaudio/best" --download-archive %configpath%\downloaded_videos_list.txt -a "%configpath%\urls.txt"
goto updatedone 

:updatedone
cls
echo ========================================
echo =               Done!                  =
echo =   Press any key to return to menu    =
echo ========================================
pause >nul
goto menu

:editurllist
IF EXIST "%configpath%\urls.txt" (notepad "%configpath%\urls.txt") else goto createurllist
goto menu

:createurllist
echo Place each URL on a new line (And delete this line) > "%configpath%\urls.txt"
goto editurllist



:setdlpath
cls
set /p dlpath="Enter Download Directory (Current: %dlpath%): "
echo %dlpath% > "%configpath%\ytdl_config.txt"
goto menu