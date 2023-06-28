package egovframework.let.join.service.impl;

import egovframework.let.join.service.JoinVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("joinMapper")
public interface JoinMapper {

	//ID중복체크
	int duplicateCheck(JoinVO vo) throws Exception;
	
	//회원등록
	void insertJoin(JoinVO vo) throws Exception;
	
		}

