#include <SoftwareSerial.h>
SoftwareSerial mySerial(2, 3); // RX, TX
int led = 13; // LED 연결 핀
char chByte = 0; // 블루투스 수신 데이터
String strInput = ""; // 블루투스 수신 버퍼
String strON = "ON"; // LED 켜기 명령
String strOFF = "OFF"; // LED 끄기 명령

void setup() {
  pinMode(led, OUTPUT); // LED 핀 출력으로 설정
  mySerial.begin(9600); // 블루투스 초기화
}

void loop() {
  while (mySerial.available() > 0) { // 데이터가 수신된 경우
    chByte = mySerial.read(); // 데이터 1 바이트 읽기
    if (chByte == '\r') { // 명령어가 끝난 경우
      if(strInput.equals(strON)) { // 켜기 명령인 경우
        digitalWrite(led, HIGH);
      }
      if(strInput.equals(strOFF)) { // 끄기 명령인 경우
        digitalWrite(led, LOW);
      }
      strInput = ""; // 수신 버퍼 비움
    }
    else {
      strInput += chByte; // 문자열 명령어를 수신해서 저장
    }
  }
}
