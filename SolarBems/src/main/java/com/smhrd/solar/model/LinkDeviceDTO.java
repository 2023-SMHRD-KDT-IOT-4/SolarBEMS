package com.smhrd.solar.model;

public class LinkDeviceDTO {

    // 디바이스 연동 id 
    private Integer linkId;
    // 사용자 id 
    private String userId;
    // 디바이스 id 
    private String dvcId;
    // 연동 후 사용자가 설정할 이름 
    private String dvclName;
    // 연동 후 사용자가 설정할 디바이스 설치된 장소 이름 
    private String dvclLoc;
    // 아두이노 핀 번호 
    private Integer pinId;
    // 연동 시간 
    private String linkedAt;
    
    // 디바이스 타입 코드
    private String dvcTypeCode;
    // 디바이스 타입 이름
    private String dvcTypeName;
    // 디바이스 전기생산/소비 구분코드 : 1)생산:g, 2)소비:u 3)생산소비:gu
    private String dvcElecCode;
    // 디바이스 파워설정값 코드 : tem, brightness
    private String dvcPowerCode;
    // 디바이스 파워설정값 이름 : 온도, 밝기
    private String dvcPowerName;
    
	public LinkDeviceDTO() {
	}

	public LinkDeviceDTO(Integer linkId, String userId, String dvcId, String dvclName, String dvclLoc, Integer pinId,
			String linkedAt) {
		this.linkId = linkId;
		this.userId = userId;
		this.dvcId = dvcId;
		this.dvclName = dvclName;
		this.dvclLoc = dvclLoc;
		this.pinId = pinId;
		this.linkedAt = linkedAt;
	}

	public Integer getLinkId() {
		return linkId;
	}

	public void setLinkId(Integer linkId) {
		this.linkId = linkId;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getDvcId() {
		return dvcId;
	}

	public void setDvcId(String dvcId) {
		this.dvcId = dvcId;
	}

	public String getDvclName() {
		return dvclName;
	}

	public void setDvclName(String dvclName) {
		this.dvclName = dvclName;
	}

	public String getDvclLoc() {
		return dvclLoc;
	}

	public void setDvclLoc(String dvclLoc) {
		this.dvclLoc = dvclLoc;
	}

	public Integer getPinId() {
		return pinId;
	}

	public void setPinId(Integer pinId) {
		this.pinId = pinId;
	}

	public String getLinkedAt() {
		return linkedAt;
	}

	public void setLinkedAt(String linkedAt) {
		this.linkedAt = linkedAt;
	}

	public String getDvcTypeCode() {
		return dvcTypeCode;
	}

	public void setDvcTypeCode(String dvcTypeCode) {
		this.dvcTypeCode = dvcTypeCode;
	}

	public String getDvcTypeName() {
		return dvcTypeName;
	}

	public void setDvcTypeName(String dvcTypeName) {
		this.dvcTypeName = dvcTypeName;
	}

	public String getDvcElecCode() {
		return dvcElecCode;
	}

	public void setDvcElecCode(String dvcElecCode) {
		this.dvcElecCode = dvcElecCode;
	}

	public String getDvcPowerCode() {
		return dvcPowerCode;
	}

	public void setDvcPowerCode(String dvcPowerCode) {
		this.dvcPowerCode = dvcPowerCode;
	}

	public String getDvcPowerName() {
		return dvcPowerName;
	}

	public void setDvcPowerName(String dvcPowerName) {
		this.dvcPowerName = dvcPowerName;
	}

	@Override
	public String toString() {
		return "LinkDeviceDTO [linkId=" + linkId + ", userId=" + userId + ", dvcId=" + dvcId + ", dvclName=" + dvclName
				+ ", dvclLoc=" + dvclLoc + ", pinId=" + pinId + ", linkedAt=" + linkedAt + ", dvcTypeCode="
				+ dvcTypeCode + ", dvcTypeName=" + dvcTypeName + ", dvcElecCode=" + dvcElecCode + ", dvcPowerCode="
				+ dvcPowerCode + ", dvcPowerName=" + dvcPowerName + "]";
	}
    
}
