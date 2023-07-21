package com.kosa.hrsystem.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kosa.hrsystem.dto.RequestHistoryDTO;
import org.apache.ibatis.session.SqlSession;

import com.google.gson.Gson;
import com.kosa.hrsystem.action.ActionForward;
import com.kosa.hrsystem.dao.CommuteRecordDAO;
import com.kosa.hrsystem.dao.EmpDAO;
import com.kosa.hrsystem.dao.WorkScheduleDAO;
import com.kosa.hrsystem.dto.EmpDTO;
import com.kosa.hrsystem.vo.CommuteRecordVO;
import com.kosa.hrsystem.vo.EmpVO;
import com.kosa.hrsystem.vo.WorkScheduleVO;

public class CommuteRecordServiceImp implements CommuteRecordService {

	/* 출퇴근 기록 */
	@Override
	public ActionForward selectAll(HttpServletRequest request, HttpServletResponse response) {
		CommuteRecordDAO dao = new CommuteRecordDAO();
		try {

			List<EmpVO> empList = new EmpDAO().selectAllEmp();
			List<CommuteRecordVO> list = dao.selectAllRecord();
			request.setAttribute("list", list);
			request.setAttribute("empList", empList);

			ActionForward forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/views/admin/attendance/attendanceView.jsp");
			return forward;
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	@Override
	public ActionForward insert(HttpServletRequest request, HttpServletResponse response) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat sdfTime = new SimpleDateFormat("yyyy-MM-dd HH:mm");

		try {
			int emp_num = Integer.parseInt(request.getParameter("emp_num"));
			
			int att_status = 0;
			String cmt_date = request.getParameter("cmt_date");
			Date go_work = sdfTime.parse(cmt_date + " " + request.getParameter("go_work"));
			Date leave_work = null;
			
				if (request.getParameter("leave_work") == null) {
					 att_status = 1;
				}else {
					 leave_work = sdfTime.parse(cmt_date + " " + request.getParameter("leave_work"));
				}
			CommuteRecordVO vo = new CommuteRecordVO();
			vo.setEmp_num(emp_num);
			vo.setGo_work(go_work);
			vo.setLeave_work(leave_work);
			vo.setAtt_status(String.valueOf(att_status));

			RequestHistoryDTO reqDTO = new RequestHistoryDTO();
			reqDTO.setEmp_num(emp_num);

			CommuteRecordDAO dao = new CommuteRecordDAO();
			dao.insertRecord(vo,reqDTO);
		} catch (ParseException e) {
			e.printStackTrace();
		} catch (Exception e) {
			throw new RuntimeException(e);
		} // 뷰페이지설정
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("/cmtrecord.do");
		
		return forward;
	}

	@Override
	public ActionForward update(HttpServletRequest request, HttpServletResponse response) {
	    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	    SimpleDateFormat sdfTime = new SimpleDateFormat("yyyy-MM-dd HH:mm");

	    try {
	    	int att_status = 0;
	    	
	    	int att_num = Integer.parseInt(request.getParameter("att_num"));
			int emp_num = Integer.parseInt(request.getParameter("emp_num"));
			String cmt_date = request.getParameter("cmt_date");
			Date go_work = sdfTime.parse(cmt_date + " " + request.getParameter("go_time"));
			Date leave_work = sdfTime.parse(cmt_date + " " + request.getParameter("leave_time"));

			CommuteRecordVO vo = new CommuteRecordVO();
			vo.setAtt_num(att_num);
 			vo.setEmp_num(emp_num);
			vo.setGo_work(go_work);
			vo.setLeave_work(leave_work);
			
			CommuteRecordDAO dao = new CommuteRecordDAO();
			dao.updateRecord(vo);

		} catch (ParseException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("/cmtrecord.do");
		return forward;   
	}


	@Override
	public ActionForward delete(HttpServletRequest request, HttpServletResponse response) {
		int att_num = Integer.parseInt(request.getParameter("att_num"));
		CommuteRecordDAO dao = new CommuteRecordDAO();
		try {
			dao.deleteRecord(att_num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("/cmtrecord.do");
		return forward;
	}

	@Override
	public void searchByDateAtt(HttpServletRequest request, HttpServletResponse response) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		String startDate = request.getParameter("datepicker1");
		String endDate = request.getParameter("datepicker2");
		
		try {
			HashMap<String, Date> map = new HashMap<>();
			map.put("startDate", sdf.parse(startDate));
			map.put("endDate", sdf.parse(endDate));

			CommuteRecordDAO dao = new CommuteRecordDAO();
			List<CommuteRecordVO> list = dao.searchByDateAtt(map);

            Gson gson = new Gson();
            String json = gson.toJson(list);
            System.out.println(json);
            
			response.setContentType("application/json");
			response.setCharacterEncoding("utf-8");
			response.getWriter().print(json);

		} catch (ParseException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void searchTotalAtt(HttpServletRequest request, HttpServletResponse response) {
		String searchType = request.getParameter("searchType");
		String searchWord = request.getParameter("searchWord");
		System.out.println(searchType); System.out.println(searchWord);
		try {
			HashMap<String, String> map = new HashMap<>();
			map.put("searchType", searchType);
			map.put("searchWord", searchWord);
			
			CommuteRecordDAO dao = new CommuteRecordDAO();
			List<CommuteRecordVO> list = dao.searchTotalAtt(map);
			
			Gson gson = new Gson();
			String json = gson.toJson(list);
			System.out.println(json);
			
			response.setContentType("application/json");
			response.setCharacterEncoding("utf-8");
			response.getWriter().print(json);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
