/* For this code, I used and edited Maxpromer’s code in Github. To see the original work, go to here: https://github.com/ioxhop/Arduino-RFID-Unlock-PC/blob/master/RFIDLogin_Arduino/RFIDLogin.ino */

#include <SPI.h>
#include <MFRC522.h>

#define SS_PIN 10
#define RST_PIN 9
#define SP_PIN 8
#define LED_PIN A0

MFRC522 rfid(SS_PIN, RST_PIN);
MFRC522::MIFARE_Key key;

void setup() {
  Serial.begin(9600);
  SPI.begin();
  rfid.PCD_Init();
  pinMode(LED_PIN, OUTPUT);
}

void loop() {
  if (!rfid.PICC_IsNewCardPresent() || !rfid.PICC_ReadCardSerial())
    return;
  MFRC522::PICC_Type piccType = rfid.PICC_GetType(rfid.uid.sak);
}

  String strID = "";
  for (byte i = 0; i < 4; i++) {
    strID +=
    (rfid.uid.uidByte[i] < 0x10 ? "0" : "") +
    String(rfid.uid.uidByte[i], HEX) +
    (i!=3 ? ":" : "");
  }
  strID.toUpperCase();
  
  Serial.print("Tap card key: ");
  Serial.println(strID);

 //TEST LED (Optional: I added LED lamp in my module to check each tag’s operation)
 if (strID.indexOf("04:D1:FC:42")>= 0 or strID.indexOf("04:D7:FC:42")>= 0 or strID.indexOf("04:C9:FC:42")>= 0 
 or strID.indexOf("04:BC:FC:42") >=0 or strID.indexOf("04:C2:FC:42")>=0)
 {
  digitalWrite(LED_PIN, HIGH);
  
 } 
  else {
  digitalWrite(LED_PIN, LOW);
 }
  
  rfid.PICC_HaltA();
  rfid.PCD_StopCrypto1();
}