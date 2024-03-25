onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib axi_gpio2_opt

do {wave.do}

view wave
view structure
view signals

do {axi_gpio2.udo}

run -all

quit -force
