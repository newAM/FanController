#ifndef SEND_IR_H_
#define SEND_IR_H_

#include <stdint.h>

// hardware configuration
#define LED_PIN  5
#define LED_PORT PORTD
#define LED_MASK (1U << (LED_PIN))

// NEC protocol timing constants
// a burst is a 38kHz 50% duty cycle square wave
// a cycle is one period of the burst
// a bit consists of a burst and a pause
// '1' has a 2250us pulse distance (578.6us burst + 546.4us pause)
// '0' has a 1125us pulse distance (578.6us burst + 1671.4us pause)
#define NEC_LEADER_CYCLES  342 // cycles for the leader pulse (9000us @ 38kHz)
#define NEC_LEADER_PAUSE  4500 // leader pause in us
#define NEC_BURST_CYCLES    22 // cycles per bit burst (578.6us @ 38kHz)
#define NEC_0_PAUSE        546 // duration of pause to represent a 0 in us
#define NEC_1_PAUSE       1671 // duration of pause to represent a 1 in us
#define NEC_WAIT            13 // half period of a cycle in us

// function prototypes
void sendCommand(uint8_t speed, uint8_t mode, uint8_t timer, uint8_t power, uint8_t osc);
void sendByte(uint8_t val, uint8_t length);
void sendBit(bool bit);
void burstNEC(uint16_t cycles);

#endif //SEND_IR_H_
