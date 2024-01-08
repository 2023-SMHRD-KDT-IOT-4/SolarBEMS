package com.smhrd.solar.model;

public class DeviceElecValDTO {

	private int pinId;
	private String dvcId;
	private String dvcElecCode;
	private int dvcElecVal;
	
	public int getPinId() {
		return pinId;
	}

	public void setPinId(int pinId) {
		this.pinId = pinId;
	}

	public String getDvcId() {
		return dvcId;
	}

	public void setDvcId(String dvcId) {
		this.dvcId = dvcId;
	}

	public String getDvcElecCode() {
		return dvcElecCode;
	}

	public void setDvcElecCode(String dvcElecCode) {
		this.dvcElecCode = dvcElecCode;
	}

	public int getDvcElecVal() {
		return dvcElecVal;
	}

	public void setDvcElecVal(int dvcElecVal) {
		this.dvcElecVal = dvcElecVal;
	}

	@Override
	public String toString() {
		return "DeviceElecValDTO [pinId=" + pinId + ", dvcId=" + dvcId + ", elecCode=" + dvcElecCode + ", dvcElecVal="
				+ dvcElecVal + "]";
	}
	
}
