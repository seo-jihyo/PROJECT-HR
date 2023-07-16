package com.kosa.hrsystem.dao;

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
}
