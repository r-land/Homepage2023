package egovframework.let.temp.service.impl;

import java.util.List;

import egovframework.let.temp.service.TempVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Mapper("tempMapper")
public interface TempMapper {
	
	public TempVO selectTemp(TempVO vo) throws Exception ;
	
	//임시데이터목록가져오기
	List<EgovMap> selectTempList(TempVO vo) throws Exception;
	
	//임시데이터 등록
	void insertTemp(TempVO vo) throws Exception;
		
		}

