package com.kosa.hrsystem.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.kosa.hrsystem.dto.WorkScheduleDTO;
import com.kosa.hrsystem.utils.SqlMapConfig;

public class WorkScheduleDAO {
	private SqlSessionFactory factory = SqlMapConfig.getSqlSession();
	
	public int insertWorkSchedule(WorkScheduleDTO dto) {
		SqlSession sqlSession = factory.openSession(true);
		int result = sqlSession.insert("insertWorkSchedule",dto);
		System.out.println(result);
		sqlSession.close();
		return result;
	}
	
	public List<WorkScheduleDTO> selectAllWorkSchedule() throws Exception {
		SqlSession sqlSession = factory.openSession(true);
		List<WorkScheduleDTO> list = null;
		list = sqlSession.selectList("selectAllWorkSchedule");
		sqlSession.close();
		return list;
	}
}
