package com.kosa.hrsystem.dao;

import java.util.List;

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


	public void insertRecord(CommuteRecordVO vo) {
		// TODO Auto-generated method stub
		
	}

}
