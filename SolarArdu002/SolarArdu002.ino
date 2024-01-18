#include <WiFi.h>
#include <HTTPClient.h>
#include <ArduinoJson.h>
#include <ArduinoJson.hpp>
#include <Wire.h> 
#include <Adafruit_INA219.h> 

#define R1 330.0
#define R2 4700.0

const char* ssid = "CAMPUS_G"; // WIFI ID
const char* password = "SMHRDg7777";  // WIFI PW
HTTPClient http; // 통신 객체
Adafruit_INA219 ina219; // 태양광 판넬 전류측정
// ===============================================================
String HOST_FLASK = "http://172.30.1.89:5000"; // Flask 요청 HOST
String HOST_WAS = "http://172.30.1.89:8083/solar"; // WAS 요청 HOST
// SERVER 요청 URL 
String REQUEST_LINK = HOST_FLASK + "/api/device/link"; // 디바이스 정보 => Flask
String REQUEST_ElEC = HOST_WAS + "/api/elec/measure"; // 디바이스 전력 정보 => WAS
String MY_TYPE   = "ardu";
String MY_ARDUID = "ardu002"; // 디바이스 연동 시 - 고유 식별번호
// ================================================================

// 디바이스들 핀 번호
int  convertPin = 5; // 컨버터 핀 일반전기 <=> 배터리 전기
int solarPin= 25, ledPin1 = 18, ledPin2 = 19, motorPin = 23; 
// 전류측정 센서 핀번호 - 모터 , led1, led2
int elecSensorM = 34, elecSensorLed1 = 36, elecSensorLed2 = 39;

// ================ 제어신호 처리 ===============================
String resControlId = ""; // 제어신호 아이디
int resResult = -1; // 제어신호 결과
bool controlFlag = false; // 제어신호 응답 유무
int delaySec = 1;

void setup() {
  // 초기 디바이스 세팅
  pinMode(ledPin1, OUTPUT);
  pinMode(ledPin2, OUTPUT);
  pinMode(motorPin, OUTPUT);
  // 각 디바이스 전류측정센서
  pinMode(elecSensorM, INPUT);
  pinMode(elecSensorLed1, INPUT);
  pinMode(elecSensorLed2, INPUT);

  analogWrite(ledPin1, 0);
  analogWrite(ledPin2, 0);
  analogWrite(motorPin, 255);
  
  Serial.begin(115200);
  if (! ina219.begin()) {
    Serial.println("Failed to find INA219 chip");
    while (1) { delay(10); }
  }

  WiFi.begin(ssid, password);
  while (WiFi.status() != WL_CONNECTED) {
    delay(5000);
    Serial.println("Connecting to WiFi..");
  }
  Serial.println("Connected to the WiFi network");
}

void loop() {

  if ((WiFi.status() == WL_CONNECTED)) {  //Check the current connection status
    http.begin(REQUEST_LINK);  // 디바이스 정보 => Flask
    http.addHeader("Content-Type", "application/json"); // json type지정

    String jsonString = getJsonData();
    int httpCode = http.POST(jsonString);

    if (httpCode > 0) { // 응답성공

      String payload = http.getString(); // 응답 결과 저장 payload
      DynamicJsonBuffer jsonBuffer;
      JsonObject& response = jsonBuffer.parseObject(payload);

      if (response.success()) {
        String controlId = response["controlId"].asString();

        if( controlId != resControlId) {// 해당 아두이노. 제어신호 있음 
         
          String arduId = response["arduId"].asString();
          int result = response["result"].as<int>(); // 제어 유무 1:성공 / 0:실패

          if (arduId == MY_ARDUID) {

            JsonObject& control = response["control"];
            // "control" 키 값에 매핑
            int pinId = control["pinId"].as<int>();
            int powerStatus = control["powerStatus"].as<int>();
            int powerVal = control["powerVal"].as<int>();

            // 디바이스 타입에 따른 제어신호 처리 구분
            if(pinId == ledPin1 || pinId == ledPin2) { // led일 경우 제어
              if (powerStatus == 1) {
                analogWrite(pinId, powerVal);
              } else if (powerStatus == 0) {
                analogWrite(pinId, 0);
              }
            }
            // 냉난방기(모터)일 경우 제어 
            else if(pinId == motorPin) { 
              if (powerStatus == 1) {
                analogWrite(pinId, powerVal);
              } else if (powerStatus == 0) {
               analogWrite(pinId, 255);
              }
            } // 모터 끝

            // 전력제어 전환처리 일반전기(1) <=> 배터리 전기(0)
            else if(pinId == solarPin) {
              if(powerStatus == 1) { // 일반전기 
                analogWrite(convertPin, 0); 
              } else { // 배터리 전기
                analogWrite(convertPin, 255);
              }
            } // End  // 디바이스 타입에 따른 제어신호 처리 구분

            // ================ 제어신호 매핑 ================
            resControlId = controlId; // 요청받은 제어 아이디 매핑
            resResult = 1; 
            controlFlag =  true; // 제어신호 처리 다음 요청때 매핑되게 => controlId, result 
          }
        }// End if( controlId != resControlId) {
      } // End if (response.success())
      else {
        Serial.println("Failed to parse JSON");
      }

    } else { // 
    Serial.printf("[HTTP] POST - REQUEST_LINK failed, error: %s\n", http.errorToString(httpCode).c_str());
  }
    http.end();
  } else {
    Serial.println("Error on HTTP request");
  }
  delay(1000 * delaySec);


   // 디바이스 전력 => Was
  if ((WiFi.status() == WL_CONNECTED)) {  //Check the current connection status
    http.begin(REQUEST_ElEC);
    http.addHeader("Content-Type", "application/json"); // json type지정

    String jsonString2 = getJsonData();
    int httpCode = http.POST(jsonString2);

    if (httpCode > 0) { // 응답성공
      String payload = http.getString(); // 응답 결과 저장 payload

    } else { //
    Serial.printf("[HTTP] POST - REQUEST_ElEC failed, error: %s\n", http.errorToString(httpCode).c_str());
  }
    http.end();
  } else {
    Serial.println("Error on HTTP request");
  }
  delay(1000 * delaySec);

} // End loop

