package com.kosa.hrsystem.dao;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import com.kosa.hrsystem.dto.RequestHistoryDTO;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.kosa.hrsystem.utils.SqlMapConfig;
import com.kosa.hrsystem.vo.CommuteRecordVO;

public class CommuteRecordDAO {
	private SqlSessionFactory factory = SqlMapConfig.getSqlSession();

	public List<CommuteRecordVO> selectAllRecord() throws Exception {
		SqlSession sqlSession = factory.openSession(true);
		List<CommuteRecordVO> list = null;
		list = sqlSession.selectList("selectAllRecord");
		sqlSession.close();
		return list;
	}
	public int insertRecord(CommuteRecordVO vo, RequestHistoryDTO reqDTO) {
		SqlSession sqlSession = factory.openSession(true);
		int result = 0;
		int seq = 0;
		try {
			result = sqlSession.insert("insertRecord", vo);
			seq = sqlSession.selectOne("selectAttCurrval");

			reqDTO.setState('1');
			reqDTO.setRequest_type('A');
			reqDTO.setApprover_note("자동승인");
			reqDTO.setRequest_num(seq);
			sqlSession.insert("insertRequest", reqDTO);
			sqlSession.commit();
		}catch (Exception e){

			sqlSession.rollback();
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return result;
	}
	public int deleteRecord(int att_num) throws Exception {
		SqlSession sqlSession = factory.openSession(true);
		int result = sqlSession.delete("deleteRecord", att_num);
		sqlSession.close();
		return result;
	}
	public int updateRecord(CommuteRecordVO vo) {
		SqlSession sqlSession = factory.openSession(true);
		int result = sqlSession.update("updateRecord", vo);
		sqlSession.close();
		return result;
	}
	
	// 통합 검색
	public List<CommuteRecordVO> searchTotalAtt(HashMap<String, String> map) {
		SqlSession sqlSession = factory.openSession(true);
		List<CommuteRecordVO> list = sqlSession.selectList("searchTotalAtt",map);
		System.out.println("통합검색 : " + list);
		sqlSession.close();
		return list;
	}
	
	public List<CommuteRecordVO> searchByDateAtt(HashMap<String, Date> map) throws Exception {
		SqlSession sqlSession = factory.openSession(true);
		List<CommuteRecordVO> list = null;
		list = sqlSession.selectList("searchByDateAtt", map);
		sqlSession.close();
		return list;
	}
}
