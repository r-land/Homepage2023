package egovframework.let.temp.service;

import java.io.Serializable;

import egovframework.com.cmm.ComDefaultVO;

public class TempVO extends ComDefaultVO implements Serializable{

	private String tempId; //임시데이터 ID
	private String tempVal; //임시데이터값

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
	
	
}