String getJsonData() {

  int data = analogRead(2); //10bit 아날로그 값을 읽음
  float batteryVolt = (5*data/1024.0) / (R2/(R1+R2));
  float percentage = 0;

  //3.8보다 작으면 60 //4.2보다 크면 100 //3.8~4.2구간에서 60~100
  if(batteryVolt >= 4.2){
    batteryPercentage = 100;
  }else if(batteryVolt < 4.2 && batteryVolt >= 3.8){
    //계산을 해야하는 구간(batteryVolt 3.8~4.2)  y = 100x-320
    batteryPercentage = (100*batteryVolt) - 320;
  }else{
    batteryPercentage = 60; //3.8미만일떄
  }

  float solar_mA = 0;
  solar_mA = ina219.getCurrent_mA(); // 태양광 판넬 생산량

  int motor_value = analogRead(elecSensorM);  
  float motor_amp =(((motor_value-511)*5.0/0.185)/1023.0)*0.1; // 모터 mA

  int led_value1 = analogRead(elecSensorLed1);  
  float led_amp1 =(((led_value1-511)*5.0/0.185)/1023.0)*0.1; // led1 mA

  int led_value2 = analogRead(elecSensorLed2);  
  led_amp2 =(((led_value2-511)*5.0/0.185)/1023.0)*0.1; // led2 mA

// ======================== Make JSON ========================
  DynamicJsonBuffer jsonBuffer;
  JsonObject& root = jsonBuffer.createObject();
  root["clientType"] = MY_TYPE;
  root["clientId"] = MY_ARDUID;
  root["arduId"] = MY_ARDUID;

  if(controlFlag == true) { // 제어 응답값 매핑
    root["controlId"] = resControlId;
    root["result"] = resResult;
    controlFlag = false;
  } else { // 응답 후 초기화
    resControlId = "";
    resResult = -1;
  }

  // 연동 디바이스들 JsonArray
  JsonArray& devices = root.createNestedArray("device");
  
  // dvc1: solar panel
  JsonObject& device1 = devices.createNestedObject();   
  device1["pinId"] = solarPin; 
  device1["dvcId"] = "dvc001";
  device1["powerStatus"] = 1; // 항상 켜짐
  device1["powerVal"] = batteryPercentage; // 배터리 잔량
  device1["dvcElecVal"] = solar_mA; 
  device1["dvcTypeName"] = "태양광패널";
  device1["dvcPowerName"] = "배터리잔량";
  device1["dvcElecCode"] = "g"; // 생산

  // dvc2: led1 - PIN 18
  JsonObject& device2 = devices.createNestedObject();
  device2["pinId"] = ledPin1; 
  device2["dvcId"] = "dvc002";
  device2["powerStatus"] = digitalRead(ledPin1);
  device2["powerVal"] = analogRead(ledPin1);
  device2["dvcElecVal"] = led_amp1;
  device2["dvcTypeName"] = "LED";
  device2["dvcPowerName"] = "밝기";
  device2["dvcElecCode"] = "u"; // 소비

  // dvc3: led2 - PIN 19
  JsonObject& device3 = devices.createNestedObject();
  device3["pinId"] = ledPin2; // 빨빨
  device3["dvcId"] = "dvc002";
  device3["powerStatus"] = digitalRead(ledPin2);
  device3["powerVal"] = analogRead(ledPin2);
  device3["dvcElecVal"] = led_amp2;
  device3["dvcTypeName"] = "LED";
  device3["dvcPowerName"] = "밝기";
  device3["dvcElecCode"] = "u"; // 소비    

  // dvc4: motor
  JsonObject& device4 = devices.createNestedObject();
  device4["pinId"] = motorPin; // 빨빨
  device4["dvcId"] = "dvc003";
  device4["powerStatus"] = digitalRead(motorPin);
  device4["powerVal"] = analogRead(motorPin); // 0~255
  device4["dvcElecVal"] = motor_amp;
  device4["dvcTypeName"] = "냉난방기";
  device4["dvcPowerName"] = "세기";
  device4["dvcElecCode"] =  "u"; // 소비
  //   End 전체 연결된 디바이스들  =============================

  String jsonString;
  root.printTo(jsonString); // root(jsonObject) to String 
  return jsonString;
}