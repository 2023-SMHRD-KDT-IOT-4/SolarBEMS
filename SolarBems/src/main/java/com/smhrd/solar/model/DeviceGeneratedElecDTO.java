package com.smhrd.solar.model;

public class DeviceGeneratedElecDTO {

    // 디바이스 전력 생산량 id
    private int elecGId;
    // 디바이스 연동 id
    private int linkId;
    // 전력 생산량
    private int elecGeneration;
    // 측정 시간
    private String createdAt;
    
	public DeviceGeneratedElecDTO() {
	}

	public DeviceGeneratedElecDTO(int linkId, int elecGeneration) {
		this.linkId = linkId;
		this.elecGeneration = elecGeneration;
	}

	public int getElecGId() {
		return elecGId;
	}

	public void setElecGId(int elecGId) {
		this.elecGId = elecGId;
	}

	public int getLinkId() {
		return linkId;
	}

	public void setLinkId(int linkId) {
		this.linkId = linkId;
	}

	public int getElecGeneration() {
		return elecGeneration;
	}

	public void setElecGeneration(int elecGeneration) {
		this.elecGeneration = elecGeneration;
	}

	public String getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(String createdAt) {
		this.createdAt = createdAt;
	}

	@Override
	public String toString() {
		return "DeviceGeneratedElecDTO [elecGId=" + elecGId + ", linkId=" + linkId + ", elecGeneration="
				+ elecGeneration + ", createdAt=" + createdAt + "]";
	}
    
}
