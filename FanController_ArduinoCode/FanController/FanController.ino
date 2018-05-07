// communications
#include <SPI.h>            // for Ethernet.h
#include <Ethernet.h>       // W5100
#include <PubSubClient.h>   // MQTT

// utility
#include <stdio.h>          // sscanf()
#include <util/delay.h>     // _delay_us

// project files for IR transmission
#include "SendIR.h"

// macro constants
#define TIMEOUT   5000 // connection failure timeout in ms
#define SER_BAUD  9600 // serial port baud rate
#define MQTT_PORT 1883 // MQTT broker port
#define MQTT_CLIENT_ID "bedFan" // MQTT client ID

// MQTT topics
#define TOPIC_BASE  "/home/bedroom/fan"
#define TOPIC_SPEED TOPIC_BASE "/speed"
#define TOPIC_MODE  TOPIC_BASE "/mode"
#define TOPIC_TIMER TOPIC_BASE "/timer"
#define TOPIC_POWER TOPIC_BASE "/power"
#define TOPIC_OSC   TOPIC_BASE "/oscillate"

// client objects
EthernetClient ethClient;
PubSubClient mqttClient(ethClient);

// reconnects to the MQTT broker
void reconnect()
{
    // loop while disconnected
    while (!mqttClient.connected())
    {
        // attempt to connect
        Serial.println("Attempting to establish connection to MQTT broker...");
        if (mqttClient.connect(MQTT_CLIENT_ID)) 
        {
            // print connection messaged for debug
            Serial.println("Connection established");
            mqttClient.publish(TOPIC_BASE, "connected");

            // subscribe to each control topic
            mqttClient.subscribe(TOPIC_SPEED);
            mqttClient.subscribe(TOPIC_MODE);
            mqttClient.subscribe(TOPIC_TIMER);
            mqttClient.subscribe(TOPIC_POWER);
            mqttClient.subscribe(TOPIC_OSC);
        }
        else
        {
            Serial.print("Failed to connect: ");

            // print client state
            switch (mqttClient.state())
            {
                case MQTT_CONNECTION_TIMEOUT:
                    Serial.println("MQTT_CONNECTION_TIMEOUT");
                    break;
                case MQTT_CONNECTION_LOST:
                    Serial.println("MQTT_CONNECTION_LOST");
                    break;
                case MQTT_CONNECT_FAILED:
                    Serial.println("MQTT_CONNECT_FAILED");
                    break;
                case MQTT_DISCONNECTED:
                    Serial.println("MQTT_DISCONNECTED");
                    break;           
                case MQTT_CONNECTED:
                    Serial.println("MQTT_CONNECTED");
                    break;
                case MQTT_CONNECT_BAD_PROTOCOL:
                    Serial.println("MQTT_CONNECT_BAD_PROTOCOL");
                    break;
                case MQTT_CONNECT_BAD_CLIENT_ID:
                    Serial.println("MQTT_CONNECT_BAD_CLIENT_ID");
                    break;
                case MQTT_CONNECT_UNAVAILABLE:
                    Serial.println("MQTT_CONNECT_UNAVAILABLE");
                    break;
                case MQTT_CONNECT_BAD_CREDENTIALS:
                    Serial.println("MQTT_CONNECT_BAD_CREDENTIALS");
                    break;
                case MQTT_CONNECT_UNAUTHORIZED:
                    Serial.println("MQTT_CONNECT_UNAUTHORIZED");
                    break;
                default:
                    Serial.println("MQTT_STATE_UNKNOWN");
                    break;
            }

            // delay before next attempt
            delay(TIMEOUT);
        } 
    }
}

// callback function for handling new messages on subscribed topics
void callback(char* topic, byte* payload, unsigned int length)
{
    // copy payload
    byte* p = (byte*) malloc(length);
    memcpy(p, payload, length);
    payload = "";

    // fan control variables
    static uint8_t speed = 0;
    static uint8_t mode  = 0;
    static uint8_t timer = 0;
    static uint8_t power = 0;
    static uint8_t osc   = 0;

    // set the variables
    if (strcmp(topic, TOPIC_SPEED) == 0)
    {
        speed = atoi(p);
    }
    else if (strcmp(topic, TOPIC_MODE) == 0)
    {
        mode = atoi(p);
    }
    else if (strcmp(topic, TOPIC_TIMER) == 0)
    {
        timer = atoi(p);
    }
    else if (strcmp(topic, TOPIC_POWER) == 0)
    {
        power = atoi(p);
    }
    else if (strcmp(topic, TOPIC_OSC) == 0)
    {
        osc = atoi(p);
    }

    // free memory
    free(p);

    // send IR command
    sendCommand(speed, mode, timer, power, osc);
}

void setup()
{
    // network settings
    uint8_t myMAC[] = {0x88, 0xAA, 0xBB, 0xCC, 0xDE, 0x04}; // device MAC
    IPAddress mqttBroker(10, 0, 0, 4); // MQTT broker IP

    // open serial connection
    Serial.begin(SER_BAUD);

    // print status
    Serial.println("Serial connected!");
    Serial.println("Configuring Ethernet with DHCP...");
    
    // connect with DHCP
    while (!Ethernet.begin(myMAC))
    {
        Serial.println("Failed to configure Ethernet using DHCP");
        delay(TIMEOUT);
    }

    // print IP address
    Serial.println("Ethernet connected!");
    Serial.print("My IP: ");
    Serial.println(Ethernet.localIP());

    // configure MQTT broker
    mqttClient.setServer(mqttBroker, MQTT_PORT);

    // set callback function
    mqttClient.setCallback(callback);

    // set IR LED as output
    pinMode(LED_PIN, OUTPUT);
}

void loop()
{
    // connect if disconnected
    if (!mqttClient.connected())
    {
        reconnect();
    }

    // maintain connection
    mqttClient.loop();
}
