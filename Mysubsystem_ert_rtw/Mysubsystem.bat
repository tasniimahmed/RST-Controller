set MATLAB=F:\3rd-CSE\R2018a

cd .

if "%1"=="" ("F:\3rd-CSE\R2018a\bin\win64\gmake"  -f Mysubsystem.mk all) else ("F:\3rd-CSE\R2018a\bin\win64\gmake"  -f Mysubsystem.mk %1)
@if errorlevel 1 goto error_exit

exit /B 0

:error_exit
echo The make command returned an error of %errorlevel%
An_error_occurred_during_the_call_to_make
