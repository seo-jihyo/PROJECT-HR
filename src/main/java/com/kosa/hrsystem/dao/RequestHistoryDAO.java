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

	public int update(HashMap<String, Object> map) {
		SqlSession sqlSession = factory.openSession(true);
		int result = sqlSession.update("updateRequest",map);

		sqlSession.close();
		return result;
	}
}
