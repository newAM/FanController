## Contents
- [Introduction](#intro)
- [Background](#bg)
    - [IR Data Formats](#dataformat)
    - [Types of IR Remotes](#remotetypes)
        - [Types of IR Remotes](#singlecommand)
        - [All at Once Remotes](#allatonce)
- [Reading IR Commands](#readingircommands)
- [Determining the Protocol](#protocol)

<a name='intro'/>
## Introduction

This is not a full guide to reverse engineering IR remote controls.  This guide outlines the process I went through to create this controller, and provides some guidance on adapting it for your application.

<a name='bg'/>
## Background

This guide will not go into the very basics behind IR communication, check out [this guide](http://www.learn.sparkfun.com/tutorials/ir-communication) by SparkFun to get the basics of IR communication.

<a name='dataformat'/>
### IR Data Formats

There's a few different types of data formats for IR remote controls, and a few common carrier frequencies. The most common carrier frequency for IR remotes is 38kHz, it is usually a good idea to start there.

[This document](http://www.vishay.com/docs/80071/dataform.pdf) by VISHAY covers the data formats and carrier frequencies that you are likely to come across when reverse engineering an IR remote control.

<a name='remotetypes'/>
### Types of IR Remotes

There are two common types of IR remotes, single command remotes and all at once remotes

<a name='singlecommand'/>
#### Single Command Remotes

Most remotes are single command remotes that send an 8-bit value to send up to 256 unique commands.  These remotes typically do not store the device state on the remote (e.g. A TV remote does not store the volume level of the TV), they simply indicate to the device to change its current state (e.g. increasing the volume on the TV). 

<a name='allatonce'/>
#### All at Once Remotes

All at once remotes store the device state on the remote, and send the desired device state to be set.  For example, an all at once TV remote would store the volume level and instead of telling the TV to increase or decrease the volume it would send an absolute number (e.g. set the volume to 50%) to the TV.

The codes are significantly longer because they send all of states all at once, in one command.  For the fan I am using this includes the mode, the timer, the speed, the oscillation state, and the power.

All at once remotes are most commonly used for air conditioners, and fire places, but it turns out that my fan uses this type of remote too.  The giveaway was that it had a LCD that showed the fan state; this was confirmed by setting a timer with the buttons physically located on the fan, and then setting a timer using the remote.  Whatever state was stored on the fan would be reset with the value stored on the remote.

<a name='readingircommands'/>
## Reading IR Commands

Starting with a Raspberry Pi 3 wire up a 38kHz receiver (e.g. the [VISHAY TSSP58038](http://www.vishay.com/docs/82479/tssp58038.pdf)) with pin 1 connected to GPIO 23 (pin 16) on the pi, pin 2 connected to ground, and pin 3 connected to 3.3V.  I used a [Pi cobbler breakout](http://www.adafruit.com/product/2029) to make the wiring easier.

Now that the pi is wired up it's time for some code.  I wrote a small python script below that checks for a state change on the IR receiver then prints the state, and the duration of the state in μs.

```python
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
```

To use this on your pi you need to download the script, add executable permissions, and run it.

```
wget https://raw.githubusercontent.com/newAM/FanController/master/FanController_Guide/irReceive.py
wget https://raw.githubusercontent.com/newAM/FanController/master/FanController_Guide/irReceiveNEC.py
chmod +x irReceive.py
./irReceive.py
```

When the power button on my fan remote is pressed I get an output similar to this, but much longer.  The first 1 is insignificant because that is the time from running the script to pressing the button on my remote. '1' represents the default state of the IR receiver when nothing is received, and '0' represents the active state when the receiver is being send a 38kHz square wave from the remote.

```
1 2634145
0 9390
1 4862
0 537
1 590
0 540
1 588
0 542
1 587
0 541
1 1682
0 539
1 591
0 540
1 601
0 538
1 590
0 540
1 1702
0 539
1 589
0 542
```

Referencing [VISHAY's IR data formats data sheet](http://www.vishay.com/docs/80071/dataform.pdf) from before it is clear that the fan remote uses the NEC code because the leader code consists of a 9000μs burst followed by a 4500μs pause.

<a name='protocol'/>
## Determining the Protocol

Now that the data format is determined the previous script can be improved to print the formatted code from the remote.

The for each bit NEC code first sends a burst portion followed by a gap.  The burst is always a constant 578.6μs, and the length of the following gap represents the bit.  A '0' is represented with a 1125μs pulse distance, and a '1' with a 2250μs pulse distance.  Using this I can improve the program to simply print the bits in each code.

```python
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
```

The program now prints the raw codes in binary.  I tested every state on the remote to determine what buttons controlled which bits, and compiled them below, showing which bits changed.

```
power
0001000000100000001100000100001101010000000000000110000001110011 off
0001000100100000001100000100001101010000000000000110000001110010 on
-------*------------------------------------------------------**

speed
0001000100100000001100000100001101010000000000000110000001110010 eco
0001000100100000001100000100000001010000000000000110000001110001 low
0001000100100000001100000100000101010000000000000110000001110000 med
0001000100100000001100000100001001010000000000000110000001110011 high
------------------------------**------------------------------**

sleep timer
0001000100100000001100000100001101010000000000000110000001110010 0h
0001000100100001001100000100001101010000000000000110000001110011 0.5h
0001000100100010001100000100001101010000000000000110000001110000 1h
0001000100100011001100000100001101010000000000000110000001110001 1.5h
0001000100100100001100000100001101010000000000000110000001110110 2h
0001000100100101001100000100001101010000000000000110000001110111 2.5h
0001000100100110001100000100001101010000000000000110000001110100 3h
0001000100100111001100000100001101010000000000000110000001110101 3.5h
0001000100101000001100000100001101010000000000000110000001111010 4h
0001000100101001001100000100001101010000000000000110000001111011 4.5h
0001000100101010001100000100001101010000000000000110000001111000 5h
0001000100101011001100000100001101010000000000000110000001111001 5.5h
0001000100101100001100000100001101010000000000000110000001111110 6h
0001000100101101001100000100001101010000000000000110000001111111 6.5h
0001000100101110001100000100001101010000000000000110000001111100 7h
0001000100101111001100000100001101010000000000000110000001111101 7.5h
------------****--------------------------------------------****

oscillation
0001000100100000001100000100001101010000000000000110000001110010 off
0001000100100000001100010100001101010000000000000110000001110011 on
-----------------------*---------------------------------------*

mode
0001000100100000001100000100001101010000000000000110000001110010 reg
0001000100100000001100000100001101010001000000000110000001110011 wind
0001000100100000001100000100001101010010000000000110000001110000 sleep
--------------------------------------**----------------------**
```

In total 14 bits change to control every state on the fan.  1 bit each for power and oscillation, 2 bits each for the mode and speed, and 4 bits for the timer.  At the end of each IR code there are also 4 bits changing each time.  This is a simple CRC code which is just the XOR sum of the power, oscillation, mode, speed, and timer bits.