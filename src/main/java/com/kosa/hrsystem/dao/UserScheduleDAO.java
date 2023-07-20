package com.kosa.hrsystem.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.kosa.hrsystem.dto.VacationTypeDTO;
import com.kosa.hrsystem.utils.SqlMapConfig;
import com.kosa.hrsystem.vo.UserScheduleVO;

public class UserScheduleDAO {
	
	private SqlSessionFactory factory = SqlMapConfig.getSqlSession();
	// 스케줄 휴가 출력
	public List<UserScheduleVO> selectUserSchedule(int empNum) throws Exception {
        SqlSession sqlSession = factory.openSession(true);
        
        List<UserScheduleVO> scheduleList = new ArrayList<>();
        
        List<UserScheduleVO> attlist= sqlSession.selectList("selectAtt", empNum);
        List<UserScheduleVO> vaclist= sqlSession.selectList("selectVac", empNum);
        List<UserScheduleVO> worklist= sqlSession.selectList("selectWork", empNum);
        
        System.out.println(worklist);
        
        scheduleList.addAll(attlist);
        scheduleList.addAll(vaclist);
        scheduleList.addAll(worklist);

        sqlSession.close();
        return scheduleList;
    }
	
}