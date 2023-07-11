package com.kosa.hrsystem.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.kosa.hrsystem.dto.CodeTableDTO;
import com.kosa.hrsystem.utils.SqlMapConfig;

public class DeptDAO {
	private SqlSessionFactory factory = SqlMapConfig.getSqlSession();
	
	// 부서 리스트 출력
	public List<CodeTableDTO> selectAllDept() {
		SqlSession sqlSession = factory.openSession(true);
		List<CodeTableDTO> list = null;
		list = sqlSession.selectList("selectAllDept");
		return list;
	}
	
	// 부서 추가하기
	public int insertDept(CodeTableDTO dto) throws Exception {
		SqlSession sqlSession = factory.openSession(true);
		int result = sqlSession.insert("insertDept", dto);
		System.out.println(result);
		sqlSession.close();
		return result;
	}
	
	// 부서 수정하기
	public int updateDept(CodeTableDTO dto) throws Exception {
		SqlSession sqlSession = factory.openSession(true);
		int result = sqlSession.update("updateCodeTable", dto);
		sqlSession.close();
		return result;
	}
	
	// 부서 삭제하기
	public int deleteDept(String codeName) throws Exception {
		SqlSession sqlSession = factory.openSession(true);
		int result = sqlSession.delete("deleteCodeTable", codeName);
		sqlSession.close();
		return result;
	}
}