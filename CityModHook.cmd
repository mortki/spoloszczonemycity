@echo off
cd C:\Users\%username%\AppData\Roaming
mkdir $citymodhook
cd $citymodhook
mode 54,15
color E

title MyCity -- CityModHook
echo x=msgbox("Something creating errors ;c. You playing this game too wrong!", 0+16, "MyCity ERROR") > error.vbs
echo x=msgbox("Spolszczone przez 7F7 Mortus_#6523", 0+0, "MyCity INFO") > info.vbs
 
set housePrice=250
set apartmentPrice=850
set villaPrice=1250
:: Put Mod Vars BELOW!



goto startup
	
:game
	echo %cash% > cash.ini
	echo %level% > level.ini
	echo %citizens% > citizens.ini
	echo %countH% > houses.ini
	echo %countA% > apartments.ini
	echo %countV% > villas.ini

	if %uiTheme%==Default color 07
	if %uiTheme%==Dark color 0E
	if %uiTheme%==Light color 70

	cls
	echo +---------------------  MyCity  ---------------------+
	echo CASH: %cash%  -  LEVEL: %level%
	echo HOUSES: %countH%  -  VILLAS: %countV%
	echo APARTMENS: %countA%  -  CITIZENS: %citizens%
	echo +----------------------------------------------------+
	echo.
	echo + CityModHook Version v2.1
	echo + CityModHook from 10MAY NEVER get update/hotfix
	echo 1 - Budowanie
	echo 2 - Zatrudnienie
	echo 3 - Pracuj
	echo.
	echo 4 - Exit And Save
	set /p SelectGame= 
	if %SelectGame%==1 goto BuildMode
	if %SelectGame%==2 goto HireMode
	if %SelectGame%==3 goto WorkMode
	if %SelectGame%==4 goto Exit
	goto error

:BuildMode
    cls
    echo 1 - Zbuduj dom (250zl)
    echo 2 - Zbuduj apartament (850zl)
    echo 3 - Zbuduje wille (1250zl)
    echo 4 - Exit build mode
    set /p SelectBuild= 
    if %SelectBuild%==1 goto BuildHouse
    if %SelectBuild%==2 goto BuildApartment
    if %SelectBuild%==3 goto BuildVilla
    if %SelectBuild%==4 goto game
    goto error

:HireMode
	cls
	echo 1 - Hire Police man
	echo 2 - Hire Firefighter
	echo 3 - Hire Paramedic
	echo 4 - Hire Emergency call operator
	echo 5 - Exit hire mode
	set /p SelectHire= 
	if %SelectHire%==1 goto HirePolice
	if %SelectHire%==2 goto HireFire
	if %SelectHire%==3 goto HireMedic
	if %SelectHire%==4 goto HireOperator
	if %SelectHire%==5 goto game
	goto error

