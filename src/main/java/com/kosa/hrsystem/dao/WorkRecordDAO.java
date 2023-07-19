package com.kosa.hrsystem.dao;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.kosa.hrsystem.dto.RequestHistoryDTO;
import com.kosa.hrsystem.dto.WorkRecordDTO;
import com.kosa.hrsystem.utils.SqlMapConfig;

public class WorkRecordDAO {
	private SqlSessionFactory factory = SqlMapConfig.getSqlSession();

	//내 출퇴근기록 출력
	public List<WorkRecordDTO> selectAllRcd(int empNum) throws Exception {
	    SqlSession sqlSession = factory.openSession(true);
	    List<WorkRecordDTO> list = sqlSession.selectList("selectAllRcd", empNum);
//	    List<RequestHistoryDTO> 
	    sqlSession.close();
	    return list;
	}

    public List<WorkRecordDTO> searchWorkRecByDate(HashMap<String, Object> map) {
		SqlSession sqlSession = factory.openSession();
		List<WorkRecordDTO> list = sqlSession.selectList("searchWorkRecByDate", map);
		sqlSession.close();
		return list;
    }
}
