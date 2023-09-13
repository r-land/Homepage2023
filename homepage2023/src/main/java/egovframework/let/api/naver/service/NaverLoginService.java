package egovframework.let.api.naver.service;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import com.github.scribejava.core.model.OAuth2AccessToken;

public interface NaverLoginService {
	
	/* 네이버아이디로 인증 url 생성 method*/
	String getAuthorizationUrl(HttpSession session, String domain, String port);
	
	/* 네이버아이디로 callback 처리 및 accesstoken 획득 method*/
	OAuth2AccessToken getAccessToken(HttpSession session, String  code, String state, String domain, String port) throws IOException;
	
	/* 세션 유효성 검증을 위한 난수 생성기*/
	String generateRandomString();
	
	/* http session 데이터 저장*/
	void setSession(HttpSession session,String state);
	
	/* http session 데이터 가져오기*/
	String getSession(HttpSession session);
	
	/* access token을 이용하여 네이버 사용자 프로필 api 호출*/
	String getUserProfile(OAuth2AccessToken oauthToken) throws IOException;
}
