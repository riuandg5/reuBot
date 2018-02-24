@echo off
setlocal enabledelayedexpansion
title ChatBone
mode con: cols=60 lines=30
color 0a
set defaultUser=%userName%
:loop
set /p input=%userName%- 
echo %input%|findstr /i "hi hello" >nul && echo Hello human.
echo %input%|findstr /i "thanks thankyou" >nul && echo You are always welcome..
echo %input%|findstr /i /c:"how are you" >nul && echo Everything is fine.. what about you?
echo %input%|findstr /i "fine" >nul && echo Nice..
echo %input%|findstr /i /c:"your name" >nul && echo My name is reuBot.
echo %input%|findstr /i /c:"my name" >nul && echo Your username is %userName%. I think that's your name also..
echo %input%|findstr /i "time" >nul && goto :getTime
echo %input%|findstr /i "date" >nul && goto :getDate
echo %input%|findstr /i "weather" >nul && goto :getWeather
echo %input%|findstr /i "signup" >nul && goto :signup
echo %input%|findstr /i "signin" >nul && goto :signin
echo %input%|findstr /i "signout" >nul && goto :signout
echo %input%|findstr /i "yes ya no nope na" >nul && echo OK..
echo %input%|findstr /i "bye" >nul && (echo Bye human.. See you soon. & pause>nul & exit)
echo.
goto :loop
:getTime
set currentTime=%time: =0%
echo %currentTime:~0,2%hrs %currentTime:~3,2%min
if %currentTime% gtr 05:00 (
	if %currentTime% lss 07:00 (
		echo its early morning..
	) else (
	if %currentTime% lss 10:00 (
		echo its late morning..
	) else (
	if %currentTime% lss 12:00 (
		echo its going to be noon..
	) else (
	if %currentTime% lss 15:00 (
		echo its afternoon..
	) else (
	if %currentTime% lss 17:00 (
		echo its going to be evening..
	) else (
	if %currentTime% lss 20:00 (
		echo its evening..
	) else (
	if %currentTime% lss 24:00 (
		echo its night..
	) else (
	if %currentTime% lss 03:00 (
		echo its midnight..
	) else (
	echo its going to be morning soon.. )
	)))))))
)
echo.
goto :loop
:getDate
set currentDate=%date: =0%
echo %currentDate:~0,3% %currentDate:~7,2%.%currentDate:~4,2%.%currentDate:~10,4%
echo.
goto :loop
:getWeather
echo.
echo Just tell me the place name..
echo.
set /p place=%userName%- 
powershell -Command "(New-Object Net.WebClient).DownloadFile('http://wttr.in/%place%?0?T', 'w.txt')"
set Counter=298
for /f "tokens=* skip=297" %%x in (w.txt) do (
  set "Line!Counter!=%%x"
  set /a Counter+=1
)
findstr /i "smoke" "w.txt">nul && goto :smoke
findstr /i /c:"shower in vicinity" "w.txt">nul && goto :smoke
findstr /i "sunny clear" "w.txt">nul && goto :sunny
findstr /i /c:"partly cloudy" "w.txt">nul && goto :partlyCloudy
findstr /i "cloudy" "w.txt">nul && goto :smoke
findstr /i /c:"patchy rain possible" "w.txt">nul && goto :patchyRainPossible
findstr /i /c:"light rain" "w.txt">nul && goto :lightRain
findstr /i /c:"light snow, mist" "w.txt">nul && goto :lightSnowMist
findstr /i /c:"light snow" "w.txt">nul && goto :lightSnowMist
findstr /i /c:"patchy heavy snow" "w.txt">nul && goto :patchyHeavySnow
findstr /i /c:"light rain shower, mist" "w.txt">nul && goto :patchyRainPossible
findstr /i "haze mist" "w.txt">nul && goto :haze
echo Sorry I am not able to parse data.. Try with another place name.
echo.
del w.txt
goto :loop

:haze
echo.
echo !Line298!
echo.
echo Condition    -  !Line299!
for %%b in (!Line300:~13!) do (
	echo %%b>>wy.txt
)
set /p t=<wy.txt
del wy.txt
echo Temperature  -  !t! degC
echo Wind speed   -  !Line301:~16!
echo Visibility   -  !Line302:~13!
echo Rain         -  !Line303!
echo.
del w.txt
goto :loop

:smoke
echo.
echo !Line298!
echo.
echo Condition    -  !Line299!
for %%b in (!Line300:~9!) do (
	echo %%b>>wy.txt
)
set /p t=<wy.txt
del wy.txt
echo Temperature  -  !t! degC
echo Wind speed   -  !Line301:~16!
echo Visibility   -  !Line302:~13!
echo Rain         -  !Line303!
echo.
del w.txt
goto :loop

