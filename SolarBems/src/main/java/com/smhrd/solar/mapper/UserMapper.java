package com.smhrd.solar.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.smhrd.solar.model.UserDTO;


@Mapper
public interface UserMapper {
	
	// 로그인 시 id, pw 일치한지
	public int loginCheck(UserDTO user);
	
	public UserDTO getUser(String userId);
}
