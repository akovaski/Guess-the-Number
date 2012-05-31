MXMLC = mxmlc
PLAYER = flashplayer
FLIXEL = ~/as-files/Flixel/
SRC = src/
MAIN = src/guessthenumber.as
SWF = guessthenumber.swf
OPTIONS = -static-link-runtime-shared-libraries -defaults-css-url src/Default.css

$(SWF) : $(SRC)
	@ echo "Compiling..."
	@ $(MXMLC) $(OPTIONS) -sp $(FLIXEL) -o $(SWF) -- $(MAIN)

run : $(SWF)
	@ echo "Running..."
	@ $(PLAYER) $(SWF)