:sunny
echo.
echo !Line298!
echo.
echo Condition    -  !Line299:~10!
for %%b in (!Line300:~9!) do (
	echo %%b>>wy.txt
)
set /p t=<wy.txt
del wy.txt
echo Temperature  -  !t! degC
echo Wind speed   -  !Line301:~20!
echo Visibility   -  !Line302:~11!
echo Rain         -  !Line303:~10!
echo.
del w.txt
goto :loop

:partlyCloudy
echo.
echo !Line298!
echo.
echo Condition    -  !Line299:~11!
for %%b in (!Line300:~23!) do (
	echo %%b>>wy.txt
)
set /p t=<wy.txt
del wy.txt
echo Temperature  -  !t! degC
echo Wind speed   -  !Line301:~15!
echo Visibility   -  !Line302:~11!
echo Rain         -  !Line303!
echo.
del w.txt
goto :loop

:lightSnowMist
echo.
echo !Line298!
echo.
echo Condition    -  !Line299:~23!
for %%b in (!Line300:~12!) do (
	echo %%b>>wy.txt
)
set /p t=<wy.txt
del wy.txt
echo Temperature  -  !t! degC
echo Wind speed   -  !Line301:~15!
echo Visibility   -  !Line302:~9!
echo Rain         -  !Line303:~10!
echo.
del w.txt
goto :loop

:patchyHeavySnow
echo.
echo !Line298!
echo.
echo Condition    -  !Line299:~23!
for %%b in (!Line300:~12!) do (
	echo %%b>>wy.txt
)
set /p t=<wy.txt
del wy.txt
echo Temperature  -  !t! degC
echo Wind speed   -  !Line301:~15!
echo Visibility   -  !Line302:~10!
echo Rain         -  !Line303:~11!
echo.
del w.txt
goto :loop

:patchyRainPossible
echo.
echo !Line298!
echo.
echo Condition    -  !Line299:~23!
for %%b in (!Line300:~12!) do (
	echo %%b>>wy.txt
)
set /p t=<wy.txt
del wy.txt
echo Temperature  -  !t! degC
echo Wind speed   -  !Line301:~15!
echo Visibility   -  !Line302:~17!
echo Rain         -  !Line303:~18!
echo.
del w.txt
goto :loop

:lightRain
echo.
echo !Line298!
echo.
echo Condition    -  !Line299:~9!
for %%b in (!Line300:~10!) do (
	echo %%b>>wy.txt
)
set /p t=<wy.txt
del wy.txt
echo Temperature  -  !t! degC
echo Wind speed   -  !Line301:~15!
echo Visibility   -  !Line302:~18!
echo Rain         -  !Line303:~19!
echo.
del w.txt
goto :loop
:signup
echo.
if not %userName%==%defaultUser% (
	echo Signout first then you can signup as new user.
	echo.
	goto :loop
)
if not exist loginData md loginData
cd loginData
@echo bydefault>>.ChatBone
set /p "newUserName=New Username - "
if exist %newUserName%.ChatBone goto :userNameAlreadyRegistered
set /p "newUserPwd=Create Password - "
@echo %newUserPwd%>>%newUserName%.ChatBone
cd ../
echo.
echo %newUserName% is registered as new user.
echo.
goto :loop
:userNameAlreadyRegistered
cd ../
echo.
echo Username already registered.
echo.
echo Please try again with other username.
goto :signup
:signin
echo.
if not %userName%==%defaultUser% (
	echo Signout first then you can signin as other user.
	echo.
	goto :loop
)
if not exist loginData md loginData
cd loginData
@echo bydefault>>.ChatBone
set /p "userName=Username - "
if not exist %userName%.ChatBone goto :userNameNotRegistered
set /p storedPwd=<%userName%.ChatBone
cd ../
set /p "userPwd=Password - "
echo.
if %userPwd%==%storedPwd% goto :loginYes
goto :loginNo
:loginYes
echo Signed in as %userName%.
echo.
goto :loop
:userNameNotRegistered
cd ../
echo.
echo Signin fail. Reason - Username not registered.
echo.
echo Try signing in again or signup as a new user.
set userName=%defaultUser%
echo.
goto :loop
:loginNo
echo Signin fail. Reason - Wrong password for selected username.
echo.
echo Try again!
set userName=%defaultUser%
goto :signin
:signout
if %userName%==%defaultUser% (
	echo You didn't even signed in.
) else (
	set userName=%defaultUser%
	echo Signed out succesfully.
)
echo.
goto :loop
