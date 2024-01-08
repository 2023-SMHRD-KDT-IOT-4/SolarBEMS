package com.smhrd.solar.model;

public class DeviceUsedElecDTO {

    // 디바이스 전력 소비량 id
    private int elecUId;
    // 디바이스 연동 id
    private int linkId;
    // 전력 소비량
    private int elecConsumption;
    // 측정 시간
    private String createdAt;
    
	public DeviceUsedElecDTO() {
	}

	public DeviceUsedElecDTO(int linkId, int elecConsumption) {
		this.linkId = linkId;
		this.elecConsumption = elecConsumption;
	}

	public int getElecUId() {
		return elecUId;
	}

	public void setElecUId(int elecUId) {
		this.elecUId = elecUId;
	}

	public int getLinkId() {
		return linkId;
	}

	public void setLinkId(int linkId) {
		this.linkId = linkId;
	}

	public int getElecConsumption() {
		return elecConsumption;
	}

	public void setElecConsumption(int elecConsumption) {
		this.elecConsumption = elecConsumption;
	}

	public String getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(String createdAt) {
		this.createdAt = createdAt;
	}

	@Override
	public String toString() {
		return "DeviceUsedElecDTO [elecUId=" + elecUId + ", linkId=" + linkId + ", elecConsumption=" + elecConsumption
				+ ", createdAt=" + createdAt + "]";
	}
    
	
}
