package com.smhrd.solar.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	
	// 회원 가입
    @PostMapping("/join")
    public String userJoin(UserDTO user) {
        try {
            userMapper.userJoin(user);
            return "redirect:/user/login"; // 가입 성공 시 로그인 페이지로 이동
        } catch (Exception e) {
            return "redirect:/user/join"; // 가입 실패 시 다시 가입 페이지로 이동
        }
    }
	
	@GetMapping("/user_update")
	public String updatePage() {
		
		return "user/user_update";
	}
	
    // 회원 정보 수정
    @PostMapping("/user_update")
    public String updateUser(UserDTO user, RedirectAttributes redirectAttributes, HttpSession session) {
        try {
            // 로그인한 사용자 정보
            UserDTO loginUser = (UserDTO) session.getAttribute("user");
            
            // 수정된 정보 업데이트
            loginUser.setUserPw(user.getUserPw());
            loginUser.setUserNick(user.getUserNick());
            loginUser.setBuildingName(user.getBuildingName());

            userMapper.userUpdate(loginUser);

            // 세션 갱신
            session.setAttribute("user", loginUser);

            return "redirect:/"; // 수정 성공 시 메인 페이지로 이동
            
        } catch (Exception e) { // 수정 실패 시 실패 메세지 전송 후 다시 수정 페이지로 이동
            redirectAttributes.addFlashAttribute("error", "회원 정보 수정에 실패했습니다.");
            return "redirect:/user/user_update";
        }
    }	
}
