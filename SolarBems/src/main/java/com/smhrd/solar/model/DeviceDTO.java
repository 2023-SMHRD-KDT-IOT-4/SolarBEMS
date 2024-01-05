package com.smhrd.solar.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class DeviceDTO {

	private int pinId; // 아두이노 핀 아이디
	private String deviceType; // led, motor
	private int status; // 운전상태 -  1:On , 0 : Off
	// 운전 파워 - led : 0~255 , motor : "H, M, L"
	private String powerVal;  
}
