@ECHO OFF

echo READ the readme.md!!!

For /f "tokens=2-4 delims=/ " %%a in ('date /t') do (set mydate=%%c-%%a-%%b)
For /f "tokens=1-2 delims=/:" %%a in ("%TIME%") do (set mytime=%%a-%%b)


echo A ping test start on DATE: %mydate% TIME: %mytime% 
echo A ping test start on DATE: %mydate% TIME: %mytime% > ping_result_%ComputerName%_%mydate%_%mytime%.txt

for /f "usebackq tokens=1-4 delims=," %%a in ("list.csv") do (
echo ping to %%a Server
echo ping to %%a DNS Server >> ping_result_%ComputerName%_%mydate%_%mytime%.txt
ping %%b -n 5 >> ping_result_%ComputerName%_%mydate%_%mytime%.txt
echo. >> ping_result_%ComputerName%_%mydate%_%mytime%.txt
echo ====================================================================== >> ping_result_%ComputerName%_%mydate%_%mytime%.txt
echo ====================================================================== >> ping_result_%ComputerName%_%mydate%_%mytime%.txt
echo. >> ping_result_%ComputerName%_%mydate%_%mytime%.txt)

For /f "tokens=1-2 delims=/:" %%a in ("%TIME%") do (set mytime2=%%a-%%b)
echo A ping test end on DATE: %mydate% TIME: %mytime2% 
echo A ping test end on DATE: %mydate% TIME: %mytime2% >> ping_result_%ComputerName%_%mydate%_%mytime%.txt
