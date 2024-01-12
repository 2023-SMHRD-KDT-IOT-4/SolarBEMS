package com.smhrd.solar.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.smhrd.solar.model.DeviceGeneratedElecDTO;
import com.smhrd.solar.model.DeviceUsedElecDTO;
import com.smhrd.solar.model.LinkDeviceDTO;


@Mapper
public interface BemsMapper {
	
	// 디바이스 연동(insert)
	public int linkDevice(LinkDeviceDTO dto);
	// 사용자 연동된 디바이스 리스트 조회
	public List<LinkDeviceDTO> getLinkedList(String userId);
	// 연동아이디로 연동된 디바이스 1개 조회 
	public LinkDeviceDTO getLinkedDevice(String linkId);
	// 연동된 디바이스 정보수정(dvclName, dvclLoc)
	public int updateLinkedDevice(LinkDeviceDTO dto);
	// 연동된 디바이스 삭제
	public int deleteLinkedDevice(Integer linkId);
	

	public int getDeviceLinkId(@Param("arduId") String arduId, @Param("pinId") int pinId);
	
	// 디바이스 전력 생산량 insert
	public int insertGeneratedElec(DeviceGeneratedElecDTO dto);
	// 디바이스 전력 소비량 insert
	public int insertUsedElec(DeviceUsedElecDTO dto);
	// 디바이스의 마지막 전력 생산량 저장 시간 조회
	public String getLastGenerated(Integer linkId);
	// 디바이스의 마지막 전력 소비량저장 시간 조회
	public String getLastUsed(Integer linkId);
}
