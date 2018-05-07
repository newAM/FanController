#include "SendIR.h"
#include "Arduino.h"

// sends the fan a command with the given settings
void sendCommand (
    uint8_t speed,  // speed (0-3 valid)
                    // 0 = eco
                    // 1 = low
                    // 2 = med
                    // 3 - high
    uint8_t mode,   // mode  (0-2 valid)
                    // 0 = regular
                    // 1 = windy
                    // 2 = sleepy
    uint8_t timer,  // timer (0-15 valid)
                    // sleep timer in 0.5h increments (0h - 7.5h)
    uint8_t power,  // power (0-1 valid)
                    // 0 = off
                    // 1 = on
    uint8_t osc     // oscillation (0-1 valid)
                    // 0 = off
                    // 1 = on
)
{
    uint8_t crc; // CRC code for the command

    // shift the value of the speed over
    // speed provided as 0-3 = eco,low,med,high
    // the fan uses the order 0-3 = low,med,high,eco
    if (speed != 0)
    {
        speed--;
    }
    else
    {
        speed = 3;
    }

    // calculate the CRC
    crc = speed ^ mode ^ timer ^ power ^ osc;

    // start timing sensitive transmission
    noInterrupts(); // disable interrupts

    // send leader code
    burstNEC(NEC_LEADER_CYCLES);
    _delay_us(NEC_LEADER_PAUSE);

    // send IR command, device specific
    sendByte(B0001000,  7);
    sendByte(power,     1);

    sendByte(B0010,     4);
    sendByte(timer,     4);

    sendByte(B0011000,  7);
    sendByte(osc,       1);

    sendByte(B010000,   6);
    sendByte(speed,     2);

    sendByte(B010100,   6);
    sendByte(mode,      2);

    sendByte(B00000000, 8);
    sendByte(B01100000, 8);
    sendByte(B0111,     4);
    sendByte(crc,       4);

    // trailing pulse
    burstNEC(NEC_BURST_CYCLES);

    interrupts(); // re-enable interrupts
}

// sends an byte over the IR LED, big-endian
void sendByte (
    const uint8_t val, // byte to transmit
    uint8_t length     // bit length of val
)
{
    // iterate over bits in the byte
    while (length)
    {
        // go to next bit
        length--;

        // send the bit value
        sendBit(val & 1U << length);
    }
}

// sends a single bit over the IR LED
// per the NEC protocol one bit consists of:
// a constant 578.6us burst (22 cycles @ 38kHz)
// a pause of  546.4us for a '0' (1125us pulse distance)
// a pause of 1671.4us for a '1' (2250us pulse distance)
void sendBit (
    const bool bit // value of the bit to send
)
{
    // send the constant IR burst
    burstNEC(NEC_BURST_CYCLES);

    // variable pause to represent 1 or 0
    if (bit)
    {
        _delay_us(NEC_1_PAUSE);
    }
    else
    {
        _delay_us(NEC_0_PAUSE);
    }
}

// sends an IR burst with a given length in cycles
void burstNEC (
    uint16_t cycles // number of cycles in the burst
)
{
    while (cycles)
    {
        LED_PORT |= LED_MASK;   // set IR LED high
        _delay_us(NEC_WAIT);    // hold
        LED_PORT &= ~LED_MASK;  // set IR LED low
        _delay_us(NEC_WAIT);    // hold

        cycles--;               // decrement counter
    }
}
