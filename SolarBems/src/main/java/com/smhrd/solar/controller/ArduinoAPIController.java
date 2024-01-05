package com.smhrd.solar.controller;

import java.util.*;

import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.smhrd.solar.model.DeviceDTO;

@RestController
public class ArduinoAPIController {

	// json Test
	@RequestMapping(value = "/api/test" , method = RequestMethod.GET)
	public String test(@RequestBody String jsonString) {
		System.out.println(jsonString);
		ObjectMapper mapper = new ObjectMapper();
		
		
		try {
			
			List<DeviceDTO> deviceList = mapper.readValue(jsonString, new TypeReference<List<DeviceDTO>>(){});
			System.out.println(deviceList);
			
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		
		
		
		return jsonString;
	}
	
	@RequestMapping(value = "/linkSolar", method = RequestMethod.GET)
	public String linkSolar(@RequestParam("temperature") String temperature,
											@RequestParam("humidity") String humidity) {
		
		Random rand = new Random();
		int valG = rand.nextInt(170) + 50; // 50~220
		int valB = rand.nextInt(80) + 50; // 50~130
		System.out.printf("from esp32 : %s / %s\n", temperature, humidity );
		return "{ valG : " + valG + ", valB : " +  valB + "}";
	}
	
	
}
