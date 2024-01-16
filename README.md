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
  


  
  ![image](https://github.com/2023-SMHRD-SW-Fullstack-1/TodoWedding/assets/130349912/faf05eea-4b73-49a7-a677-f7e526cd7d43)
<br><br>
## 4. 사용언어 및 도구
![사용 언어 및 도구](https://github.com/2023-SMHRD-KDT-IOT-4/SolarBEMS/assets/152847567/53fcd84f-17e4-4e2a-82ad-61e644c51bb1)

## 5. 시스템 아키텍쳐
![image](https://github.com/2023-SMHRD-KDT-IOT-4/SolarBEMS/assets/152847567/77395af4-15ff-44d9-a0ee-700d1e7e8405)


## 6. 주요 메뉴 구성도
![image](https://github.com/2023-SMHRD-SW-Fullstack-1/TodoWedding/assets/130349912/fc7b356c-e7df-42d8-b924-81c3ce97cbac)

## 7. 역할분담
![역할 분담](https://github.com/2023-SMHRD-KDT-IOT-4/SolarBEMS/assets/152847567/c9829fa0-d5ed-4574-b54a-95856ad30c64)
### 신지영
  * 프로젝트 팀장, **프로젝트 총괄 및 결과 발표**
  * 데이터베이스 설계
 
  * **관리자 페이지** 대시보드, 업체 리스트, 회원 리스트 조회, 검색 수정 **프론트엔드 & 백엔드** 구현
### 서유광
  * **데이터베이스**
  * 데이터베이스 **설계 및 관리**
  * *CustomOverlay를 활용해 정보표시창 구현*
  * *데이터베이스에 있는 업체 구분코드별 지도에 표시*
  * **최종 디버깅 진행**
### 서현록
  * **기획 발표**
  * **UI/UX 설계**
  * 기획 및 최종 발표 PPT 제작
### 양수진
   * **서비스 기획**
  * 기업멘토링 **Notion 일정 관리**
  
  * 시연영상 제작

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
