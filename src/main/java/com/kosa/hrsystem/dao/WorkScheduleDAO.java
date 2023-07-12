package com.kosa.hrsystem.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.kosa.hrsystem.dto.WorkScheduleDTO;
import com.kosa.hrsystem.dto.WorkScheduleTypeDTO;
import com.kosa.hrsystem.utils.SqlMapConfig;
import com.kosa.hrsystem.vo.WorkScheduleTypeVO;
import com.kosa.hrsystem.vo.WorkScheduleVO;

public class WorkScheduleDAO {
	private SqlSessionFactory factory = SqlMapConfig.getSqlSession();
	
	public int insertWorkSchedule(WorkScheduleDTO dto) {
		SqlSession sqlSession = factory.openSession(true);
		int result = sqlSession.insert("insertWorkSchedule",dto);
		System.out.println(result);
		sqlSession.close();
		return result;
	}
	
	public List<WorkScheduleVO> selectAllWorkSchedule() throws Exception {
		SqlSession sqlSession = factory.openSession(true);
		List<WorkScheduleVO> list = null;
		list = sqlSession.selectList("selectAllWorkSchedule");
		System.out.println("왜안나옴"+list);
		sqlSession.close();
		return list;
	}

	// WorkScheduleType - read
	public List<WorkScheduleTypeVO> selectAllWorkType() throws Exception {
		SqlSession sqlSession = factory.openSession(true);
		List<WorkScheduleTypeVO> list = null;
		list = sqlSession.selectList("selectAllWorkType");
		sqlSession.close();
		return list;
	  
	  }
	// WorkScheduleType - insert
		public int insertWorkScheduleType(WorkScheduleTypeDTO dto) throws Exception {
			SqlSession sqlSession = factory.openSession(true); // 자동커밋
			int result = sqlSession.insert("insertWorkScheduleType", dto);
			System.out.println(result);

			// sqlSession.commit(); 수동커밋인 경우
			sqlSession.close();
			return result;
		}
		// WorkScheduleType - update
		public int updateWorkScheduleType(WorkScheduleTypeDTO dto) throws Exception{
			SqlSession sqlSession = factory.openSession(true);
			int result = sqlSession.update("updateWorkScheduleType", dto);
			sqlSession.close();
			return result;
		}
		// WorkScheduleType - delete
		public int deleteWorkScheduleType(int work_sch_type_num) throws Exception{
			SqlSession sqlSession = factory.openSession(true);
			int result = sqlSession.delete("deleteWorkScheduleType", work_sch_type_num);
			sqlSession.close();
			System.out.println(result);
			return result;
		}
}
