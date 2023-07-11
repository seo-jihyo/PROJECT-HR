package com.kosa.hrsystem.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.kosa.hrsystem.dto.CodeTableDTO;
import com.kosa.hrsystem.utils.SqlMapConfig;

public class RankDAO {
	// Connection 객체와 동일
	private SqlSessionFactory factory = SqlMapConfig.getSqlSession();
	
	public int insertRank(CodeTableDTO dto) throws Exception {
		SqlSession sqlSession = factory.openSession(true); // 자동커밋
		int result = sqlSession.insert("insertRank",dto);
		sqlSession.close();
		return result;
	}
	
	public List<CodeTableDTO> selectAllRank() throws Exception {
		SqlSession sqlSession = factory.openSession(true);
		List<CodeTableDTO> list = sqlSession.selectList("selectAllRank");
		sqlSession.close();
		return list;
	}
	
	public int update(CodeTableDTO dto) throws Exception {
		SqlSession sqlSession = factory.openSession(true);
		int result = sqlSession.update("updateCodeTable", dto);
		sqlSession.close();
		return result;
	}
	
	public int delete(String codeName) throws Exception {
		SqlSession sqlSession = factory.openSession(true);
		int result = sqlSession.delete("deleteCodeTable",codeName);
		sqlSession.close();
		return result;
	}

}
