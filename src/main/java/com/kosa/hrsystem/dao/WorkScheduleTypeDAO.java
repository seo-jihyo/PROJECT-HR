package com.kosa.hrsystem.dao;

import com.kosa.hrsystem.dto.WorkDTO;
import com.kosa.hrsystem.dto.WorkScheduleDTO;
import com.kosa.hrsystem.utils.SqlMapConfig;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import java.util.List;

public class WorkScheduleTypeDAO {
	private SqlSessionFactory factory = SqlMapConfig.getSqlSession();
	
	public int insertWorkSchedule(WorkScheduleDTO dto) {
		SqlSession sqlSession = factory.openSession(true);
		int result = sqlSession.insert("insertWorkSchedule",dto);
		sqlSession.close();
		return result;
	}
	
	public List<WorkScheduleDTO> selectAllWorkSchedule() {
		SqlSession sqlSession = factory.openSession(true);
		List<WorkScheduleDTO> list = sqlSession.selectList("selectAllWorkSchedule");
		sqlSession.close();
		return list;
	}

	public int updateWorkSchedule(WorkScheduleDTO dto){
		SqlSession session = factory.openSession();
		int result = session.insert("updateWorkSchedule",dto);
		session.close();
		return result;
	}
	//휴가 일정 유형 삭제
	public int deleteWorkSchedule(int num){
		SqlSession session = factory.openSession();
		int result = session.insert("deleteWorkSchedule",num);
		session.close();
		return result;
	}
}
