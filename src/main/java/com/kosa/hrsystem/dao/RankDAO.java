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
		System.out.println(result);
		
		//sqlSession.commit(); 수동커밋인 경우
		sqlSession.close();
		return result;
	}
	
	public List<CodeTableDTO> selectAllRank() throws Exception {
		SqlSession sqlSession = factory.openSession(true);
		List<CodeTableDTO> list = null;
		list = sqlSession.selectList("selectAllRank");
		sqlSession.close();
		return list;
	}
	
	public int update(CodeTableDTO dto) throws Exception {
		SqlSession sqlSession = factory.openSession(true);
		int result = sqlSession.update("updateRank", dto);
		System.out.println(result);
		sqlSession.close();
		return result;
	}
	
	public int delete(CodeTableDTO dto) throws Exception {
		SqlSession sqlSession = factory.openSession(true);
		int result = sqlSession.delete("deleteRank",dto);
		System.out.println(result);
		sqlSession.close();
		return result;
	}
}
