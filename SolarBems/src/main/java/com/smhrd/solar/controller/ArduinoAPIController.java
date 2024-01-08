package com.smhrd.solar.controller;

import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.ObjectMapper;

@RequestMapping("/api")
@RestController
public class ArduinoAPIController {

	
	// 디바이스 전력 생산량/소비량 구분해서 db에 저장
	@RequestMapping(value = "/elec/measure", method = RequestMethod.POST)
	public String elecMeasure(@RequestBody String jsonData) {
		System.out.println(jsonData);
		final ObjectMapper objectMapper = new ObjectMapper();
		
		
		return "{ suc }";
	}
}
