package com.kosa.hrsystem.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Objects;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.kosa.hrsystem.action.ActionForward;
import com.kosa.hrsystem.dao.RequestHistoryDAO;
import com.kosa.hrsystem.dao.WorkRecordDAO;
import com.kosa.hrsystem.dao.WorkScheduleDAO;
import com.kosa.hrsystem.dto.EmpDTO;
import com.kosa.hrsystem.dto.RequestHistoryDTO;
import com.kosa.hrsystem.dto.WorkRecordDTO;
import com.kosa.hrsystem.vo.CommuteRecordVO;
import com.kosa.hrsystem.vo.WorkScheduleVO;

public class WorkRecordServiceImp implements WorkRecordService {

	@Override
	public ActionForward selectAllRcd(HttpServletRequest request, HttpServletResponse response) {
	    HttpSession session = request.getSession();
	    EmpDTO edto = (EmpDTO) session.getAttribute("login");
	    WorkRecordDAO dao = new WorkRecordDAO();

	    try {
	        int empNum = edto.getEmp_num();
	        List<WorkRecordDTO> list = dao.selectAllRcd(empNum);
	        System.out.println("list: " + list);
	        request.setAttribute("rcdlist", list); 
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    ActionForward forward = new ActionForward();
	    forward.setRedirect(false);
	    forward.setPath("/views/user/workRecord/workRecordView.jsp");
	    return forward;
	}

	//사용자 출퇴근기록 추가 요청
	@Override
	public ActionForward insertRcd(HttpServletRequest request, HttpServletResponse response) {
	    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	    SimpleDateFormat sdfTime = new SimpleDateFormat("yyyy-MM-dd HH:mm");

	    try {
	   	 HttpSession session = request.getSession();
	     EmpDTO empdto = (EmpDTO) session.getAttribute("login");
	     int empNum = empdto.getEmp_num();
	     System.out.println("empnum: " + empNum);
			
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
			vo.setEmp_num(empNum);
			vo.setGo_work(go_work);
			vo.setLeave_work(leave_work);
			
			
	        RequestHistoryDTO reqdto = new RequestHistoryDTO();
	        reqdto.setEmp_num(empNum);
	        reqdto.setRequest_type('A'); 

	        RequestHistoryDAO dao = new RequestHistoryDAO();
	        dao.insert(reqdto, vo);
	        System.out.println("reqdto: " + reqdto);
	        System.out.println("vo: " + vo);
	    } catch (Exception e) {
	        throw new RuntimeException(e);
	    }
	    ActionForward forward = new ActionForward();
	    forward.setRedirect(true);
	    forward.setPath("/workrecord.do");
	    return forward;
	}

	@Override
	public void searchWorkRecByDate(HttpServletRequest request, HttpServletResponse response) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		String startDate = request.getParameter("datepicker1");
		String endDate = request.getParameter("datepicker2");

		try {
			HttpSession session = request.getSession();
			EmpDTO empdto = (EmpDTO) session.getAttribute("login");
			int empNum = empdto.getEmp_num();
			HashMap<String, Object> map = new HashMap<>();
			map.put("startDate", sdf.parse(startDate));
			map.put("endDate", sdf.parse(endDate));
			map.put("empNum", empNum);

			WorkRecordDAO dao = new WorkRecordDAO();
			List<WorkRecordDTO> list = dao.searchWorkRecByDate(map);

			Gson gson = new Gson();
			String json = gson.toJson(list);
			System.out.println(json);

			// jsonArr.add(json);
// 			System.out.println(json.toJSONString());
			response.setContentType("application/json");
			response.setCharacterEncoding("utf-8");
			response.getWriter().print(json);

		} catch (ParseException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}