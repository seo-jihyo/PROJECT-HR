package com.kosa.hrsystem.dao;

import com.kosa.hrsystem.dto.DayInfoDTO;
import com.kosa.hrsystem.dto.WorkDTO;
import com.kosa.hrsystem.utils.SqlMapConfig;
import com.kosa.hrsystem.vo.WorkVO;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import java.util.List;

public class WorkDAO {
    private SqlSessionFactory factory = SqlMapConfig.getSqlSession();

    //휴가 일정 유형 전체 조회
    public List<WorkVO> selectAllWork(){
        SqlSession session = factory.openSession();
        List<WorkVO> list= session.selectList("selectAllWork");

        session.close();
        return list;
    }
    //휴가 일정 유형 삽입
    public int insertWork(WorkDTO dto, List<DayInfoDTO> dayInfoDTO, List<DayInfoDTO> holiDayList){
        SqlSession session = factory.openSession();
        int result = 0;
        try{
            result = session.insert("insertWork",dto);
            int workSeq = session.selectOne("selectCurrval");

            for (int i = 0; i < dayInfoDTO.size(); i++) {
                dayInfoDTO.get(i).setWork_num(workSeq);
                session.insert("insertFixedDayList",dayInfoDTO.get(i));
            }

            for (int i = 0; i < holiDayList.size(); i++) {
                holiDayList.get(i).setWork_num(workSeq);
                session.insert("insertHoliDayList",holiDayList.get(i));
            }

            session.commit();
        }catch (Exception e){
            e.printStackTrace();
            session.rollback();
        } finally {
            session.close();
        }

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
