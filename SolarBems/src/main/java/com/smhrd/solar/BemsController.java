package com.smhrd.solar;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class BemsController {

	// 전력 Dashboard 페이지
	@RequestMapping(value = "/bems/elect_dashboard", method = RequestMethod.GET)
	public String elecDashBoardPage() {
		
		return "bems/elect_dashboard";
	}

	// 전력 생산량 관리 페이지
	@RequestMapping(value = "/bems/elect_prod_mgmt", method = RequestMethod.GET)
	public String elecProdMgmtPage() {
		
		return "bems/elect_prod_mgmt";
	}
	
	// 디바이스 제어 및 관리 페이지
	@RequestMapping(value = "/bems/device_mgmt", method = RequestMethod.GET)
	public String deviceMgmtPage() {
		
		return "bems/device_mgmt";
	}
	
	// 디바이스 연동 페이지
	@RequestMapping(value = "/bems/device_link", method = RequestMethod.GET)
	public String deviceLinkPage() {
		
		return "bems/device_link";
	}
	
	// 디바이스 수정 페이지
	@RequestMapping(value = "/bems/device_update", method = RequestMethod.GET)
	public String deviceUpdatePage() {
		
		return "bems/device_update";
	}
}
