@echo off
%1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 ::","","runas",1)(window.close)&&exit
ping /n 1 127.0.0.1 >nul
chcp 936
For /f "tokens=2,*" %%i in ('reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "Desktop"') do Set dt=%%j
mshta vbscript:msgbox("��� ���ȹر���Ҫ�������� Ȼ����ȷ������",6,"�׿�����Ƽ�")(window.close)
ECHO ��������ToolBox�������ļ�...
del %LOCALAPPDATA%\JetBrains\Toolbox\*.vmoptions /s /f /q /aH
del %LOCALAPPDATA%\JetBrains\Toolbox\*.key /s /f /q /aH
ping /n 2 127.0.0.1 >nul
ECHO ��ʼ���ü��������ļ�...
echo f|xcopy /r /c /h /q /s /e /i /y "%~dp0"micool_config\_auto  %windir%
ping /n 2 127.0.0.1 >nul 
ECHO ��ʼ�������...
ping /n 2 127.0.0.1 >nul
ECHO ���ڼ�������2017�汾...
ping /n 2 127.0.0.1 >nul
ECHO ���ڼ�������2018�汾...
ping /n 2 127.0.0.1 >nul
ECHO ���ڼ�������2019�汾...
call echo d|xcopy /r /c /h /q /s /e /y "%~dp0"micool_config\JetBrainsold %HOMEPATH% 2>nul
ping /n 2 127.0.0.1 >nul
ECHO ���ڼ�������2020�汾...
ping /n 2 127.0.0.1 >nul
ECHO ���ڼ�������2021�汾...
ping /n 2 127.0.0.1 >nul
ECHO ���ڼ�������2022�汾...
call echo d|xcopy /r /c /h /q /s /e /y "%~dp0"micool_config\JetBrains %appdata%\JetBrains 2>nul
ping /n 3 127.0.0.1 >nul
@echo off
echo "��ע�����ɱ�������ʾ��һ��Ҫ����"
@echo  ########################################
@xcopy C:\Windows\system32\drivers\etc\hosts C:\Windows\system32\drivers\etc\hosts.bak\ /d /c /i /y 
@echo  ########################################
@echo  hosts�ļ�������ϣ���ʼ�޸�hosts�ļ�
@echo 0.0.0.0 account.jetbrains.com >>C:\Windows\System32\drivers\etc\hosts
@echo 0.0.0.0 oauth.account.jetbrains.com >>C:\Windows\System32\drivers\etc\hosts
@echo 0.0.0.0 jrebel.npegeek.com >>C:\Windows\System32\drivers\etc\hosts
echo   "hosts�ļ��޸����"
@ipconfig /flushdns
@echo   "ˢ��DNS���"
call echo d|xcopy /r /c /h /q /s /e /i /y "%~dp0"micool_config\JetBrainscode" c:\������_���� �����������ʹ�� 2>nul
ECHO ����ɹ���       By���׵�����繤���� �������ǵ��� �����˿�
set msg="��ϲ�Ѿ��ɹ����\n���������Ч\n���δ����ɹ��Ļ�\n��ʹ�ñ��÷�����������Զ�̰�װ"
mshta vbscript:msgbox(Replace(%msg%,"\n",vbCrLf),6,"�׵�����繤����")(window.close)
set msg1="By:�׵�����繤����\n�������ǵ��� �����˿�\n\n������ͼ����������������"
mshta vbscript:msgbox(Replace(%msg1%,"\n",vbCrLf),6,"�׿�����Ƽ�")(window.close)
pauses