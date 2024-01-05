package com.smhrd.solar.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.smhrd.solar.mapper.UserMapper;
import com.smhrd.solar.model.UserDTO;

@Controller
public class UserController {

	@Autowired
	UserMapper userMapper;
	
	// 로그인 페이지
	@RequestMapping(value = "/user/login", method = RequestMethod.GET)
	public String loginPage() {
		
		return "user/login";
	}
	
	// 로그인 처리
	@RequestMapping(value = "/user/login", method = RequestMethod.POST)
	public String userLogin(UserDTO user, HttpServletRequest request) {
		
		int res = userMapper.loginCheck(user);
		
		if(res > 0) { // 로그인성공 
			UserDTO loginUser = userMapper.getUser(user.getUserId());
			HttpSession session = request.getSession();
			session.setAttribute("user", loginUser);
			return "redirect:/";
		} else {
			return "redirect:/user/login";
		}
		
	}

	@RequestMapping(value = "/user/logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		session.removeAttribute("user");
		
		return "redirect:/";
	}
	
	@RequestMapping(value = "/user/join", method = RequestMethod.GET)
	public String joinPage() {
		
		return "user/join";
	}
	
	@RequestMapping(value = "/user/user_update", method = RequestMethod.GET)
	public String updatePage() {
		
		return "user/user_update";
	}
}
