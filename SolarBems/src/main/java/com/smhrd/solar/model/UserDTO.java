package com.smhrd.solar.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class UserDTO {

    // 사용자 아이디
    private String userId;
    // 사용자 비밀번호
    private String userPw;
    // 사용자 닉네임
    private String userNick;
    // 빌딩이름 
    private String buildingName;
    // 빌딩 방 갯수
    private int roomNumber;
    // 사용자 가입일시
    private String joinedAt;
    
}
