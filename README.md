# 지능형 IoT를 이용한 빌딩 에너지 관리 시스템 (팀명: SOLAR)
![서비스-소개-003](https://i.ibb.co/j4Lp5Jc/SOLAR-6-20240112.jpg)

## 1. 프로젝트 개요
* 과제명 : 지능형 IoT를 이용한 빌딩 에너지 관리 시스템
* 프로젝트 기간 : 2024.01.03 ~ 2024.01.15
* 프로젝트 설명 : 친환경 에너지인 태양광을 이용한 효율적인 빌딩 자동제어 시스템

## 2. 시연영상
https://youtu.be/-Ie-fJOy5Gk

## 3. 주요기능
* 로그인, 로그아웃, 회원가입 기능
* 배터리 전기와 일반 전기의 전환기능
* 회원의 중앙 제어 기기와 연동된 디바이스 등록
* 등록된 기기의 제어 및 연동과 연동해제 가능
* 디바이스의 전력 소비량 및 전력 생산량 표시 기능
* 월별 전력 소비량 및 전력 생산량 표시 기능
  
![01  로그인 관련 기능](https://github.com/2023-SMHRD-KDT-IOT-4/SolarBEMS/assets/152847567/5e1099dd-edd6-40f1-b56d-1b6497c941ea)
<br>
![02  연동 디바이스 등록](https://github.com/2023-SMHRD-KDT-IOT-4/SolarBEMS/assets/152847567/ed9f6987-72ef-402e-8d50-a91a80917edd)
<br>
![03  전력 전환](https://github.com/2023-SMHRD-KDT-IOT-4/SolarBEMS/assets/152847567/db7e4674-ace2-417b-bd63-44ae3c08e568)
<br>
![04  연동 디바이스 관리](https://github.com/2023-SMHRD-KDT-IOT-4/SolarBEMS/assets/152847567/a8c2632a-b0e1-4d66-9aa7-7aa9ead401a8)
<br>
![05  연동 디바이스 제어](https://github.com/2023-SMHRD-KDT-IOT-4/SolarBEMS/assets/152847567/3c4594cb-8e03-4102-99a8-9778fcf0aaad)
<br>
![06  전력 dashboard](https://github.com/2023-SMHRD-KDT-IOT-4/SolarBEMS/assets/152847567/197371de-47cc-49f9-ab53-911ed9af0f3f)

<br><br>
## 4. 사용언어 및 도구
![사용 언어 및 도구](https://github.com/2023-SMHRD-KDT-IOT-4/SolarBEMS/assets/152847567/53fcd84f-17e4-4e2a-82ad-61e644c51bb1)

## 5. 시스템 아키텍쳐
![image](https://github.com/2023-SMHRD-KDT-IOT-4/SolarBEMS/assets/152847567/77395af4-15ff-44d9-a0ee-700d1e7e8405)


## 6. 주요 메뉴 구성도
![07  주요 메뉴 구성도](https://github.com/2023-SMHRD-KDT-IOT-4/SolarBEMS/assets/152847567/6c4eecb9-05e0-411c-858d-3b3816150c2c)


## 7. 역할분담
![08  역할 분담](https://github.com/2023-SMHRD-KDT-IOT-4/SolarBEMS/assets/152847567/07036c7f-13be-4d1f-92fc-f7ead8096c7d)

### 박찬영
  * 1
### 박준언
  * 1
### 신우진
  * 1
### 조용성
  * 1
### 주경훈
  * 1 

## 8. 트러블슈팅
### 8-1) 아두이노-웹간 통신 오류
  ![image](https://github.com/2023-SMHRD-KDT-IOT-4/SolarBEMS/assets/116381280/51f25a6e-fe7d-4bf5-9f43-925380132036)
  * ESP8266 모듈을 통해 웹-아두이노 간 통신 구현 시도
  * 라이브러리, 버전 문제로 인해 지속적 오류 발생
  * 코드 작성 후 지속적으로 TIME OUT 오류 발생
  * ESP32 모듈 교체 후 올바르게 작동함
    
### 8-2) 아두이노 회로 문제 
  ![image](https://github.com/2023-SMHRD-KDT-IOT-4/SolarBEMS/assets/116381280/0cda99cd-2350-4ffc-a1d0-a065e973a56b)
  * 아두이노 배터리와 전원을 브레드보드에 연결 실패하는 문제 발생
  * 전압, 전력 문제로 인한 것으로 파악
  * 배터리와 외부전원 직접공급으로 전환하여 문제 해결
<hr/>
