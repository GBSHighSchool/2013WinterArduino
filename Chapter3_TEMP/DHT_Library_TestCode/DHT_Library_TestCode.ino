#include "DHT.h"

DHT dht;

void setup()
{
  Serial.begin(9600);
  //Serial.println();
  //Serial.println("Status\tHumidity (%)\tTemperature (C)\t(F)");

  dht.setup(4); // data pin 4
}

void loop()
{
  delay(dht.getMinimumSamplingPeriod());

  float humidity = dht.getHumidity();
  float temperature = dht.getTemperature();

  //Serial.print(dht.getStatusString());
  //Serial.print("\t");
  Serial.print(humidity, 1);
  //Serial.print("\t\t");
  Serial.print(" ");
  Serial.println(temperature, 1);
  //Serial.print("\t\t");
  //Serial.println(dht.toFahrenheit(temperature), 1);
}

