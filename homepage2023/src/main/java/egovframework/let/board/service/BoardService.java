package egovframework.let.board.service;

import java.util.List;


import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface BoardService {

	
	//BOARD목록가져오기
	public List<EgovMap> selectBoardList(BoardVO vo) throws Exception;
	
	//BOARD 목록 수
	public int selectBoardListCnt(BoardVO vo) throws Exception;
		
	//Board 등록하기
	public String insertBoard(BoardVO vo) throws Exception;
	
	//board상세정보
	public BoardVO selectBoard(BoardVO vo) throws Exception;
	
	//board 수정
	public void updateBoard(BoardVO vo)throws Exception;
	
	//board 삭제
	public void deleteBoard(BoardVO vo)throws Exception;
	

}
