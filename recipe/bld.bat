cmake -G "NMake Makefiles" ^
  -D CMAKE_BUILD_TYPE=Release ^
  -D CMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
  -D PYTHON_EXECUTABLE=%PYTHON% ^
  -D XEUS_PYTHONHOME_RELPATH=..\\ ^
  %SRC_DIR%
if errorlevel 1 exit 1

nmake
if errorlevel 1 exit 1

nmake install
if errorlevel 1 exit 1

md %LIBRARY_PREFIX%\..\share\jupyter\kernels\xpython
xcopy %LIBRARY_PREFIX%\share\jupyter\kernels\xpython %LIBRARY_PREFIX%\..\share\jupyter\kernels\xpython /F /Y
