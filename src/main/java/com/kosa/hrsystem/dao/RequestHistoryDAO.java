package com.kosa.hrsystem.dao;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import com.kosa.hrsystem.vo.RequestHistoryVO;
import com.kosa.hrsystem.vo.WorkScheduleVO;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.kosa.hrsystem.dto.RequestHistoryDTO;
import com.kosa.hrsystem.utils.SqlMapConfig;

public class RequestHistoryDAO {

	private SqlSessionFactory factory = SqlMapConfig.getSqlSession();
	
	public List<RequestHistoryVO> selectAllRequest() {
		SqlSession sqlSession = factory.openSession();
		List<RequestHistoryVO> list = sqlSession.selectList("selectAllRequest");
		sqlSession.close();
		return list;
	}

	public int insert(RequestHistoryDTO reqDTO, Object dto) {
		SqlSession sqlSession = factory.openSession();
		int result = 0;
		int seq = 0;
		try {
			switch (reqDTO.getRequest_type()){
				case 'V': // 휴가
					result = sqlSession.insert("insertVacation",dto);
					seq = sqlSession.selectOne("selectVctnCurrval");
					break;
				case 'W': // 근무일정
					result = sqlSession.insert("insertWorkSchedule",dto);
					seq = sqlSession.selectOne("selectWorkSchCurrval");
					break;
				case 'A': // 근태
					result = sqlSession.insert("insertRecord",dto);
					seq = sqlSession.selectOne("selectAttCurrval");
					break;
			}
			// 사원번호, 요청종류, 상태=0
			reqDTO.setRequest_num(seq);
			reqDTO.setState('0');
			sqlSession.insert("insertRequest",reqDTO);
			sqlSession.commit();
		} catch (Exception e){
			sqlSession.rollback();
			e.printStackTrace();
			return 0; // 요청 실패
		} finally {
			sqlSession.close();
		}
		return result;
	}

	public int update(HashMap<String, Object> map) {
		SqlSession sqlSession = factory.openSession(true);
		int result = sqlSession.update("updateRequest",map);

		sqlSession.close();
		return result;
	}

	public List<RequestHistoryVO> selectAllByEmp(int empNum) {
		SqlSession sqlSession = factory.openSession();
		List<RequestHistoryVO> list = sqlSession.selectList("selectAllByEmp",empNum);
		sqlSession.close();
		return list;
	}
	// 대쉬보드에 최대 5개까지 리스트 출력
	public List<RequestHistoryVO> selectRequestHistoryTop5() {
		SqlSession sqlSession = factory.openSession(true);
		List<RequestHistoryVO> list = sqlSession.selectList("selectRequestHistoryTop5");
		sqlSession.close();
		return list;
	}
	
	// 요청내역 미승인 개수 출력
	public int selectNonApproveCount() {
		SqlSession sqlSession = factory.openSession();
		int result = sqlSession.selectOne("selectNonApproveCount");
		sqlSession.close();
		return result;
	}
	
	// 통합 검색
	public List<RequestHistoryVO> searchTotalRequestHistory(HashMap<String, String> map) {
		SqlSession sqlSession = factory.openSession(true);
		List<RequestHistoryVO> list = sqlSession.selectList("searchTotalRequestHistory",map);
		System.out.println("통합검색 : " + list);
		sqlSession.close();
		return list;
	}
	
	// 날짜 검색
	public List<RequestHistoryVO> searchByDateRequestHistory(HashMap<String, Date> map) throws Exception {
		SqlSession sqlSession = factory.openSession(true);
		List<RequestHistoryVO> list = null;
		list = sqlSession.selectList("searchByDateRequestHistory", map);
		System.out.println(list + "...... ");
		sqlSession.close();
		return list;
	}
}