package com.kosa.hrsystem.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.kosa.hrsystem.dto.CareerDTO;
import com.kosa.hrsystem.dto.EmpDTO;
import com.kosa.hrsystem.utils.SqlMapConfig;

public class CareerDAO {
	
	private SqlSessionFactory factory = SqlMapConfig.getSqlSession();
	
	//  경력 추가하기
    public int insertCareer(CareerDTO dto) throws Exception {
    	SqlSession sqlSession = factory.openSession(true);
    	int result = sqlSession.insert("insertCareer", dto);
    	sqlSession.close();
    	System.out.println(result);
    	return result;
    }
}
