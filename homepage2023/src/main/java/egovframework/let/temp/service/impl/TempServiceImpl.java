package egovframework.let.temp.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.let.temp.service.TempService;
import egovframework.let.temp.service.TempVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service("tempService")	
public class TempServiceImpl extends EgovAbstractServiceImpl implements TempService {

/*-------DAO방식 */
	
//	@Resource(name = "tempDAO")
//	private TempDAO tempDAO;
//	
//	public TempVO selectTemp(TempVO vo) throws Exception {
//	return tempDAO.selectTemp(vo);	
//	
//	}
	
/*----- Mapper형식 */
	@Resource(name="tempMapper")
	private TempMapper tempMapper;
	
	public TempVO selectTemp(TempVO vo) throws Exception {
	return tempMapper.selectTemp(vo); }	
	
	
	//임시데이터목록가져오기
	public List<EgovMap> selectTempList(TempVO vo) throws Exception {
		return tempMapper.selectTempList(vo);
	}
	//임시데이터 등록하기
	public String insertTemp(TempVO vo) throws Exception {
		tempMapper.insertTemp(vo);
		return null;
	
	
	}
}
