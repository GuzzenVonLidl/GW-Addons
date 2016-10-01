del /Q *.pbo

for /D %%i in (*.*) do (
	makepbo -NUP %%i GW_%%i.pbo
)
