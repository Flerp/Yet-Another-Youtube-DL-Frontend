@echo off
setlocal ENABLEDELAYEDEXPANSION
set vidx=0

:pythoncheck
ffmpeg -version > "%configpath%\pythonver.txt"
set /p pythonver=<"%configpath%\pythonver.txt"
if "%pythonver%"=="" goto pythonmissing
del "%configpath%\pythonver.txt"
goto update

:update
cls
Echo Checking for Updates
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
IF ERRORLEVEL ==2 GOTO updateurlsvar
IF ERRORLEVEL ==1 GOTO setsingleurl

:setsingleurl
cls
set /p yturl="Enter Youtube URL: "
goto downloadsingleurl

:downloadsingleurl
youtube-dl.exe -i -o "%dlpath%\%%(uploader)s\%%(title)s-%%(upload_date)s.%%(ext)s" --ignore-config --hls-prefer-native -f "bestvideo+bestaudio/best" --download-archive %configpath%\downloaded_videos_list.txt "%yturl%"
cls 
echo ========================================
echo =               Done!                  =
echo ========================================
pause >nul
goto menu

:updateurlsvar
for /F "tokens=*" %%A in (%configpath%\urls.txt) do (
    SET /A vidx=!vidx! + 1
    set url!vidx!=%%A
)
set url
cls 
goto updateurls

