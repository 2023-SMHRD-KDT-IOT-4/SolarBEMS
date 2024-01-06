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
    // 빌딩 방 갯수
    private int roomNumber;
    // 사용자 가입일시
    private String joinedAt;
    
	public UserDTO() {
	}

	public UserDTO(String userId, String userPw) {
		this.userId = userId;
		this.userPw = userPw;
	}

	public UserDTO(String userId, String userPw, String userNick, String buildingName, int roomNumber) {
		this.userId = userId;
		this.userPw = userPw;
		this.userNick = userNick;
		this.buildingName = buildingName;
		this.roomNumber = roomNumber;
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
	public int getRoomNumber() {
		return roomNumber;
	}
	public void setRoomNumber(int roomNumber) {
		this.roomNumber = roomNumber;
	}
	public String getJoinedAt() {
		return joinedAt;
	}
	public void setJoinedAt(String joinedAt) {
		this.joinedAt = joinedAt;
	}
	@Override
	public String toString() {
		return "UserDTO [userId=" + userId + ", userPw=" + userPw + ", userNick=" + userNick + ", buildingName="
				+ buildingName + ", roomNumber=" + roomNumber + ", joinedAt=" + joinedAt + "]";
	}
    
}
