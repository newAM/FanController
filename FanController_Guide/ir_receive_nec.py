#!/usr/bin/env python

import time
import sys
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

# constants
leader_time = 4000
high_time = 1000

while True:

    # read GPIO
    state = gpio.input(ir_receiver)

    # check for state transition
    if state != prev_state:

        # time since last transition in us
        end_time = time.time()
        total_time = (end_time - start_time) * 1000000

        # compare high states
        if prev_state == 1:
            # check if leader code or determine bit
            if total_time > leader_time:
                sys.stdout.write("\n")
            elif total_time > high_time:
                sys.stdout.write("1")
            else:
                sys.stdout.write("0")

        sys.stdout.flush()

        # store previous values
        prev_state = state
        start_time = end_time
