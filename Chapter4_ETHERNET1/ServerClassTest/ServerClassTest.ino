#include <SPI.h>
#include <Ethernet.h>

// the media access control (ethernet hardware) address for the shield:
byte mac[] = { 0xDE, 0xAD, 0xBE, 0xEF, 0xFE, 0xED };  
//the dns server ip
IPAddress dnsServer(168, 126, 63, 1);

// the router's gateway address:
IPAddress gateway(172, 31, 0, 254);

// the subnet:
IPAddress subnet(255, 255, 0, 0);


//the IP address is dependent on your network
IPAddress ip(172, 31, 1, 93);

void setup()
{
  Serial.begin(9600);
  Ethernet.begin(mac, ip, dnsServer, gateway, subnet);
  Serial.println("Start");
  
}

void loop () {
  Serial.println(Ethernet.localIP());
  Serial.println(Ethernet.subnetMask());
  Serial.println(Ethernet.gatewayIP());
  Serial.println(Ethernet.dnsServerIP());
  Serial.println(Ethernet.maintain());
  
  delay(5000);
  
}