:WorkMode
	cls
	echo 1 - Pracuj w mcdonald`s
	echo 2 - Okradnij bankomat
	echo 3 - Pracuj w dyspozytorni
	echo 4 - Wyjdz z trybu pracowania
	set /p SelectWork= 
	if %SelectWork%==1 goto MCDonalds
	if %SelectWork%==2 goto ATM
	if %SelectWork%==3 goto Operator
	if %SelectWork%==4 goto game
	goto error



:BuildHouse
	cls
	echo Building house... (wait 3 sec)
	ping -n 3 localhost > nul
	set /a cash=cash-housePrice
	set /a countH=countH+1
	set /a citizens=citizens+4
	echo Dom wybudowany!
	echo Liczba domow %countH%
	echo Stan konta %cash%
	goto game

:BuildApartment
	cls
	echo Building apartment... (wait 5 sec)
	ping -n 5 localhost > nul
	set /a cash=cash-apartmentPrice
	set /a countA=countA+1
	set /a citizens=citizens+28
	echo Apartament wybudowany!
	echo Liczba apartamentow %countH%
	echo Stan konta %cash%
	goto game

:BuildVilla
	cls
	echo Building villa... (wait 8 sec)
	ping -n 8 localhost > nul
	set /a cash=cash-villaPrice
	set /a countV=countV+1
	set /a citizens=citizens+58
	echo Willa wybudowana!
	echo Twoje wille %countH%
	echo Stan konta %cash%
	goto game



:HirePolice
	cls
	set /a timeout=(%random% %%18)
	if timeout==0 goto HirePolice
	echo Szukanie policjanta... (wait %timeout% sec)
	ping -n %timeout% localhost > nul
	
	set /a citizens=citizens+1
	echo Znaleziono nowego policjanta!
	ping -n 3 localhost > nul
	goto game

:HireFire
	cls
	set /a timeout=(%random% %%24)
	if timeout==0 goto HireFire
	echo Szukanie strazaka... (wait %timeout% sec)
	ping -n %timeout% localhost > nul
	
	set /a citizens=citizens+1
	echo Znaleziono nowego strazaka!
	ping -n 3 localhost > nul
	goto game

:HireMedic
	cls
	set /a timeout=(%random% %%28)
	if timeout==0 goto HireMedic
	echo Szukanie medyka... (wait %timeout% sec)
	ping -n %timeout% localhost > nul
	
	set /a citizens=citizens+1
	echo Znaleziono nowego medyka!
	ping -n 3 localhost > nul
	goto game

:HireOperator
	cls
	set /a timeout=(%random% %%30)
	if timeout==0 goto HireOperator
	echo Szukanie dyspozytora... (wait %timeout% sec)
	ping -n %timeout% localhost > nul
	
	set /a citizens=citizens+1
	echo Znaleziono nowego dyspozytora!
	ping -n 3 localhost > nul
	goto game



:MCDonalds
	cls
	if MCDONALDS==0 goto McDonalds
	echo Pracowanie w mcDonald's... (wait 8 sec)
	ping -n 8 localhost > nul
	
	set /a earnedCash=(%random% %%80)
	if earnedCash==0 goto MCDonalds
	set /a cash=cash+earnedCash
	echo Zarobiles %earnedCash%!
	ping -n 3 localhost > nul
	goto game

:Operator
	cls
	echo Szukanie osoby potrzebujacej pomocy... (wait 8 sec)
	ping -n 8 localhost > nul

	set /a roll=(%random% %%3)
	if roll==0 goto Operator
	if roll==1 goto OperatorCALL1
	if roll==2 goto OperatorCALL2
	if roll==3 goto OperatorCALL3

		:OperatorCALL1
		cls
		echo [Dzwoniacy] Pomocy! Moj kot utknol na drzewie! 
		echo Wyslij odpowiednie sluzby 
		echo 1 - Policja
		echo 2 - Straz
		echo 3 - Ambulans
		echo 4 - Laweta
		set /p OperatorOption= 
		if %OperatorOption%==1 goto OperatorPOLICEF
		if %OperatorOption%==2 goto OperatorFIREFIGHTER
		if %OperatorOption%==3 goto OperatorPARAMEDICF
		if %OperatorOption%==4 goto OperatorTOWTRUCKF
		goto error

		:OperatorCALL2
		cls
		echo [Dzwoniacy] Pomocy! Porwali mnie! 
		echo Wyslij odpowiednie sluzby
		echo 1 - Policja
		echo 2 - Straz
		echo 3 - Ambulans
		echo 4 - Laweta
		set /p OperatorOption= 
		if %OperatorOption%==1 goto OperatorPOLICE
		if %OperatorOption%==2 goto OperatorFIREFIGHTERF
		if %OperatorOption%==3 goto OperatorPARAMEDICF
		if %OperatorOption%==4 goto OperatorTOWTRUCKF
		goto error

		:OperatorCALL3
		cls
		echo [Caller] Ktos zablokowal moje auto mozesz mi pomoc??
		echo Send the appropriate unit
		echo 1 - Policja
		echo 2 - Straz
		echo 3 - Ambulans
		echo 4 - Laweta
		set /p OperatorOption= 
		if %OperatorOption%==1 goto OperatorPOLICEF
		if %OperatorOption%==2 goto OperatorFIREFIGHTERF
		if %OperatorOption%==3 goto OperatorPSSARAMEDICF
		if %OperatorOption%==4 goto OperatorTOWTRUCK
		goto error
			
			:OperatorPOLICE
			echo [Dyspozytor] Policja jest na drodze! (wait 8 sec)
			ping -n 8 localhost > nul

			set /a earnedCash=(%random% %%300)
			if earnedCash==0 goto OperatorPOLICE
			set /a cash=cash+earnedCash
			echo Zarobiles %earnedCash%!
			ping -n 3 localhost > nul
			goto game

			:OperatorPOLICEF
			echo [Operator] Police unit on way (wait 8 sec)
			ping -n 8 localhost > nul

			set /a lostCash=(%random% %%300)
			if lostCash==0 goto OperatorPOLICEF
			set /a cash=cash-lostCash
			echo You lost %lostCash%!
			ping -n 3 localhost > nul
			goto game



			:OperatorFIREFIGHTER
			echo [Operator] Firefighter unit on way (wait 8 sec)
			ping -n 8 localhost > nul

			set /a earnedCash=(%random% %%300)
			if earnedCash==0 goto OperatorFIREFIGHTER
			set /a cash=cash+earnedCash
			echo You earned %earnedCash%!
			ping -n 3 localhost > nul
			goto game

			:OperatorFIREFIGHTERF
			echo [Operator] Firefighter unit on way (wait 8 sec)
			ping -n 8 localhost > nul

			set /a lostCash=(%random% %%300)
			if lostCash==0 goto OperatorFIREFIGHTERF
			set /a cash=cash-lostCash
			echo You lost %lostCash%!
			ping -n 3 localhost > nul
			goto game



			:OperatorPARAMEDIC
			echo [Operator] Paramedic unit on way (wait 8 sec)
			ping -n 8 localhost > nul

			set /a earnedCash=(%random% %%300)
			if earnedCash==0 goto OperatorPARAMEDIC
			set /a cash=cash+earnedCash
			echo You earned %earnedCash%!
			ping -n 3 localhost > nul
			goto game

			:OperatorPARAMEDICF
			echo [Operator] Paramedic unit on way (wait 8 sec)
			ping -n 8 localhost > nul

			set /a lostCash=(%random% %%300)
			if lostCash==0 goto OperatorPARAMEDICF
			set /a cash=cash-lostCash
			echo You lost %lostCash%!
			ping -n 3 localhost > nul
			goto game



			:OperatorTOWTRUCK
			echo [Operator] Towtruck unit on way (wait 8 sec)
			ping -n 8 localhost > nul

			set /a earnedCash=(%random% %%300)
			if earnedCash==0 goto OperatorTOWTRUCK
			set /a cash=cash+earnedCash
			echo You earned %earnedCash%!
			ping -n 3 localhost > nul
			goto game

			:OperatorTOWTRUCKF
			echo [Operator] Towtruck unit on way (wait 8 sec)
			ping -n 8 localhost > nul

			set /a lostCash=(%random% %%300)
			if lostCash==0 goto OperatorTOWTRUCKF
			set /a cash=cash-lostCash
			echo You lost %lostCash%!
			ping -n 3 localhost > nul
			goto game

:ATM
	cls
	if ATM==0 goto ATM
	echo Robbing atm... (wait 18 sec)
	ping -n 18 localhost > nul
	
	set /a roll=(%random% %%2)
	if roll==0 goto ATM
	if roll==1 goto ATMOK
	if roll==2 goto ATMBAD

		:ATMOK
		set /a earnedCash=(%random% %%300)
		if earnedCash==0 goto ATMOK
		set /a cash=cash+earnedCash
		echo You earned %earnedCash%!
		ping -n 3 localhost > nul
		goto game
		
		:ATMBAD
		set /a lostCash=(%random% %%600)
		if lostCash==0 goto ATMBAD
		set /a cash=cash+lostCash
		echo You lost %lostCash%!
		ping -n 3 localhost > nul
		goto game
		


:LottoMode
	cls
	echo Not in citymodhook ;c - But you can create mod for lotto c;
	timeout 10 >>nul
	goto game

:CreateSave
	echo Dark > .uiTheme

	cls
	echo Enter your player name
	set /p "plrName=>> "
	
	cls
	echo Enter your city name
	set /p "cityName=>> "
	
	echo %plrName% > .player
	echo %cityName% > .city
	
	echo 250 > cash.ini
	echo 1 > level.ini
	echo 0 > citizens.ini
	
	echo 0 > houses.ini
	echo 0 > apartments.ini
	echo 0 > villas.ini
	goto LoadSave

:LoadSave
	for /f "Delims=" %%a in (.uiTheme) do (
	set uiTheme=%%a
	)
	echo %uiTheme%

	for /f "Delims=" %%a in (.player) do (
	set plrName=%%a
	)
	echo %plrName%
	
	for /f "Delims=" %%a in (.city) do (
	set cityName=%%a
	)
	echo %cityName%
	
	for /f "Delims=" %%a in (cash.ini) do (
	set cash=%%a
	)
	echo %cash%
	
	for /f "Delims=" %%a in (level.ini) do (
	set level=%%a
	)
	echo %level%
	
	for /f "Delims=" %%a in (citizens.ini) do (
	set citizens=%%a
	)
	echo %citizens%
	
	for /f "Delims=" %%a in (houses.ini) do (
	set countH=%%a
	)
	echo %countH%
	
	for /f "Delims=" %%a in (apartments.ini) do (
	set countA=%%a
	)
	echo %countA%
	
	for /f "Delims=" %%a in (villas.ini) do (
	set countV=%%a
	)
	echo %countV%
	
	goto game
	
:startup
start info.vbs

	cls
    echo +---------------------  MyCity  ---------------------+
	echo.
	echo.
	echo.
	echo 1 - Play on new save
	echo 2 - Load last save
		set /p SelectStartup= 
		if %SelectStartup%==1 goto CreateSave
		if %SelectStartup%==2 goto LoadSave
		goto error

:error
	start error.vbs
	exit

:Exit
echo %cash% > cash.ini
echo %level% > level.ini
echo %citizens% > citizens.ini

echo %countH% > houses.ini
echo %countA% > apartments.ini
echo %countV% > villas.ini
exit

:: MyCity Made By niqu_#9728
:: CityModHook Made By niqu_#9728