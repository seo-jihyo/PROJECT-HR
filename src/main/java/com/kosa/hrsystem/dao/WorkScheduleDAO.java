package com.kosa.hrsystem.dao;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import com.kosa.hrsystem.dto.RequestHistoryDTO;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.kosa.hrsystem.dto.WorkScheduleDTO;
import com.kosa.hrsystem.dto.WorkScheduleTypeDTO;
import com.kosa.hrsystem.utils.SqlMapConfig;
import com.kosa.hrsystem.vo.WorkScheduleVO;

public class WorkScheduleDAO {
    private SqlSessionFactory factory = SqlMapConfig.getSqlSession();

    public int insertWorkSchedule(WorkScheduleDTO dto, RequestHistoryDTO reqDTO) {
        SqlSession sqlSession = factory.openSession();
        int result = 0;
        int seq = 0;
        try {
            result = sqlSession.insert("insertWorkSchedule", dto);
            seq = sqlSession.selectOne("selectWorkSchCurrval");

            reqDTO.setState('1');
            reqDTO.setRequest_type('W');
            reqDTO.setApprover_note("자동승인");
            reqDTO.setRequest_num(seq);
            sqlSession.insert("insertRequest", reqDTO);
            sqlSession.commit();
        }catch (Exception e){

            sqlSession.rollback();
            e.printStackTrace();
        } finally {
            sqlSession.close();
        }

        //insertRequest

        return result;
    }

    public int updateWorkSchedule(WorkScheduleDTO dto) {
        SqlSession sqlSession = factory.openSession(true);
        int result = sqlSession.update("updateWorkSchedule", dto);
        sqlSession.close();
        return result;
    }

    public int deleteWorkSchedule(int work_sch_num) {
        SqlSession sqlSession = factory.openSession(true);
        int result = sqlSession.delete("deleteWorkSchedule", work_sch_num);
        System.out.println("delete" + result);
        sqlSession.close();
        return result;
    }

    public List<WorkScheduleVO> selectAllWorkSchedule() throws Exception {
        SqlSession sqlSession = factory.openSession(true);
        List<WorkScheduleVO> list = null;
        list = sqlSession.selectList("selectAllWorkSchedule");
        sqlSession.close();
        return list;
    }

    // 통합 검색
    public List<WorkScheduleVO> searchTotal(HashMap<String, String> map) {
        SqlSession sqlSession = factory.openSession(true);
        List<WorkScheduleVO> list = sqlSession.selectList("searchTotal", map);
        System.out.println("통합검색 : " + list);
        sqlSession.close();
        return list;
    }

    public List<WorkScheduleVO> searchByDate(HashMap<String, Date> map) throws Exception {
        SqlSession sqlSession = factory.openSession(true);
        List<WorkScheduleVO> list = null;
        list = sqlSession.selectList("searchByDate", map);
        System.out.println(list + "...... ");
        sqlSession.close();
        return list;
    }


    // WorkScheduleType - read
    public List<WorkScheduleTypeDTO> selectAllWorkType() throws Exception {
        SqlSession sqlSession = factory.openSession(true);
        List<WorkScheduleTypeDTO> list = null;
        list = sqlSession.selectList("selectAllWorkType");
        sqlSession.close();
        return list;

    }

    // WorkScheduleType - insert
    public int insertWorkScheduleType(WorkScheduleTypeDTO dto) throws Exception {
        SqlSession sqlSession = factory.openSession(true); // 자동커밋
        int result = sqlSession.insert("insertWorkScheduleType", dto);
        System.out.println(result);

        sqlSession.commit(); //수동커밋인 경우
        sqlSession.close();
        return result;
    }

    // WorkScheduleType - update
    public int updateWorkScheduleType(WorkScheduleTypeDTO dto) throws Exception {
        SqlSession sqlSession = factory.openSession(true);
        int result = sqlSession.update("updateWorkScheduleType", dto);
        sqlSession.close();
        return result;
    }

    // WorkScheduleType - delete
    public int deleteWorkScheduleType(int work_sch_type_num) throws Exception {
        SqlSession sqlSession = factory.openSession(true);
        int result = sqlSession.delete("deleteWorkScheduleType", work_sch_type_num);
        sqlSession.close();
        System.out.println(result);
        return result;
    }


}
