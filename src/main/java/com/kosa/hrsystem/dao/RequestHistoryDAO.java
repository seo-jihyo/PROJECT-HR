package com.kosa.hrsystem.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.kosa.hrsystem.dto.RequestHistoryDTO;
import com.kosa.hrsystem.utils.SqlMapConfig;

public class RequestHistoryDAO {

	private SqlSessionFactory factory = SqlMapConfig.getSqlSession();
	
	public List<RequestHistoryDTO> selectAllRequest() {
		SqlSession sqlSession = factory.openSession();
		List<RequestHistoryDTO> list = sqlSession.selectList("selectAllRequest");
		sqlSession.close();
		return list;
	}

	public int insert(RequestHistoryDTO reqDTO, Object dto) {
		SqlSession sqlSession = factory.openSession();
		int result = 0;
		int seq = 0;
		try {
			switch (reqDTO.getRequest_type()){
				case 'V': // 휴가
					result = sqlSession.insert("insertVacation",dto);
					seq = sqlSession.selectOne("selectVctnCurrval");
					break;
				case 'W': // 근무일정
					result = sqlSession.insert("insertWorkSchedule",dto);
					seq = sqlSession.selectOne("selectWorkSchCurrval");
					break;
				case 'A': // 근태
					result = sqlSession.insert("insertRecord",dto);
					seq = sqlSession.selectOne("selectAttCurrval");
					break;
			}
			// 사원번호, 요청종류, 상태=0
			reqDTO.setRequest_num(seq);
			sqlSession.insert("insertRequest",reqDTO);
			sqlSession.commit();
		} catch (Exception e){
			sqlSession.rollback();
			e.printStackTrace();
			return 0; // 요청 실패
		} finally {
			sqlSession.close();
		}
		return result;
	}

	public int update(HashMap<String, Object> map) {
		SqlSession sqlSession = factory.openSession(true);
		int result = sqlSession.update("updateRequest",map);

		sqlSession.close();
		return result;
	}
}
