package com.smhrd.solar.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.smhrd.solar.mapper.BemsMapper;
import com.smhrd.solar.model.DeviceElecDTO;
import com.smhrd.solar.model.DeviceElecValDTO;
import com.smhrd.solar.model.DeviceGeneratedElecDTO;
import com.smhrd.solar.model.DeviceUsedElecDTO;

@RequestMapping("/api")
@RestController
public class ArduinoAPIController {

	@Autowired
	BemsMapper bemsMapper;
	
	// 디바이스 전력 생산량/소비량 구분해서 db에 저장
	@RequestMapping(value = "/elec/measure", method = RequestMethod.POST)
	public String elecMeasure(@RequestBody DeviceElecDTO dvcElecDTO) {
		
		System.out.println(dvcElecDTO);
		if(!"ardu".equals(dvcElecDTO.getClientType())) {
			return "{ response : 400 } ";
		}
		
		for(DeviceElecValDTO dvc : dvcElecDTO.getDevice()) {
			
			String dvcElecCode = dvc.getDvcElecCode();
			int dvcElecVal = dvc.getDvcElecVal();
			int linkId = bemsMapper.getDeviceLinkId(dvcElecDTO.getClientId(),
													String.valueOf(dvc.getPinId()));
			if("g".equals(dvcElecCode)) { // 전력 생산
				bemsMapper.insertGeneratedElec(new DeviceGeneratedElecDTO(linkId, dvcElecVal));
			} else if("u".equals(dvcElecCode)){ // 전력 소비
				bemsMapper.insertUsedElec(new DeviceUsedElecDTO(linkId, dvcElecVal));
			}
		}
		
		return "{ suc }";
	}
}
