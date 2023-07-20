package com.kosa.hrsystem.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.kosa.hrsystem.utils.SqlMapConfig;
import com.kosa.hrsystem.vo.DashBoardVO;

public class DashBoardDAO {
	private SqlSessionFactory factory = SqlMapConfig.getSqlSession();

	public int selectAttCnt() {
		SqlSession sqlSession = factory.openSession(true);
		System.out.println("result");
		int result = sqlSession.selectOne("selectAttCount");
		sqlSession.close();
		return result;
	}

	public int selectNotAttCnt() {
		SqlSession sqlSession = factory.openSession(true);
		int result = sqlSession.selectOne("selectNotAttCount");
		sqlSession.close();
		return result;
	}

	public int selectLeaveCnt() {
		SqlSession sqlSession = factory.openSession(true);
		int result = sqlSession.selectOne("selectLeaveCount");
		sqlSession.close();
		return result;
	}

	public int selectVacCnt() {
		SqlSession sqlSession = factory.openSession(true);
		int result = sqlSession.selectOne("selectVacCount");
		sqlSession.close();
		return result;
	}
	
}