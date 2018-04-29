#!/usr/bin/env python

import time
import sys
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

# constants
leaderTime = 4000
highTime = 1000

while True:

  # read GPIO
  state = GPIO.input(irReceiver)

  # check for state transition
  if state != prevState:

    # time since last transition in us
    endTime = time.time()
    totalTime = (endTime - startTime) * 1000000

    # compare high states
    if prevState == 1:
      # check if leader code or determine bit
      if totalTime > leaderTime:
        sys.stdout.write('\n')
      elif totalTime > highTime:
        sys.stdout.write('1')
      else:
        sys.stdout.write('0')

    sys.stdout.flush()

    # store previous values
    prevState = state
    startTime = endTime
