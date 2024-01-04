package com.smhrd.solar;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class BemsController {

	@RequestMapping(value = "/bems/login", method = RequestMethod.GET)
	public String login() {
		
		return "user/login";
	}

	@RequestMapping(value = "/bems/join", method = RequestMethod.GET)
	public String join() {
		
		return "user/join";
	}
}
