package com.smhrd.solar.controller;

import java.sql.Timestamp;
import java.util.Calendar;
import java.util.Date;

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

@RestController
public class ArduinoAPIController {

	@Autowired
	BemsMapper bemsMapper;
	
	@RequestMapping(value = "/linkSolar", method = RequestMethod.GET)
	public void linkSolar() {
		System.out.println("linkSolar");
	}
	
	
	// 디바이스 전력 생산량/소비량 구분해서 db에 저장
	@RequestMapping(value = "/api/elec/measure", method = RequestMethod.POST)
	public String elecMeasure(@RequestBody DeviceElecDTO dvcElecDTO) {
		
		System.out.println(dvcElecDTO);
		if(!"ardu".equals(dvcElecDTO.getClientType())) {
			return "{ response : 400 } ";
		}
		String arduId = dvcElecDTO.getArduId();
		System.out.println(arduId);
		for(DeviceElecValDTO dvc : dvcElecDTO.getDevice()) {
			
			String dvcElecCode = dvc.getDvcElecCode();
			int dvcElecVal = dvc.getDvcElecVal();
			int pinId = dvc.getPinId();
			System.out.println(pinId);
			int linkId = bemsMapper.getDeviceLinkId(arduId, pinId);
			
			if("g".equals(dvcElecCode)) { // 전력 생산
				System.out.println(linkId);
			
				String lastGenerated = bemsMapper.getLastGenerated(linkId);
				System.out.println(lastGenerated);
				if(isInsertElecVal(lastGenerated)) {
					System.out.println(lastGenerated);
					bemsMapper.insertGeneratedElec(new DeviceGeneratedElecDTO(linkId, dvcElecVal));
				} 
				
			} else if("u".equals(dvcElecCode)){ // 전력 소비
				
				String lastUsed = bemsMapper.getLastUsed(linkId);
				if(isInsertElecVal(lastUsed)) {
					bemsMapper.insertUsedElec(new DeviceUsedElecDTO(linkId, dvcElecVal));
				}
				
			}
		}
		
		return "{ result : 200 }";
	}
	
	// 해당 디바이스 마지막 측정 시간을 기준으로 측정량 insert할지
	public boolean isInsertElecVal(String lastTime) {
		if(lastTime == null || lastTime == "")
			return true;
		 Timestamp lastDbTime = Timestamp.valueOf(lastTime);
		  
	    Timestamp curTimeStamp = new Timestamp(new Date().getTime());
	    Calendar cal = Calendar.getInstance();
	    cal.setTimeInMillis(curTimeStamp.getTime());
	    // add 30 seconds
	    cal.add(Calendar.SECOND, 30);
	    curTimeStamp = new Timestamp(cal.getTime().getTime());
//	    System.out.println("cur + 30sec:: " +curTimeStamp);
	    boolean result = lastDbTime.after(curTimeStamp);
		
		return result;
	}
}
