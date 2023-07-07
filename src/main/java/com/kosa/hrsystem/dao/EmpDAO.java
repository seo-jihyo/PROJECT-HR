package com.kosa.hrsystem.dao;

import com.kosa.hrsystem.dto.EmpDTO;
import com.kosa.hrsystem.utils.SqlMapConfig;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import java.util.HashMap;

public class EmpDAO {

    private SqlSessionFactory factory = SqlMapConfig.getSqlSession();

    public EmpDTO selectByEmail(HashMap<String, String> map) {
        SqlSession session =  factory.openSession();

        EmpDTO dto = session.selectOne("selectByEmail",map);

        return dto;
    }

}
