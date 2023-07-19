package com.kosa.hrsystem.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.kosa.hrsystem.dto.CertificateDTO;
import com.kosa.hrsystem.utils.SqlMapConfig;

public class CertificateDAO {
	
	private SqlSessionFactory factory = SqlMapConfig.getSqlSession();
	
	//  자격증 추가하기
    public int insertCert(CertificateDTO dto) {
    	SqlSession sqlSession = factory.openSession(true);
    	int result = sqlSession.insert("insertCert", dto);
    	sqlSession.close();
    	System.out.println(result);
    	return result;
    }
    
    //  자격증 수정하기
    public int updateCert(CertificateDTO dto) {
    	SqlSession sqlSession = factory.openSession(true);
    	int result = sqlSession.update("updateCert", dto);
    	sqlSession.close();
    	System.out.println(result);
    	return result;
    }
    
    //  자격증 삭제하기
    public int deleteCert(int certNum) {
    	SqlSession sqlSession = factory.openSession(true);
    	int result = sqlSession.delete("deleteCert", certNum);
    	sqlSession.close();
    	System.out.println(result);
    	return result;
    }
    // 관리 - 직원 자격증 삭제하기
    public int deleteCertByCrtfcNumAndIssuer(HashMap<String, String> map) {
    	SqlSession sqlSession = factory.openSession(true);
    	int result = sqlSession.delete("deleteCertByCrtfcNumAndIssuer", map);
    	sqlSession.close();
    	System.out.println(result);
    	return result;
    }
}
