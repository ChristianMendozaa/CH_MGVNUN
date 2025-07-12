@echo off
setlocal enabledelayedexpansion

echo 🛠 Normalizando estructura de carpetas en el directorio actual...

for /d %%A in (*) do (
    if not "%%~nxA"==".git" if not "%%~nxA"=="node_modules" if not "%%~nxA"=="__pycache__" if not "%%~nxA"=="scripts" (
        set "outer=%%~fA"
        for /d %%B in ("%%~fA\*") do (
            set "inner=%%~nxB"
            if /I "!inner!"=="%%~nxA" (
                echo Duplicada encontrada: !outer!\!inner!
                move "!outer!\!inner!\*" "!outer!\" >nul
                rmdir "!outer!\!inner!"
            )
        )
    )
)

echo Canciones normalizadas correctamente. Presiona una tecla para salir...
pause >nul
