rem 将指定文件夹中所有上次到本次期间所有新增文件（通过保留日志记录上次上传结束时间）上传到FTP服务上指定文件夹
rem 要备份的文件夹
set bak_webFile=C:\Users\wangj01052\Desktop\test
rem ftp信息（ip，username,password）
set bak_ftpServer=192.168.56.101 226
set bak_ftpUserName=Administrator
set bak_ftpUserPass=!@34QWer
rem 指定ftp上目标文件夹
set ftpFolder=/test
rem 基础地址：此批处理文件根目录文件夹路径
set baseFolder=C:\Users\wangj01052\Desktop\backupFTP

rem 拿到上次上传结束时间
set uploadLastTime=0000/00/00 00:00:00
for /f "delims=："  %%i in (%baseFolder%\tempLog.txt) do set uploadLastTime=%%i
cd %bak_webFile%

rem 生成ftp命令文件
echo open %bak_ftpServer% >%baseFolder%\ftp.up
echo %bak_ftpUserName%>>%baseFolder%\ftp.up
echo %bak_ftpUserPass%>>%baseFolder%\ftp.up
echo bin >>%baseFolder%\%baseFolder%\ftp.up
echo mkdir %ftpFolder% >>%baseFolder%\ftp.up
echo cd %ftpFolder% >>%baseFolder%\ftp.up
for /r %%s in (,*) do (if "%uploadLastTime%" lss "%%~ts"  (echo put "%%s">>%baseFolder%\ftp.up) )

echo bye >>%baseFolder%\ftp.up

cd %baseFolder%
echo %date:~0,4%/%date:~5,2%/%date:~8,2% %time:~0,2%:%time:~3,2%:%time:~6,2%：开始上传时间>tempLog.txt
copy/y log.txt+tempLog.txt
FTP -s:%baseFolder%\ftp.up -i
cd %baseFolder%
echo %date:~0,4%/%date:~5,2%/%date:~8,2% %time:~0,2%:%time:~3,2%:%time:~6,2%：结束上传时间>tempLog.txt
copy/y log.txt+tempLog.txt
del ftp.up /q
::pause