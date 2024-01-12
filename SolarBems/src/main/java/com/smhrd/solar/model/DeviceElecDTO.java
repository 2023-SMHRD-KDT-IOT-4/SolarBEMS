package com.smhrd.solar.model;

import java.util.List;

public class DeviceElecDTO {

	private String clientType;
	private String clientId;
	private String arduId;
	private List<DeviceElecValDTO> device;
	
	public String getClientType() {
		return clientType;
	}
	public void setClientType(String clientType) {
		this.clientType = clientType;
	}
	public String getClientId() {
		return clientId;
	}
	public void setClientId(String clientId) {
		this.clientId = clientId;
	}
	public List<DeviceElecValDTO> getDevice() {
		return device;
	}
	public String getArduId() {
		return arduId;
	}
	public void setArduId(String arduId) {
		this.arduId = arduId;
	}
	public void setDevice(List<DeviceElecValDTO> device) {
		this.device = device;
	}
	
	@Override
	public String toString() {
		return "DeviceElecDTO [clientType=" + clientType + ", clientId=" + clientId + ", arduId=" + arduId + ", device="
				+ device + "]";
	}
	
}
