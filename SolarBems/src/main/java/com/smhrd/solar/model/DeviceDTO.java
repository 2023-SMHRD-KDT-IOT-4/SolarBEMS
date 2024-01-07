package com.smhrd.solar.model;

public class DeviceDTO {

    // 디바이스 id. ex) dvc001, dvc002, ... 
	private String dvcId;
    // 디바이스 타입 코드 : solar panel, led, aircon 
    private String dvcTypeCode;
    // 디바이스 타입 이름 : 태양광패널, LED, 냉난방기 
    private String dvcTypeName;
    // 디바이스 전기생산소비 구분코드 : 1)생산:g, 2)소비:u 3)생산소비:gu 
    private String dvcElecCode;
    // 디바이스 파워조절 코드 : tem, brightness 
    private String dvcPowerCode;
    // 디바이스 파워조절 이름 : 온도, 밝기 
    private String dvcPowerName;
    
    public DeviceDTO() {
		super();
	}

	public DeviceDTO(String dvcId, String dvcTypeCode, String dvcTypeName, String dvcElecCode, String dvcPowerCode,
			String dvcPowerName) {
		this.dvcId = dvcId;
		this.dvcTypeCode = dvcTypeCode;
		this.dvcTypeName = dvcTypeName;
		this.dvcElecCode = dvcElecCode;
		this.dvcPowerCode = dvcPowerCode;
		this.dvcPowerName = dvcPowerName;
	}

	public String getDvcId() {
		return dvcId;
	}

	public void setDvcId(String dvcId) {
		this.dvcId = dvcId;
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
		return "DeviceDTO [dvcId=" + dvcId + ", dvcTypeCode=" + dvcTypeCode + ", dvcTypeName=" + dvcTypeName
				+ ", dvcElecCode=" + dvcElecCode + ", dvcPowerCode=" + dvcPowerCode + ", dvcPowerName=" + dvcPowerName
				+ "]";
	}
    
}
