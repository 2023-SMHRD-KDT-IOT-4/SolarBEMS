package com.smhrd.solar.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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

		if (res > 0) { // 로그인성공
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

	// 회원 가입
	@PostMapping("/joinDatabase")
	public String userJoin(@RequestParam("userId") String userId, @RequestParam("userPw2") String userPw,
			@RequestParam("userNick") String userNick, @RequestParam("buildingName") String buildingName,
			@RequestParam("arduId") String arduId) {

		UserDTO user = new UserDTO(userId, userPw, userNick, buildingName, arduId);

		int res = userMapper.userJoin(user);
		if (res > 0) {
			return "redirect:/user/login"; // 가입 성공 시 로그인 페이지로 이동
		}

		return "redirect:/";
	}

	@GetMapping("/user_update")
	public String updatePage(HttpSession session) {

		UserDTO user = (UserDTO) session.getAttribute("user");
		if (user == null)
			return "redirect:/user/login";

		return "user/user_update";
	}

	// 회원 정보 수정
	@PostMapping("/updateData")
	public String updateUser(@RequestParam("userPw2") String userPw,
    		@RequestParam("userNick") String userNick, @RequestParam("buildingName")String buildingName,
    		@RequestParam("arduId") String arduId, HttpSession session) {

    	UserDTO user1 = (UserDTO)session.getAttribute("user");
    	String userId = user1.getUserId();
    	UserDTO user = new UserDTO(userId, userPw, userNick, buildingName, arduId);
    	int res = userMapper.userUpdate(user);
    	if (res>0) {
    		session.setAttribute("user", user);
        	return "redirect:/";
    	} else {
        	return "////////////";
    	}

	}
}
