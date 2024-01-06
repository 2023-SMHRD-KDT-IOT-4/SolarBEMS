package com.smhrd.solar.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.smhrd.solar.mapper.UserMapper;
import com.smhrd.solar.model.UserDTO;

@RequestMapping("/user")
@Controller
public class UserController {

	@Autowired
	UserMapper userMapper;
	
	// 로그인 페이지
	@GetMapping("/login")
	public String loginPage() {
		
		return "user/login";
	}
	
	// 로그인 처리
	@PostMapping("/login")
	public String userLogin(UserDTO user, HttpServletRequest request) {
		
		// // 로그인 시 id, pw 일치한지 체크
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

	@GetMapping("/logout")
	public String logout(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		session.removeAttribute("user");
		
		return "redirect:/";
	}
	
	@GetMapping("/join")
	public String joinPage() {
		
		return "user/join";
	}
	
	@GetMapping("/user_update")
	public String updatePage() {
		
		return "user/user_update";
	}
}
