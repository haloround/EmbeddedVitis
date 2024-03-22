onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib gpio_mio_interrupt_opt

do {wave.do}

view wave
view structure
view signals

do {gpio_mio_interrupt.udo}

run -all

quit -force
