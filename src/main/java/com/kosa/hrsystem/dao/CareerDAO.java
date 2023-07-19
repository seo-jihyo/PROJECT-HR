package com.kosa.hrsystem.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.kosa.hrsystem.dto.CareerDTO;
import com.kosa.hrsystem.dto.EmpDTO;
import com.kosa.hrsystem.utils.SqlMapConfig;

public class CareerDAO {
	
	private SqlSessionFactory factory = SqlMapConfig.getSqlSession();
	
	// 경력 출력하기
	public List<CareerDTO> selectCareer(int empNum) throws Exception {
    	SqlSession sqlSession = factory.openSession(true);
    	List<CareerDTO> list = sqlSession.selectList("selectCareer", empNum);
    	sqlSession.close();
    	return list;
    }
	
	//  경력 추가하기
    public int insertCareer(CareerDTO dto) throws Exception {
    	SqlSession sqlSession = factory.openSession(true);
    	int result = sqlSession.insert("insertCareer", dto);
    	sqlSession.close();
    	System.out.println(result);
    	return result;
    }
    
    public int updateCareer(CareerDTO dto) throws Exception {
    	SqlSession sqlSession = factory.openSession(true);
    	int result = sqlSession.update("updateCareer", dto);
    	sqlSession.close();
    	System.out.println(result);
    	return result;
    }
    
    public int deleteCareer(int careerNum) throws Exception {
    	SqlSession sqlSession = factory.openSession(true);
    	int result = sqlSession.delete("deleteCareer", careerNum);
    	sqlSession.close();
    	System.out.println(result);
    	return result;
    }
    
    public int deleteCareerByCompanyName(String companyName) throws Exception {
    	SqlSession sqlSession = factory.openSession(true);
    	int result = sqlSession.delete("deleteCareerByCompanyName", companyName);
    	sqlSession.close();
    	System.out.println(result);
    	return result;
    }
}
