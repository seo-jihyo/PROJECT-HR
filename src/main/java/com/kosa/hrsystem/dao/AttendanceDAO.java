package com.kosa.hrsystem.dao;

import com.kosa.hrsystem.dto.AttendanceDTO;
import com.kosa.hrsystem.utils.SqlMapConfig;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

public class AttendanceDAO {
    private SqlSessionFactory factory = SqlMapConfig.getSqlSession();

    public void insertAttend(AttendanceDTO dto) {
        SqlSession session = factory.openSession(true);
        int result = session.insert("insertAttendance",dto);
    }

    public void updateAttend(AttendanceDTO dto) {
        SqlSession session = factory.openSession(true);
        int result = session.update("updateAttendance",dto);
    }
}
