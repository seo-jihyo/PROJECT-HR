package com.kosa.hrsystem.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kosa.hrsystem.action.ActionForward;
import com.kosa.hrsystem.dao.WorkRecordDAO;
import com.kosa.hrsystem.dto.EmpDTO;
import com.kosa.hrsystem.dto.RequestDTO;
import com.kosa.hrsystem.dto.WorkRecordDTO;

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

	@Override
	public ActionForward insertRcd(HttpServletRequest request, HttpServletResponse response) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat sdfTime = new SimpleDateFormat("yyyy-MM-dd HH:mm");

		try {
		    int att_status = 0;
		    
		    int emp_num = Integer.parseInt(request.getParameter("emp_num"));
		    char request_type = request.getParameter("request_type").charAt(0);
		    String cmt_date = request.getParameter("cmt_date");
		    Date go_work = sdfTime.parse(cmt_date + " " + request.getParameter("go_time"));
		    Date leave_work = sdfTime.parse(cmt_date + " " + request.getParameter("leave_time"));

		    WorkRecordDTO dto = new WorkRecordDTO();
		    dto.setGo_work(go_work);
		    dto.setLeave_work(leave_work);
		    
		    RequestDTO requestDTO = new RequestDTO();
		    requestDTO.setEmp_num(emp_num);
		    requestDTO.setRequest_type(request_type);		   

		} catch (Exception e) {
		    e.printStackTrace();
		}

		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("/workrecord.do");
		return forward;
	}

	@Override
	public ActionForward updateRcd(HttpServletRequest request, HttpServletResponse response) {
		return null;
	}

	@Override
	public ActionForward deleteRcd(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		return null;
	}
}