package com.kosa.hrsystem.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.kosa.hrsystem.dto.RequestHistoryDTO;
import com.kosa.hrsystem.utils.SqlMapConfig;

public class RequestHistoryDAO {

	private SqlSessionFactory factory = SqlMapConfig.getSqlSession();
	
	public List<RequestHistoryDTO> selectAllRequest() throws Exception {
		SqlSession sqlSession = factory.openSession(true);
		List<RequestHistoryDTO> list = sqlSession.selectList("selectAllRequest");
		sqlSession.close();
		return list;
	}

}
