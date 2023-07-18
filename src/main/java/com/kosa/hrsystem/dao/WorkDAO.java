package com.kosa.hrsystem.dao;

import com.kosa.hrsystem.dto.DayInfoDTO;
import com.kosa.hrsystem.dto.WorkDTO;
import com.kosa.hrsystem.utils.SqlMapConfig;
import com.kosa.hrsystem.vo.WorkVO;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionException;
import org.apache.ibatis.session.SqlSessionFactory;

import java.util.List;

public class WorkDAO {
    private SqlSessionFactory factory = SqlMapConfig.getSqlSession();

    public List<WorkVO> selectAllWork(){
        SqlSession session = factory.openSession();
        List<WorkVO> list= session.selectList("selectAllWork");

        session.close();
        return list;
    }
    public int insertWork(WorkDTO dto, List<DayInfoDTO> fixedDayList, List<DayInfoDTO> holiDayList){
        SqlSession session = factory.openSession();
        int result = 0;
        try{
            result = session.insert("insertWork",dto);
            int workSeq = session.selectOne("selectWorkCurrval");

            for (int i = 0; i < fixedDayList.size(); i++) {
                fixedDayList.get(i).setWork_num(workSeq);
                session.insert("insertFixedDayList",fixedDayList.get(i));
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
    public int updateWork(WorkDTO dto, List<DayInfoDTO> fixedDayList, List<DayInfoDTO> holiDayList){
        SqlSession session = factory.openSession();
        int result = 0;
        try{
            int workSeq = dto.getWork_num();
            result = session.update("updateWork",dto);

            session.delete("deleteFixedDay", workSeq);
            session.delete("deleteHoliday", workSeq);

            for (int i = 0; i < fixedDayList.size(); i++) {
                session.insert("insertFixedDayList",fixedDayList.get(i));
            }

            for (int i = 0; i < holiDayList.size(); i++) {
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
    public int deleteWork(int num){
        SqlSession session = factory.openSession(true);
        int result=0;
        try {
            result= session.delete("deleteWork",num);
        }catch (SqlSessionException e){
            e.printStackTrace();
        } finally {
            session.close();
        }
        return result;
    }
}
