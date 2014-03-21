' Animated turn signal program
' Tyler Anderson
' Pins:
' Input 4 = Blinkers
' Input 3 = Lights
' 

symbol delay = 100

' Animation
symbol a0  = %10000000
symbol a1  = %11000000
symbol a2  = %11100000
symbol a3  = %01110000
symbol a4  = %00111000
symbol a5  = %00011100
symbol a6  = %00001110
symbol a7  = %00000111
symbol a8  = %00000011
symbol a9  = %00000001
symbol a10 = %00000000

setup:
	let dirsc = %00111111
	if pin3 = 0 then static
	if pin3 = 1 then animate
	
static:
	' Turn on all LEDs and enter infinite loop
	let outpins = %11111111
	let pinsc = %11111111
	sloop:
	goto sloop
	
animate:
	' Make sure everything is off first
	let pinsc = %00000000
	' Wait for the blinkers to be activated then play animation
	aloop:
	if pin4 = 0 then aloop 
	let b0 = a0
	gosub update
	let b0 = a1
	gosub update
	let b0 = a2
	gosub update
	let b0 = a3
	gosub update
	let b0 = a4
	gosub update
	let b0 = a5
	gosub update
	let b0 = a6
	gosub update
	let b0 = a7
	gosub update
	let b0 = a8
	gosub update
	let b0 = a9
	gosub update
	let b0 = a10
	gosub update
	goto aloop
	
update:
	' Update LEDs with frame loaded in B0
	' Shift right to match PortC pins
	let b1 = b0 / 8
	let pinsc = b1
	let outpins = b0
	pause delay
	return


