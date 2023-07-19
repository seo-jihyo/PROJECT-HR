package com.kosa.hrsystem.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.kosa.hrsystem.dto.EducationDTO;
import com.kosa.hrsystem.utils.SqlMapConfig;

public class EducationDAO {
	
	private SqlSessionFactory factory = SqlMapConfig.getSqlSession();
	
	//  학력 추가하기
    public int insertCareer(EducationDTO dto) throws Exception {
    	SqlSession sqlSession = factory.openSession(true);
    	int result = sqlSession.insert("insertEdu", dto);
    	sqlSession.close();
    	return result;
    }
}
