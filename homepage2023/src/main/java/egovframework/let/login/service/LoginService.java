package egovframework.let.login.service;

import egovframework.com.cmm.LoginVO;

public interface LoginService {

	//일반로그인을 처리
	public LoginVO actionLogin(LoginVO vo) throws Exception;
	
}
