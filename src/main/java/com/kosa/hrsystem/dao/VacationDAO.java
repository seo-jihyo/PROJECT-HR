package com.kosa.hrsystem.dao;

import com.kosa.hrsystem.dto.VacationDTO;
import com.kosa.hrsystem.dto.VacationTypeDTO;
import com.kosa.hrsystem.utils.SqlMapConfig;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import java.util.List;

public class VacationDAO {
    private SqlSessionFactory factory = SqlMapConfig.getSqlSession();
    //휴가 일정 유형 전체 조회
    public List<VacationTypeDTO> selectAll(){
        SqlSession session = factory.openSession();
        List<VacationTypeDTO> list= session.selectList("selectAll");

        session.close();
        return list;
    }
    //휴가 일정 유형 삽입
    public int insertVctnType(VacationTypeDTO dto){
        SqlSession session = factory.openSession();
        int result = session.insert("insertVctnType",dto);
        System.out.println(result);
        
        session.close();
        return result;
    }
    //휴가 일정 유형 수정
    public int updateVctnType(VacationTypeDTO dto){
        SqlSession session = factory.openSession();
        int result = session.insert("updateVctnType",dto);

        session.close();
        return result;
    }
    //휴가 일정 유형 삭제
    public int deleteVctnType(int num){
        SqlSession session = factory.openSession();
        int result = session.insert("deleteVctnType",num);

        session.close();
        return result;
    }
}
