onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib user_led_opt

do {wave.do}

view wave
view structure
view signals

do {user_led.udo}

run -all

quit -force
