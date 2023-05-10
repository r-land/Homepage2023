package egovframework.let.board.service;

import java.util.List;


import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface BoardService {

	
	//BOARD목록가져오기
	public List<EgovMap> selectBoardList(BoardVO vo) throws Exception;
	
	//BOARD 목록 수
	public int selectBoardListCnt(BoardVO vo) throws Exception;
		


}
