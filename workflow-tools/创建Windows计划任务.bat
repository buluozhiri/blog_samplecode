@echo ��Ӽƻ�����
rem ��"����SVN.bat"�ʹ�bat����ͬһĿ¼��˫�����ɴ����ƻ�����ÿ��7��00�Զ�ִ�д�bat
SCHTASKS /Create /SC DAILY /ST 07:00:00 /TN "�Զ�����SVN" /TR  "%~sdp0����SVN.bat" /F
pause