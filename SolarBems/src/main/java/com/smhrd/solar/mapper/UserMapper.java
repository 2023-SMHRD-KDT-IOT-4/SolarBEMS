package com.smhrd.solar.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.smhrd.solar.model.UserDTO;


@Mapper
public interface UserMapper {
	
	// 로그인 시 id, pw 일치한지
	public int loginCheck(UserDTO user);
	
	public UserDTO getUser(String userId);
	
	// 회원 가입 
	public int userJoin(UserDTO user);
	
	// 회원 정보 수정
	public int userUpdate(UserDTO user);
}
