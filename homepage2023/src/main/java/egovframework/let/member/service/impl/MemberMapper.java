package egovframework.let.member.service.impl;

import egovframework.com.cmm.LoginVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("loginMapper")
public interface MemberMapper {

	//일반 로그인을 처리한다
	public LoginVO actionLogin(LoginVO vo) throws Exception;

	
		}

