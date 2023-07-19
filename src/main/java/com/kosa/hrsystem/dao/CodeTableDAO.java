package com.kosa.hrsystem.dao;

import com.kosa.hrsystem.dto.CodeTableDTO;
import com.kosa.hrsystem.utils.SqlMapConfig;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import java.util.List;

public class CodeTableDAO {
    private SqlSessionFactory factory = SqlMapConfig.getSqlSession();

    // 부서 리스트 출력
    public List<CodeTableDTO> selectAllByParent(String codeName) {
        SqlSession sqlSession = factory.openSession(true);
        List<CodeTableDTO> list = null;
        list = sqlSession.selectList("selectAllByParent",codeName);
        sqlSession.close();
        return list;
    }

    // 부서 추가하기
    public int insertCodeTable(CodeTableDTO dto) throws Exception {
        SqlSession sqlSession = factory.openSession(true);
        int result = sqlSession.insert("insertCodeTable", dto);
        System.out.println(result);
        sqlSession.close();
        return result;
    }

    // 부서 수정하기
    public int updateCodeTable(CodeTableDTO dto) throws Exception {
        SqlSession sqlSession = factory.openSession(true);
        int result = sqlSession.update("updateCodeTable", dto);
        sqlSession.close();
        return result;
    }

    // 부서 삭제하기
    public int deleteCodeTable(String codeName) throws Exception {
        SqlSession sqlSession = factory.openSession(true);
        int result = sqlSession.delete("deleteCodeTable", codeName);
        sqlSession.close();
        return result;
    }
}
