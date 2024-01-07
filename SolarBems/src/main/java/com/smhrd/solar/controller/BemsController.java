package com.smhrd.solar.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.stream.IntStream;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.smhrd.solar.mapper.BemsMapper;
import com.smhrd.solar.model.LinkDeviceDTO;
import com.smhrd.solar.model.UserDTO;

@RequestMapping("/bems")
@Controller
public class BemsController {

	@Autowired
	BemsMapper bemsMapper;
	
	// 전력 Dashboard 페이지
	@RequestMapping(value = "/elect_dashboard", method = RequestMethod.GET)
	public String elecDashBoardPage() {
		
		return "bems/elect_dashboard";
	}

	// 전력 생산량 관리 페이지
	@RequestMapping(value = "/elect_prod_mgmt", method = RequestMethod.GET)
	public String elecProdMgmtPage() {
		
		return "bems/elect_prod_mgmt";
	}
	
	// 디바이스 제어 및 관리 페이지
	@RequestMapping(value = "/device_mgmt", method = RequestMethod.GET)
	public String deviceMgmtPage(HttpSession session, Model model) {
		
		UserDTO user = (UserDTO) session.getAttribute("user");
		if(user == null)
			return "redirect:/user/login";
		
		List<LinkDeviceDTO> list = bemsMapper.getLinkedList(user.getUserId());
		model.addAttribute("linkedList", list);
		
		return "bems/device_mgmt";
	}
	
	// 디바이스 연동 페이지
	@RequestMapping(value = "/device_link", method = RequestMethod.GET)
	public String deviceLinkPage() {
		
		return "bems/device_link";
	}

	// 디바이스 연동
	@RequestMapping(value = "/device_link", method = RequestMethod.POST)
	public @ResponseBody String linkDevice(@RequestBody String jsonData,
							HttpSession session) {
		System.out.println(jsonData);
		
		final ObjectMapper objectMapper = new ObjectMapper();
		UserDTO user = (UserDTO) session.getAttribute("user");
		
		try {
			
			List<LinkDeviceDTO> list 
				= objectMapper.readValue(jsonData, new TypeReference<List<LinkDeviceDTO>>(){});
			
	        IntStream.range(0, list.size()).forEach(idx -> {
	        	LinkDeviceDTO dto = list.get(idx);
				dto.setUserId(user.getUserId());
				// 디바이스 이름 및 설치장소 임의 매핑
				dto.setDvclName(dto.getDvcTypeName() + (idx+1));
				dto.setDvclLoc("설치장소"+ (idx+1) );
				bemsMapper.linkDevice(dto);
	        });
			
		} catch (JsonProcessingException e) {
			e.printStackTrace();
			return "fail";
		}
		
		return "success";
		
	}
	
	// 연동된 디바이스 수정 페이지
	@RequestMapping(value = "/device_update/{linkId}", method = RequestMethod.GET)
	public String deviceUpdatePage(@PathVariable("linkId") String linkId, Model model) {
		
		LinkDeviceDTO dto = bemsMapper.getLinkedDevice(linkId);	
		System.out.println("deviceUpdatePage"+dto);
		model.addAttribute("dto", dto);
		
		return "bems/device_update";
	}
	// 연동된 디바이스 정보 수정
	@RequestMapping(value = "/device_update", method = RequestMethod.POST)
	public String updateLinkedDevice(LinkDeviceDTO dto) {
		
		System.out.println("LinkDeviceDTO"+dto);
		bemsMapper.updateLinkedDevice(dto);
		
		return "redirect:/bems/device_mgmt";
	}

	// 연동된 디바이스 해제(삭제)
	@RequestMapping(value = "/device_delete/{linkId}", method = RequestMethod.GET)
	public @ResponseBody String deleteLinkedDevice(@PathVariable("linkId") Integer linkId) {
		
		System.out.println("deleteLinkedDevice"+linkId);
		int res = bemsMapper.deleteLinkedDevice(linkId);
		if(res > 0) {
			return "success";
			
		} else {
			return "fail";
			
		}
	}
	
}
