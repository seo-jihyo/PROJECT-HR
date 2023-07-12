package com.kosa.hrsystem.dao;

import com.kosa.hrsystem.dto.AttendanceDTO;
import com.kosa.hrsystem.utils.SqlMapConfig;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

public class AttendanceDAO {
    private SqlSessionFactory factory = SqlMapConfig.getSqlSession();
    public AttendanceDTO checkedAtt(int empNum) {
        SqlSession session = factory.openSession();

        AttendanceDTO dto = session.selectOne("selectByEmpNum",empNum);
        session.close();
        return dto;
    }
    public void insertAttend(AttendanceDTO dto) {
        SqlSession session = factory.openSession(true);
        int result = session.insert("insertAttendance",dto);
        session.close();
    }
    public void updateAttend(AttendanceDTO dto) {
        SqlSession session = factory.openSession(true);
        int result = session.update("updateAttendance",dto);
        session.close();
    }


}
