package com.kosa.hrsystem.dao;

import com.kosa.hrsystem.dto.SalaryDTO;
import com.kosa.hrsystem.utils.SqlMapConfig;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import java.util.List;

public class SalaryDAO {

    private SqlSessionFactory factory = SqlMapConfig.getSqlSession();


    public List<SalaryDTO> selectAllSalary() {
        SqlSession session = factory.openSession();
        List<SalaryDTO> list = session.selectList("selectAllSalary");

        session.close();
        return list;
    }
}
