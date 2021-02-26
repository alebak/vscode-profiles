@ECHO OFF
rem
rem		Visual Studio Code Profile
rem		Copyright (C) 2021  Alejandro Arroyave Valencia (@alebak)
rem	
rem		This program is free software: you can redistribute it and\or modify
rem		it under the terms of the GNU General Public License as published by
rem		the Free Software Foundation, either version 3 of the License, or
rem		(at your option) any later version.
rem	
rem		This program is distributed in the hope that it will be useful,
rem		but WITHOUT ANY WARRANTY; without even the implied warranty of
rem		MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
rem		GNU General Public License for more details.
rem	
rem		You should have received a copy of the GNU General Public License
rem		along with this program.  If not, see <https://www.gnu.org\licenses/>.
rem

SET n=^&echo.
SET "t=    "
SET "DIRPROFILE="

IF "%~1" == "" 			GOTO default
IF "%~1" == "--help" 	GOTO help
IF "%~1" == "-h" 		GOTO help
IF "%~1" == "go" 		SET "DIRPROFILE=go" & GOTO go
IF "%~1" == "--go"		SET "DIRPROFILE=go" & GOTO go
IF "%~1" == "js"		SET "DIRPROFILE=fs" & GOTO javascript
IF "%~1" == "--js"		SET "DIRPROFILE=fs" & GOTO javascript
IF "%~1" == "php"		SET "DIRPROFILE=php" & GOTO php
IF "%~1" == "--php"		SET "DIRPROFILE=php" & GOTO php
IF "%~1" == "python"	SET "DIRPROFILE=python" & GOTO python
IF "%~1" == "--python"	SET "DIRPROFILE=python" & GOTO python
IF "%~1" == "ts" 		SET "DIRPROFILE=ts" & GOTO typescript
IF "%~1" == "--ts" 		SET "DIRPROFILE=ts" & GOTO typescript

ECHO The '%~1' profile for Visual Studio Code does not exist.
GOTO exit

:go
	ECHO Visual Studio Code for Go
	GOTO loadprofile

:javascript
	ECHO Visual Studio Code for JavaScript
	GOTO loadprofile

:php
	ECHO Visual Studio Code for PHP
	GOTO loadprofile
	
:python
	ECHO Visual Studio Code for Python
	GOTO loadprofile

:typescript
	ECHO Visual Studio Code for TypeScript
	GOTO loadprofile


:loadprofile
	code --extensions-dir %USERPROFILE%\.vscode-profiles\%DIRPROFILE%\exts --user-data-dir %USERPROFILE%\.vscode-profiles\%DIRPROFILE%\data
	GOTO exit
	
:default 
	code
	GOTO exit
	
:help
	ECHO Visual Studio Code Profile 1.0.0 %n%
	ECHO Usage: vscode.bat [option] %n%
	ECHO If the profile directory does not exist... Relax! Visual Studio Profile creates it for you. &
	ECHO If no option is passed, Visual Studio Code Profile runs Visual Studio with the default user profile. %n%
	ECHO Option &
	ECHO %t%--go, go         %t%%t%Go profile.
	ECHO %t%--js, js         %t%%t%JavaScript profile.
	ECHO %t%--php, php       %t%%t%PHP profile.
	ECHO %t%--python, python %t%%t%Python profile.
	ECHO %t%--ts, ts         %t%%t%TypeScript profile.%n%
	ECHO %t%-h --help        %t%%t%Print usage.
	GOTO exit	

:exit
