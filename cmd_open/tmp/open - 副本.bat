@echo off



setlocal

set p1=%1
set p2=%2
set mpath=

echo p1 : %p1%
echo p2 : %p2%


rem 参数个数
set argnum=0
for %%a in (%*) do set /a argnum+=1

echo argnum: %argnum%

set file=%cd%
set select=0
set isfile=0

rem 文件路径

if %argnum% == 1 (
	set mpath=%p1%
)

if %argnum% == 2 (
	set mpath=%p2%
)


echo mpath: %mpath%

if "%mpath%" == "" (echo "~~~~~~~~~") else (


	echo -----------



	echo "%mpath:~0,1%"
	echo "%mpath:~1,1%"


	if "%mpath:~0,1%" == "/" (
		set file=%mpath%
	) else if "%mpath:~1,1%" == ":" (
		set file=%mpath%
	) else (
		set file=%file%/%mpath%
	)

)


echo -----------

rem 是否是选择文件
if "%p1%"=="-R" (set select=1)

rem 路径是否是文件类型
rem set d=
rem for %%a in (%file%) do set "b=%%~aa"
rem if not "%d%" == "" (
rem if %b:~0,1%==d (set isfile=0 ) else ( set isfile=1) )


rem cd /d %file% && (echo test 是文件夹) else echo test 是文件


echo file: %file%
echo select: %select%
echo isfile: %isfile%

rem if %select% == 0 and  %isfile% == 1 (

rem ) else (
	
rem )

::if %argnum% == 0  (Explorer.exe /e, %cd%)
::if %argnum% == 1 if %1 == "-R"  (Explorer.exe /select , %cd%)

rem if %select% == 0 if %isfile% == 1 (
rem %file%
rem ) else (
rem 	echo 55555
rem 	if %select% == 0 (
rem 		Explorer.exe /e, %file%
rem 	) else (
rem 		echo %file%
rem 		Explorer.exe /select , %file%
rem 	)
rem )

set p1=<nul
set p2=<nul
set argnum=<nul
set mpath=<nul
set file=<nul
set select=<nul
set isfile=<nul
set tmp=<nul



::Explorer.exe /e, %cd%
::Explorer.exe /e,/root, %cd%
::Explorer.exe /select , %cd%


echo ==============
endlocal