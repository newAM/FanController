#!/usr/bin/env python

import time
import RPi.GPIO as gpio  # noqa: N813

# GPIO 23 is pin 16 on the Raspberry Pi 3
ir_receiver = 16

# set GPIO numbering system to board
gpio.setmode(gpio.BOARD)

# set ir_receiver pin to input
gpio.setup(ir_receiver, gpio.IN)

# initialize variables
prev_state = 1
start_time = time.time()

while True:

    # read GPIO
    state = gpio.input(ir_receiver)

    # check for state transition
    if state != prev_state:

        # time since last transition in us
        end_time = time.time()
        total_time = (end_time - start_time) * 1000000

        # print results
        print("%d %d" % (prev_state, total_time))

        # store previous values
        prev_state = state
        start_time = end_time
