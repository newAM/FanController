#!/usr/bin/env python

import time
import RPi.GPIO as GPIO

# GPIO 23 is pin 16 on the Raspberry Pi 3
irReceiver = 16

# set GPIO numbering system to board
GPIO.setmode(GPIO.BOARD)

# set irReceiver pin to input
GPIO.setup(irReceiver, GPIO.IN)

# initialize variables
prevState = 1
startTime = time.time()

while True:

  # read GPIO
  state = GPIO.input(irReceiver)

  # check for state transition
  if state != prevState:

    # time since last transition in us
    endTime = time.time()
    totalTime = (endTime - startTime) * 1000000
    
    # print results
    print("%d %d" % (prevState, totalTime))

    # store previous values
    prevState = state
    startTime = endTime