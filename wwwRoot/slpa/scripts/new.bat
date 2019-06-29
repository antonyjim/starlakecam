@echo off
setlocal enabledelayedexpansion
for /f %%x in ('wmic path win32_localtime get /format:list ^| findstr "="') do set %%x
set today=%Year%-%Month%-%Day%
:start
echo SLPA.info Div generator
echo This utility is made to facilitate the process of adding new elements to the SLPA.info site
echo using the new css file. Please go to slpa.info/howto.html for formats. q to quit.
echo ...........................................................................................
echo .
echo Choose a block type or type pic for Photo gallery or text 775-340-7762 for support.
set /p block=Please choose what type of block you want: 

if %block%==1 goto block1
if %block%==2 goto block2
if %block%==3 goto block3
if %block%==4 goto block4
if %block%==5 goto block5
if %block%==q goto end

goto start

:block1
echo All images must be put in /images/ folder. Paragraphs must be shorter than 8192 characters.
set /p imgsrc=Enter the image name: 
set /p h3=Enter the heading: 
set /p pnum=Number of P: 

for /l %%x in (1, 1, !pnum!) do (
set /p p%%x=Enter paragraph %%x: 
) 

echo ^<div class="block"^>
echo 	^<img src="images/%imgsrc%" id="moon" width="25%"^>

for /l %%a in (1, 1, !pnum!) do (
echo ^<p^>!p%%a!^</p^>
)
echo .
echo ^</div^>
echo ^<!-- %today% --^>
pause

goto end

:block2
echo All images must be put in /images/ folder. Paragraphs are limited to 8192 characters in this utility.
echo Thumbnails will be shown at 80% width of the div.
set /p imgsrc=Enter the main image name: 
set /p ph2=Enter the heading: 
set /p pnum=Enter the number of paragraphs: 
set /p imgnum=Enter the number of images:
set /p divnum=Enter how many images you want per row (2,3,4,6): 

if !divnum!==2 (set divtype=halfimg)
if !divnum!==3 (set divtype=thirdimg) 
if !divnum!==4 (set divtype=quarterimg) 
if !divnum!==6 (set divtype=sixthimg) 

for /l %%x in (1, 1, !pnum!) do (
set /p p%%x=Enter paragraph %%x: 
) 

for /l %%b in (1, 1, !imgnum!) do (
set /p img%%b=Enter smaller image #%%b name: 
set /p cap%%b=Enter smaller image %%b caption: 
)

echo ^<div class="block"^>
echo 	^<img src="images/%imgsrc%"^>
echo 	^<h2^>!ph2!^</h2^>
for /l %%a in (1, 1, !pnum!) do (
echo ^<p^>!p%%a!^</p^>
)

for /l %%c in (1, 1, !imgnum!) do (
echo ^<div class="!divtype!"^>
echo 	^<img src="images/!img%%c!" width="80%" ^>
echo 	^<p^>!cap%%c!^</p^>
echo ^</div^>
)
echo .
echo ^</div^>
echo ^<!-- %today% --^>
pause

goto end

:block3
echo All images must be put in /images/ folder. Paragraphs are limited to 8192 characters in this utility.
echo For this block, images will be floated left of the paragraph relative to the container.
echo First, let's start with the left side of this block:
set /p imgsrc1=Enter the name of the image: 
set /p ph2=Enter the heading:
set /p pnum=How many paragraphs do you want? 

for /l %%x in (1, 1, !pnum!) do (
set /p p%%x=Enter paragraph %%x: 
) 

echo On to the right hand side of the page.
set /p imgsrc2=Enter the name of the image: 
set /p ph22=Enter the heading: 
set /p pnum2=How many paragraphs do you want? 

for /l %%y in (1, 1, !pnum2!) do (
set /p p2%%y=Enter paragraph %%y: 
) 

echo ^<div class="block"^> 
echo 	^<div class="halfimg"^> 
echo 		^<img src="images/!imgsrc1!" id="moon" align="left" width="25%"^> 
echo 		^<h2^>!ph2!^</h2^> 
			for /l %%a in (1, 1, !pnum!) do (
			echo ^<p^>!p%%a!^</p^> 
			)
echo	^</div^>
		
echo 	^<div class="halfimg"^> 
echo 		^<img src="!imgsrc2! id="moon" width="25%"^> 
echo 		^<h2^>ph22^</h2^> 
			for /l %%a in (1, 1, !pnum2!) do (
			echo ^<p^>!p2%%a!^</p^> 
			)
echo 	^</div^> .
echo ^</div^> 
echo ^<!-- %today% --^>
pause

goto end

:block4
echo All images must be put in /images/ folder. Paragraphs are limited to 8192 characters in this utility.
echo Images will be placed in rows of 2, 3, 4 or 6. Captions are optional, press enter to skip a caption.

set /p h2=Please choose a heading: 
set /p imgnum=How many images will we be adding today? 
set /p joke=Are these images cool looking or not very much? 
echo Just kidding. I know they are "unique".
set /p divtype=How many images do you want in a row? (2, 3, 4, 6) 

if !divtype!==2 (set divtype=halfimg)
if !divtype!==3 (set divtype=thirdimg) 
if !divtype!==4 (set divtype=quarterimg) 
if !divtype!==6 (set divtype=sixthimg) 

for /l %%f in (1, 1, !imgnum!) do (
set /p img%%f=Enter Image #%%f name: 
set /p cap%%f=Enter Image %%f caption: 
)

echo ^<div class="block">
for /l %%g in (1, 1, !imgnum!) do (
echo ^<div class="!divtype!"^>
echo ^<img src="/images/!img%%g!" align="center" width="90%" id="moon"^>
echo ^<p^>!cap%%g!^</p^>
echo ^</div^>
)
echo .
echo ^</div^>
echo ^<!-- %today% --^>
pause

goto end

:block5
echo All images must be put in /images/ folder. Paragraphs are limited to 8192 characters in this utility.

set /p h2=Enter your heading:
set /p pnum=How many paragraphs would you like? 

for /l %%x in (1, 1, !pnum!) do (
set /p p%%x=Enter paragraph %%x: 
) 

echo ^<div class="block"^>

for /l %%a in (1, 1, !pnum!) do (
echo ^<p^>!p%%a!^</p^>
)
echo .
echo ^</div^>
echo ^<!-- %today% --^>
pause

goto end

:pic


:end
endlocal
