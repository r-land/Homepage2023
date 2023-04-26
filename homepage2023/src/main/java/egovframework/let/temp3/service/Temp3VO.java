package egovframework.let.temp3.service;

import java.io.Serializable;

import egovframework.com.cmm.ComDefaultVO;

public class Temp3VO extends ComDefaultVO implements Serializable{

	private String tempId; //임시데이터 ID
	private String tempVal; //임시데이터값
	private String prevTempId; //기존 임시데이터 ID
	
//GET 가져오기 SET 저장하기 	
	public String getTempId() {
		return tempId;
	}
	public void setTempId(String tempId) {
		this.tempId = tempId;
	}
	public String getTempVal() {
		return tempVal;
	}
	public void setTempVal(String tempVal) {
		this.tempVal = tempVal;
	}
	public String getPrevTempId() {
		return prevTempId;
	}
	public void setPrevTempId(String prevTempId) {
		this.prevTempId = prevTempId;
	}
	
	
}
