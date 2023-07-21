package com.kosa.hrsystem.dao;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import com.kosa.hrsystem.dto.RequestHistoryDTO;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.kosa.hrsystem.dto.VacationDTO;
import com.kosa.hrsystem.dto.VacationTypeDTO;
import com.kosa.hrsystem.utils.SqlMapConfig;
import com.kosa.hrsystem.vo.VacationVO;
import com.kosa.hrsystem.vo.WorkScheduleVO;

public class VacationDAO {
    private SqlSessionFactory factory = SqlMapConfig.getSqlSession();
    // 휴가 관리자 조회
    public List<VacationVO> selectAllVacation(){
        SqlSession session = factory.openSession(true);
        List<VacationVO> list= session.selectList("selectAllVacation");
        
        session.close();
        return list;
    }
    //휴가 관리자 삽입
    public int insertVacation(VacationDTO dto, RequestHistoryDTO reqDTO) throws Exception {
        SqlSession session = factory.openSession(true);
        int result = 0;
        int seq = 0;
        try {
            result = session.insert("insertVacation",dto);
            seq = session.selectOne("selectVctnCurrval");

            reqDTO.setState('1');
            reqDTO.setRequest_type('V');
            reqDTO.setApprover_note("자동승인");
            reqDTO.setRequest_num(seq);
            HashMap<String ,Integer> map = new HashMap<>();
            map.put("empNum",dto.getEmp_num());
            map.put("vctnNum",dto.getVctn_num());
            System.out.println(map);
            session.update("updateCalcVac",map);
            session.insert("insertRequest", reqDTO);
            session.commit();
        }catch (Exception e){
            session.rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
        return result;
    }
    
    //휴가 관리자 수정
    public int updateVacation(VacationDTO dto) throws Exception {
        SqlSession session = factory.openSession(true);
        int result = session.update("updateVacation",dto);

        session.close();
        return result;
    }
    
    // 휴가 관리자 삭제
    public int deleteVacation(int num) throws Exception {
    	SqlSession session = factory.openSession(true);
        int result = session.delete("deleteVacation",num);

        session.close();
        return result;
    }
    
    //휴가 일정 유형 전체 조회
    public List<VacationTypeDTO> selectAll(){
        SqlSession session = factory.openSession(true);
        List<VacationTypeDTO> list= session.selectList("selectAll");

        session.close();
        return list;
    }
    //휴가 일정 유형 삽입
    public int insertVctnType(VacationTypeDTO dto) throws Exception {
        SqlSession session = factory.openSession(true);
        int result = session.insert("insertVctnType",dto);
        System.out.println(result);
        
        session.close();
        return result;
    }
    //휴가 일정 유형 수정
    public int updateVctnType(VacationTypeDTO dto) throws Exception {
        SqlSession session = factory.openSession(true);
        int result = session.update("updateVctnType",dto);

        session.close();
        return result;
    }
    //휴가 일정 유형 삭제
    public int deleteVctnType(int num) throws Exception {
        SqlSession session = factory.openSession(true);
        int result = session.delete("deleteVctnType",num);

        session.close();
        return result;
    }
    //통합 검색
	public List<VacationVO> searchTotal(HashMap<String, String> map) {
		SqlSession sqlSession = factory.openSession(true);
		List<VacationVO> list = sqlSession.selectList("searchVacTotal",map);
		System.out.println("통합검색 : " + list);
		sqlSession.close();
		return list;
	}
	//날짜 검색
	public List<VacationVO> searchVacByDate(HashMap<String, Date> map) throws Exception {
		SqlSession sqlSession = factory.openSession(true);
		List<VacationVO> list = null;
		list = sqlSession.selectList("searchVacByDate", map);
		System.out.println(list + "...... ");
		sqlSession.close();
		return list;
	}
}
