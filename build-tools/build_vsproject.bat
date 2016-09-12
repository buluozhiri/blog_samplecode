@echo off
echo ****************************************
echo            auto build vs project
echo                         
echo                 for wd visual studio by qingqing.zhao@foxmail.com
echo ****************************************
title build visual studio project
color 0a
rem link:http://blog.csdn.net/edcvf3/article/details/10136347
rem ʹ�÷�����1.��bat���ں�Դ����ͬ����Ŀ¼,�������޸�·�� 2.ִ��bat
rem update 2016-09-12  best way to use msbuild
cd %~dp0 
echo project path %~dp0

rem hh�������ȡСʱ���ܳ��ֿո������(�賿1�㵽����9��%time:~0,2%������ֿո�)
set h=%time:~0,2% 
set hh=%h: =0%
set log_file=%~dp0\release_files\buildlog_%DATE:~0,4%%DATE:~5,2%%DATE:~8,2%%hh%%time:~3,2%.log
set save_path=%~dp0\release_files\

set ylwd_sln=%~dp0\ylwd\ylwd.sln
set ylwd_files=%~dp0\ylwd\ylwd\bin\Release\ylwd.exe

set fileUpdate_sln=%~dp0\fileUpdate\fileUpdate.sln
set fileUpdate_files=%~dp0\fileUpdate\fileUpdate\bin\Release\fileUpdate.exe

rem this project don't create sln,use csproj
set launcher_sln=%~dp0\Lanucher_WinForm\Lanucher_WinForm.csproj
set launcher_files=%~dp0\Lanucher_WinForm\bin\Release\YlLaunch.exe


set uninst_sln=%~dp0\uninst\uninst.sln
set uninst_files=%~dp0\uninst\uninst\bin\Release\uninst.exe

rem please update visual studio install path
cd /d c:\Program Files (x86)\Microsoft Visual Studio 14.0\Common7\IDE\
rem document https://msdn.microsoft.com/zh-cn/library/xee0c8y7.aspx
rem �÷���devenv [��������ļ� | ��Ŀ�ļ� | �����ļ�.��չ��] [����]

echo.
echo *** start build ......***

devenv %ylwd_sln% /Rebuild Release /project "ylwd\ylwd.csproj" /projectconfig Release /Out %log_file% 
copy %ylwd_files% %save_path%\ylwd_test.exe
echo copy %ylwd_files% to %save_path%\ylwd_test.exe
 
devenv %fileUpdate_sln% /Rebuild Release /project "fileUpdate\fileUpdate.csproj" /projectconfig Release /Out %log_file% 
copy %fileUpdate_files% %save_path%\fileUpdate_test.exe
echo copy %fileUpdate_files% to %save_path%\fileUpdate_test.exe

devenv %launcher_sln% /Rebuild Release /project "Lanucher_WinForm.csproj" /projectconfig Release /Out %log_file% 
copy %launcher_files% %save_path%\YlLaunch_test.exe
echo copy %launcher_files% to %save_path%\YlLaunch_test.exe

devenv %uninst_sln% /Rebuild Release /project "uninst\uninst.csproj" /projectconfig Release /Out %log_file% 
copy %uninst_files% %save_path%\uninst_test.exe
echo copy %uninst_files% to %save_path%\uninst_test.exe

echo ***************************************
echo              auto build complete!
echo ***************************************
echo.

pause                                                                                                                            