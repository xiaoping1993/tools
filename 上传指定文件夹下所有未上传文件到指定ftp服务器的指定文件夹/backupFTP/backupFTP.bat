rem ��ָ���ļ����������ϴε������ڼ����������ļ���ͨ��������־��¼�ϴ��ϴ�����ʱ�䣩�ϴ���FTP������ָ���ļ���
rem Ҫ���ݵ��ļ���
set bak_webFile=C:\Users\wangj01052\Desktop\test
rem ftp��Ϣ��ip��username,password��
set bak_ftpServer=192.168.56.101 226
set bak_ftpUserName=Administrator
set bak_ftpUserPass=!@34QWer
rem ָ��ftp��Ŀ���ļ���
set ftpFolder=/test
rem ������ַ�����������ļ���Ŀ¼�ļ���·��
set baseFolder=C:\Users\wangj01052\Desktop\backupFTP

rem �õ��ϴ��ϴ�����ʱ��
set uploadLastTime=0000/00/00 00:00:00
for /f "delims=��"  %%i in (%baseFolder%\tempLog.txt) do set uploadLastTime=%%i
cd %bak_webFile%

rem ����ftp�����ļ�
echo open %bak_ftpServer% >%baseFolder%\ftp.up
echo %bak_ftpUserName%>>%baseFolder%\ftp.up
echo %bak_ftpUserPass%>>%baseFolder%\ftp.up
echo bin >>%baseFolder%\%baseFolder%\ftp.up
echo mkdir %ftpFolder% >>%baseFolder%\ftp.up
echo cd %ftpFolder% >>%baseFolder%\ftp.up
for /r %%s in (,*) do (if "%uploadLastTime%" lss "%%~ts"  (echo put "%%s">>%baseFolder%\ftp.up) )

echo bye >>%baseFolder%\ftp.up

cd %baseFolder%
echo %date:~0,4%/%date:~5,2%/%date:~8,2% %time:~0,2%:%time:~3,2%:%time:~6,2%����ʼ�ϴ�ʱ��>tempLog.txt
copy/y log.txt+tempLog.txt
FTP -s:%baseFolder%\ftp.up -i
cd %baseFolder%
echo %date:~0,4%/%date:~5,2%/%date:~8,2% %time:~0,2%:%time:~3,2%:%time:~6,2%�������ϴ�ʱ��>tempLog.txt
copy/y log.txt+tempLog.txt
del ftp.up /q
::pause