package com.kosa.hrsystem.dao;

import com.kosa.hrsystem.dto.VacationTypeDTO;
import com.kosa.hrsystem.dto.WorkDTO;
import com.kosa.hrsystem.utils.SqlMapConfig;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import java.util.List;

public class WorkDAO {
    private SqlSessionFactory factory = SqlMapConfig.getSqlSession();
    //휴가 일정 유형 전체 조회
    public List<WorkDTO> selectAll(){
        SqlSession session = factory.openSession();
        List<WorkDTO> list= session.selectList("selectAll");

        session.close();
        return list;
    }
    //휴가 일정 유형 삽입
    public int insertWork(WorkDTO dto){
        SqlSession session = factory.openSession();
        int result = session.insert("insertWork",dto);

        session.close();
        return result;
    }
    //휴가 일정 유형 수정
    public int updateWork(WorkDTO dto){
        SqlSession session = factory.openSession();
        int result = session.insert("updateWork",dto);

        session.close();
        return result;
    }
    //휴가 일정 유형 삭제
    public int deleteWork(int num){
        SqlSession session = factory.openSession();
        int result = session.insert("deleteWork",num);

        session.close();
        return result;
    }
}
