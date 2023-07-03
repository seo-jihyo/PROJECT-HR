package com.kosa.hrsystem.dao;

import com.kosa.hrsystem.dto.testDTO;
import com.kosa.hrsystem.utils.SqlMapConfig;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import java.util.List;

public class testDAO {
    private SqlSessionFactory factory = SqlMapConfig.getSqlSession();

    public List<testDTO> selectDataAll() throws Exception{
        SqlSession sqlSession = factory.openSession(); // 세션 열기(DB처리를 위한 작업단위)
        List<testDTO> list = sqlSession.selectList("selectDataAll"); // DataMapper의 id를 가져온다.
        // selectList() : 여러개 리턴
        // selectOne() : 1개 리턴
        sqlSession.close();
        return list; // sql의 결과를 가진다.
    }

    public int insertData(testDTO dto) throws Exception{
        //SqlSession sqlSession = factory.openSession(); // 수동 commit.
        SqlSession sqlSession = factory.openSession(true); // 자동 commit.
        int result = sqlSession.insert("insertData",dto);
        if(result == 0) {
            sqlSession.rollback();
        }else {
            //sqlSession.commit();
        }
        sqlSession.close();
        return result;
    }
}
