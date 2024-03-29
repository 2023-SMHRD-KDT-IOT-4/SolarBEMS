package com.smhrd.solar.model;

public class UserDTO {

    // 사용자 아이디
    private String userId;
    // 사용자 비밀번호
    private String userPw;
    // 사용자 닉네임
    private String userNick;
    // 빌딩이름 
    private String buildingName;
    // '아두이노 고유아이디. bems 시공 완료 후 사용자 인계'
    private String arduId;
    // 사용자 가입일시
    private String joinedAt;
    
	public UserDTO() {
	}

	public UserDTO(String userId, String userPw) {
		this.userId = userId;
		this.userPw = userPw;
	}
	
	public UserDTO(String userId, String userPw, String userNick, String buildingName, String arduId) {
		super();
		this.userId = userId;
		this.userPw = userPw;
		this.userNick = userNick;
		this.buildingName = buildingName;
		this.arduId = arduId;
	}

	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPw() {
		return userPw;
	}
	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}
	public String getUserNick() {
		return userNick;
	}
	public void setUserNick(String userNick) {
		this.userNick = userNick;
	}
	public String getBuildingName() {
		return buildingName;
	}
	public void setBuildingName(String buildingName) {
		this.buildingName = buildingName;
	}
	public String getJoinedAt() {
		return joinedAt;
	}
	public void setJoinedAt(String joinedAt) {
		this.joinedAt = joinedAt;
	}

	public String getArduId() {
		return arduId;
	}

	public void setArduId(String arduId) {
		this.arduId = arduId;
	}

	@Override
	public String toString() {
		return "UserDTO [userId=" + userId + ", userPw=" + userPw + ", userNick=" + userNick + ", buildingName="
				+ buildingName + ", arduId=" + arduId + ", joinedAt=" + joinedAt + "]";
	}
    
}
