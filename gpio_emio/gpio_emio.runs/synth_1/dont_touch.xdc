# This file is automatically generated.
# It contains project source information necessary for synthesis and implementation.

# XDC: new/pin.xdc

# Block Designs: bd/gpio_emio/gpio_emio.bd
set_property KEEP_HIERARCHY SOFT [get_cells -hier -filter {REF_NAME==gpio_emio || ORIG_REF_NAME==gpio_emio} -quiet] -quiet

# IP: bd/gpio_emio/ip/gpio_emio_processing_system7_0_1/gpio_emio_processing_system7_0_1.xci
set_property KEEP_HIERARCHY SOFT [get_cells -hier -filter {REF_NAME==gpio_emio_processing_system7_0_1 || ORIG_REF_NAME==gpio_emio_processing_system7_0_1} -quiet] -quiet

# XDC: d:/EmbeddedVitis/gpio_emio/gpio_emio.gen/sources_1/bd/gpio_emio/ip/gpio_emio_processing_system7_0_1/gpio_emio_processing_system7_0_1.xdc
set_property KEEP_HIERARCHY SOFT [get_cells [split [join [get_cells -hier -filter {REF_NAME==gpio_emio_processing_system7_0_1 || ORIG_REF_NAME==gpio_emio_processing_system7_0_1} -quiet] {/inst } ]/inst ] -quiet] -quiet

# XDC: d:/EmbeddedVitis/gpio_emio/gpio_emio.gen/sources_1/bd/gpio_emio/gpio_emio_ooc.xdc