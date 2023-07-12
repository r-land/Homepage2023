package egovframework.let.member.service;

public interface MemberService {

	//회원 ID찾기
	public MemberVO findId(MemberVO vo) throws Exception;
	
	//회원비밀번호찾기
	public MemberVO findPassword(MemberVO vo) throws Exception;
	
	//회원비밀번호업데이트
	void passwordUpdate(MemberVO vo) throws Exception;
	
	
}