:updateurls
::Holy shit this is gross don't look at this
if "%url1%"=="" goto updatedone
youtube-dl.exe -i -o "%dlpath%\%%(uploader)s\%%(title)s-%%(upload_date)s.%%(ext)s" --ignore-config --hls-prefer-native -f "bestvideo+bestaudio/best" --download-archive %configpath%\downloaded_videos_list.txt "%url1%"
if "%url2%"=="" goto updatedone
youtube-dl.exe -i -o "%dlpath%\%%(uploader)s\%%(title)s-%%(upload_date)s.%%(ext)s" --ignore-config --hls-prefer-native -f "bestvideo+bestaudio/best" --download-archive %configpath%\downloaded_videos_list.txt "%url2%"
if "%url3%"=="" goto updatedone
youtube-dl.exe -i -o "%dlpath%\%%(uploader)s\%%(title)s-%%(upload_date)s.%%(ext)s" --ignore-config --hls-prefer-native -f "bestvideo+bestaudio/best" --download-archive %configpath%\downloaded_videos_list.txt "%url3%"
if "%url4%"=="" goto updatedone
youtube-dl.exe -i -o "%dlpath%\%%(uploader)s\%%(title)s-%%(upload_date)s.%%(ext)s" --ignore-config --hls-prefer-native -f "bestvideo+bestaudio/best" --download-archive %configpath%\downloaded_videos_list.txt "%url4%"
if "%url5%"=="" goto updatedone
youtube-dl.exe -i -o "%dlpath%\%%(uploader)s\%%(title)s-%%(upload_date)s.%%(ext)s" --ignore-config --hls-prefer-native -f "bestvideo+bestaudio/best" --download-archive %configpath%\downloaded_videos_list.txt "%url5%"
if "%url6%"=="" goto updatedone
youtube-dl.exe -i -o "%dlpath%\%%(uploader)s\%%(title)s-%%(upload_date)s.%%(ext)s" --ignore-config --hls-prefer-native -f "bestvideo+bestaudio/best" --download-archive %configpath%\downloaded_videos_list.txt "%url6%"
if "%url7%"=="" goto updatedone
youtube-dl.exe -i -o "%dlpath%\%%(uploader)s\%%(title)s-%%(upload_date)s.%%(ext)s" --ignore-config --hls-prefer-native -f "bestvideo+bestaudio/best" --download-archive %configpath%\downloaded_videos_list.txt "%url7%"
if "%url8%"=="" goto updatedone
youtube-dl.exe -i -o "%dlpath%\%%(uploader)s\%%(title)s-%%(upload_date)s.%%(ext)s" --ignore-config --hls-prefer-native -f "bestvideo+bestaudio/best" --download-archive %configpath%\downloaded_videos_list.txt "%url8%"
if "%url9%"=="" goto updatedone
youtube-dl.exe -i -o "%dlpath%\%%(uploader)s\%%(title)s-%%(upload_date)s.%%(ext)s" --ignore-config --hls-prefer-native -f "bestvideo+bestaudio/best" --download-archive %configpath%\downloaded_videos_list.txt "%url9%"
if "%url10%"=="" goto updatedone
youtube-dl.exe -i -o "%dlpath%\%%(uploader)s\%%(title)s-%%(upload_date)s.%%(ext)s" --ignore-config --hls-prefer-native -f "bestvideo+bestaudio/best" --download-archive %configpath%\downloaded_videos_list.txt "%url10%"
if "%url11%"=="" goto updatedone
youtube-dl.exe -i -o "%dlpath%\%%(uploader)s\%%(title)s-%%(upload_date)s.%%(ext)s" --ignore-config --hls-prefer-native -f "bestvideo+bestaudio/best" --download-archive %configpath%\downloaded_videos_list.txt "%url11%"
if "%url12%"=="" goto updatedone
youtube-dl.exe -i -o "%dlpath%\%%(uploader)s\%%(title)s-%%(upload_date)s.%%(ext)s" --ignore-config --hls-prefer-native -f "bestvideo+bestaudio/best" --download-archive %configpath%\downloaded_videos_list.txt "%url12%"
if "%url13%"=="" goto updatedone
youtube-dl.exe -i -o "%dlpath%\%%(uploader)s\%%(title)s-%%(upload_date)s.%%(ext)s" --ignore-config --hls-prefer-native -f "bestvideo+bestaudio/best" --download-archive %configpath%\downloaded_videos_list.txt "%url13%"
if "%url14%"=="" goto updatedone
youtube-dl.exe -i -o "%dlpath%\%%(uploader)s\%%(title)s-%%(upload_date)s.%%(ext)s" --ignore-config --hls-prefer-native -f "bestvideo+bestaudio/best" --download-archive %configpath%\downloaded_videos_list.txt "%url14%"
if "%url15%"=="" goto updatedone
youtube-dl.exe -i -o "%dlpath%\%%(uploader)s\%%(title)s-%%(upload_date)s.%%(ext)s" --ignore-config --hls-prefer-native -f "bestvideo+bestaudio/best" --download-archive %configpath%\downloaded_videos_list.txt "%url15%"
if "%url16%"=="" goto updatedone
youtube-dl.exe -i -o "%dlpath%\%%(uploader)s\%%(title)s-%%(upload_date)s.%%(ext)s" --ignore-config --hls-prefer-native -f "bestvideo+bestaudio/best" --download-archive %configpath%\downloaded_videos_list.txt "%url16%"
if "%url17%"=="" goto updatedone
youtube-dl.exe -i -o "%dlpath%\%%(uploader)s\%%(title)s-%%(upload_date)s.%%(ext)s" --ignore-config --hls-prefer-native -f "bestvideo+bestaudio/best" --download-archive %configpath%\downloaded_videos_list.txt "%url17%"
if "%url18%"=="" goto updatedone
youtube-dl.exe -i -o "%dlpath%\%%(uploader)s\%%(title)s-%%(upload_date)s.%%(ext)s" --ignore-config --hls-prefer-native -f "bestvideo+bestaudio/best" --download-archive %configpath%\downloaded_videos_list.txt "%url18%"
if "%url19%"=="" goto updatedone
youtube-dl.exe -i -o "%dlpath%\%%(uploader)s\%%(title)s-%%(upload_date)s.%%(ext)s" --ignore-config --hls-prefer-native -f "bestvideo+bestaudio/best" --download-archive %configpath%\downloaded_videos_list.txt "%url19%"
if "%url20%"=="" goto updatedone
youtube-dl.exe -i -o "%dlpath%\%%(uploader)s\%%(title)s-%%(upload_date)s.%%(ext)s" --ignore-config --hls-prefer-native -f "bestvideo+bestaudio/best" --download-archive %configpath%\downloaded_videos_list.txt "%url20%"
if "%url21%"=="" goto updatedone
youtube-dl.exe -i -o "%dlpath%\%%(uploader)s\%%(title)s-%%(upload_date)s.%%(ext)s" --ignore-config --hls-prefer-native -f "bestvideo+bestaudio/best" --download-archive %configpath%\downloaded_videos_list.txt "%url21%"
if "%url22%"=="" goto updatedone
youtube-dl.exe -i -o "%dlpath%\%%(uploader)s\%%(title)s-%%(upload_date)s.%%(ext)s" --ignore-config --hls-prefer-native -f "bestvideo+bestaudio/best" --download-archive %configpath%\downloaded_videos_list.txt "%url22%"
if "%url23%"=="" goto updatedone
youtube-dl.exe -i -o "%dlpath%\%%(uploader)s\%%(title)s-%%(upload_date)s.%%(ext)s" --ignore-config --hls-prefer-native -f "bestvideo+bestaudio/best" --download-archive %configpath%\downloaded_videos_list.txt "%url23%"
if "%url24%"=="" goto updatedone
youtube-dl.exe -i -o "%dlpath%\%%(uploader)s\%%(title)s-%%(upload_date)s.%%(ext)s" --ignore-config --hls-prefer-native -f "bestvideo+bestaudio/best" --download-archive %configpath%\downloaded_videos_list.txt "%url24%"
if "%url25%"=="" goto updatedone
youtube-dl.exe -i -o "%dlpath%\%%(uploader)s\%%(title)s-%%(upload_date)s.%%(ext)s" --ignore-config --hls-prefer-native -f "bestvideo+bestaudio/best" --download-archive %configpath%\downloaded_videos_list.txt "%url25%"
if "%url26%"=="" goto updatedone
youtube-dl.exe -i -o "%dlpath%\%%(uploader)s\%%(title)s-%%(upload_date)s.%%(ext)s" --ignore-config --hls-prefer-native -f "bestvideo+bestaudio/best" --download-archive %configpath%\downloaded_videos_list.txt "%url26%"
if "%url27%"=="" goto updatedone
youtube-dl.exe -i -o "%dlpath%\%%(uploader)s\%%(title)s-%%(upload_date)s.%%(ext)s" --ignore-config --hls-prefer-native -f "bestvideo+bestaudio/best" --download-archive %configpath%\downloaded_videos_list.txt "%url27%"
if "%url28%"=="" goto updatedone
youtube-dl.exe -i -o "%dlpath%\%%(uploader)s\%%(title)s-%%(upload_date)s.%%(ext)s" --ignore-config --hls-prefer-native -f "bestvideo+bestaudio/best" --download-archive %configpath%\downloaded_videos_list.txt "%url28%"
if "%url29%"=="" goto updatedone
youtube-dl.exe -i -o "%dlpath%\%%(uploader)s\%%(title)s-%%(upload_date)s.%%(ext)s" --ignore-config --hls-prefer-native -f "bestvideo+bestaudio/best" --download-archive %configpath%\downloaded_videos_list.txt "%url29%"
if "%url30%"=="" goto updatedone
youtube-dl.exe -i -o "%dlpath%\%%(uploader)s\%%(title)s-%%(upload_date)s.%%(ext)s" --ignore-config --hls-prefer-native -f "bestvideo+bestaudio/best" --download-archive %configpath%\downloaded_videos_list.txt "%url30%"
if "%url31%"=="" goto updatedone
youtube-dl.exe -i -o "%dlpath%\%%(uploader)s\%%(title)s-%%(upload_date)s.%%(ext)s" --ignore-config --hls-prefer-native -f "bestvideo+bestaudio/best" --download-archive %configpath%\downloaded_videos_list.txt "%url31%"
if "%url32%"=="" goto updatedone
youtube-dl.exe -i -o "%dlpath%\%%(uploader)s\%%(title)s-%%(upload_date)s.%%(ext)s" --ignore-config --hls-prefer-native -f "bestvideo+bestaudio/best" --download-archive %configpath%\downloaded_videos_list.txt "%url32%"
if "%url33%"=="" goto updatedone
youtube-dl.exe -i -o "%dlpath%\%%(uploader)s\%%(title)s-%%(upload_date)s.%%(ext)s" --ignore-config --hls-prefer-native -f "bestvideo+bestaudio/best" --download-archive %configpath%\downloaded_videos_list.txt "%url33%"
if "%url34%"=="" goto updatedone
youtube-dl.exe -i -o "%dlpath%\%%(uploader)s\%%(title)s-%%(upload_date)s.%%(ext)s" --ignore-config --hls-prefer-native -f "bestvideo+bestaudio/best" --download-archive %configpath%\downloaded_videos_list.txt "%url34%"
if "%url35%"=="" goto updatedone
youtube-dl.exe -i -o "%dlpath%\%%(uploader)s\%%(title)s-%%(upload_date)s.%%(ext)s" --ignore-config --hls-prefer-native -f "bestvideo+bestaudio/best" --download-archive %configpath%\downloaded_videos_list.txt "%url35%"
if "%url36%"=="" goto updatedone
youtube-dl.exe -i -o "%dlpath%\%%(uploader)s\%%(title)s-%%(upload_date)s.%%(ext)s" --ignore-config --hls-prefer-native -f "bestvideo+bestaudio/best" --download-archive %configpath%\downloaded_videos_list.txt "%url36%"
if "%url37%"=="" goto updatedone
youtube-dl.exe -i -o "%dlpath%\%%(uploader)s\%%(title)s-%%(upload_date)s.%%(ext)s" --ignore-config --hls-prefer-native -f "bestvideo+bestaudio/best" --download-archive %configpath%\downloaded_videos_list.txt "%url37%"
if "%url38%"=="" goto updatedone
youtube-dl.exe -i -o "%dlpath%\%%(uploader)s\%%(title)s-%%(upload_date)s.%%(ext)s" --ignore-config --hls-prefer-native -f "bestvideo+bestaudio/best" --download-archive %configpath%\downloaded_videos_list.txt "%url38%"
if "%url39%"=="" goto updatedone
youtube-dl.exe -i -o "%dlpath%\%%(uploader)s\%%(title)s-%%(upload_date)s.%%(ext)s" --ignore-config --hls-prefer-native -f "bestvideo+bestaudio/best" --download-archive %configpath%\downloaded_videos_list.txt "%url39%"
if "%url40%"=="" goto updatedone
youtube-dl.exe -i -o "%dlpath%\%%(uploader)s\%%(title)s-%%(upload_date)s.%%(ext)s" --ignore-config --hls-prefer-native -f "bestvideo+bestaudio/best" --download-archive %configpath%\downloaded_videos_list.txt "%url40%"
if "%url41%"=="" goto updatedone
youtube-dl.exe -i -o "%dlpath%\%%(uploader)s\%%(title)s-%%(upload_date)s.%%(ext)s" --ignore-config --hls-prefer-native -f "bestvideo+bestaudio/best" --download-archive %configpath%\downloaded_videos_list.txt "%url41%"
if "%url42%"=="" goto updatedone
youtube-dl.exe -i -o "%dlpath%\%%(uploader)s\%%(title)s-%%(upload_date)s.%%(ext)s" --ignore-config --hls-prefer-native -f "bestvideo+bestaudio/best" --download-archive %configpath%\downloaded_videos_list.txt "%url42%"
if "%url43%"=="" goto updatedone
youtube-dl.exe -i -o "%dlpath%\%%(uploader)s\%%(title)s-%%(upload_date)s.%%(ext)s" --ignore-config --hls-prefer-native -f "bestvideo+bestaudio/best" --download-archive %configpath%\downloaded_videos_list.txt "%url43%"
if "%url44%"=="" goto updatedone
youtube-dl.exe -i -o "%dlpath%\%%(uploader)s\%%(title)s-%%(upload_date)s.%%(ext)s" --ignore-config --hls-prefer-native -f "bestvideo+bestaudio/best" --download-archive %configpath%\downloaded_videos_list.txt "%url44%"
if "%url45%"=="" goto updatedone
youtube-dl.exe -i -o "%dlpath%\%%(uploader)s\%%(title)s-%%(upload_date)s.%%(ext)s" --ignore-config --hls-prefer-native -f "bestvideo+bestaudio/best" --download-archive %configpath%\downloaded_videos_list.txt "%url45%"
if "%url46%"=="" goto updatedone
youtube-dl.exe -i -o "%dlpath%\%%(uploader)s\%%(title)s-%%(upload_date)s.%%(ext)s" --ignore-config --hls-prefer-native -f "bestvideo+bestaudio/best" --download-archive %configpath%\downloaded_videos_list.txt "%url46%"
if "%url47%"=="" goto updatedone
youtube-dl.exe -i -o "%dlpath%\%%(uploader)s\%%(title)s-%%(upload_date)s.%%(ext)s" --ignore-config --hls-prefer-native -f "bestvideo+bestaudio/best" --download-archive %configpath%\downloaded_videos_list.txt "%url47%"
if "%url48%"=="" goto updatedone
youtube-dl.exe -i -o "%dlpath%\%%(uploader)s\%%(title)s-%%(upload_date)s.%%(ext)s" --ignore-config --hls-prefer-native -f "bestvideo+bestaudio/best" --download-archive %configpath%\downloaded_videos_list.txt "%url48%"
if "%url49%"=="" goto updatedone
youtube-dl.exe -i -o "%dlpath%\%%(uploader)s\%%(title)s-%%(upload_date)s.%%(ext)s" --ignore-config --hls-prefer-native -f "bestvideo+bestaudio/best" --download-archive %configpath%\downloaded_videos_list.txt "%url49%"
if "%url50%"=="" goto updatedone
youtube-dl.exe -i -o "%dlpath%\%%(uploader)s\%%(title)s-%%(upload_date)s.%%(ext)s" --ignore-config --hls-prefer-native -f "bestvideo+bestaudio/best" --download-archive %configpath%\downloaded_videos_list.txt "%url50%"
goto updatedone 

:updatedone
cls
echo ========================================
echo =               Done!                  =
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