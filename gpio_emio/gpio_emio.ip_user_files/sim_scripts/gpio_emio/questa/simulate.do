onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib gpio_emio_opt

do {wave.do}

view wave
view structure
view signals

do {gpio_emio.udo}

run -all

quit -force
