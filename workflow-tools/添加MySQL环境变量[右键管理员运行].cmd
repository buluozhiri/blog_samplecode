@echo off
set regpath=HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Environment
set setupdir=c:\Tools\mysql_winx64
rem LPY
echo.
echo ************************************************************
echo *                                                          *
echo *                   MySQL ϵͳ������������                 *
echo *                                                          *
echo ************************************************************
echo.
echo === ׼�����û�������: PATH=%setupdir%\bin
echo === ע��: PATH��׷������ǰ��,
echo.
set /P EN=��ȷ�Ϻ� �س��� ��ʼ����!
echo.
echo.
echo.
echo.
echo === ��׷�ӻ�������(׷�ӵ���ǰ��) PATH=%setupdir%\bin
for /f "tokens=1,* delims=:" %%a in ('reg QUERY "%regpath%" /v "path"') do (
    set "L=%%a"
    set "P=%%b"
)
set "Y=%L:~-1%:%P%"

setx path "%setupdir%\bin;%Y%" -m
echo.
echo.
echo === �밴������˳�! 
pause>nul