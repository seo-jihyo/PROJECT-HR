package com.kosa.hrsystem.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kosa.hrsystem.action.ActionForward;
import com.kosa.hrsystem.dao.RequestHistoryDAO;
import com.kosa.hrsystem.dao.UserScheduleDAO;
import com.kosa.hrsystem.dao.VacationDAO;
import com.kosa.hrsystem.dao.WorkScheduleDAO;
import com.kosa.hrsystem.dto.EmpDTO;
import com.kosa.hrsystem.dto.RequestHistoryDTO;
import com.kosa.hrsystem.dto.VacationDTO;
import com.kosa.hrsystem.dto.VacationTypeDTO;
import com.kosa.hrsystem.dto.WorkScheduleDTO;
import com.kosa.hrsystem.dto.WorkScheduleTypeDTO;
import com.kosa.hrsystem.vo.UserScheduleVO;

public class UserScheduleServiceImp implements UserScheduleService{
	
	@Override
	public ActionForward selectUserSchedule(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		
		EmpDTO dto = (EmpDTO) session.getAttribute("login");
		
		int empNum = dto.getEmp_num();
		
		WorkScheduleDAO workdao = new WorkScheduleDAO();
		VacationDAO vacdao = new VacationDAO();
		UserScheduleDAO dao = new UserScheduleDAO();
		
		try {
			List<WorkScheduleTypeDTO> workList = workdao.selectAllWorkType();
			List<VacationTypeDTO> vctnTypeList = vacdao.selectAll();
			List<UserScheduleVO> userSchedule = dao.selectUserSchedule(empNum);
			
			request.setAttribute("workList", workList);	
			request.setAttribute("vctnTypeList", vctnTypeList);	
			request.setAttribute("userSchedule", userSchedule);
			
			System.out.println(userSchedule);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/views/user/userScheduleView.jsp");
		return forward;
	}
	
	@Override
	public ActionForward UserScheduleInsetVac(HttpServletRequest request, HttpServletResponse response) {
		SimpleDateFormat sdfTime = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
		
		HttpSession session = request.getSession();
		
		EmpDTO empdto = (EmpDTO) session.getAttribute("login");
		
		int empNum = empdto.getEmp_num();
		try {
		
			int vctnTypeNum = Integer.parseInt(request.getParameter("vctn_type_num"));
			Date vctnStartDate = sdfTime.parse(request.getParameter("vctn_start_date"));
			Date vctnEndDate = sdfTime.parse(request.getParameter("vctn_end_date"));
			String vctnReason = request.getParameter("vctn_reason");
			
			VacationDTO dto = new VacationDTO();

			dto.setEmp_num(empNum);
			dto.setVctn_type_num(vctnTypeNum);
			dto.setVctn_start_date(vctnStartDate);
			dto.setVctn_end_date(vctnEndDate);
			dto.setVctn_reason(vctnReason);
			
			RequestHistoryDTO reqdto = new RequestHistoryDTO();
			
			char requestType =  request.getParameter("request_type").charAt(0);
			reqdto.setEmp_num(empNum);
			reqdto.setRequest_type(requestType);
			
			RequestHistoryDAO dao = new RequestHistoryDAO();
			dao.insert(reqdto, dto);
			
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("/userSchedule.do");
		return forward;
	}
	
	public ActionForward UserScheduleInsetWork(HttpServletRequest request, HttpServletResponse response) {
		SimpleDateFormat sdfTime = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
		
		HttpSession session = request.getSession();
		
		EmpDTO empdto = (EmpDTO) session.getAttribute("login");
		
		int empNum = empdto.getEmp_num();
		
		try {
			int workType = Integer.parseInt(request.getParameter("ws-type"));
			Date startTime = sdfTime.parse(request.getParameter("startTime"));
			Date endTime = sdfTime.parse(request.getParameter("endTime"));
			String remarks = request.getParameter("ws-area");

			WorkScheduleDTO dto = new WorkScheduleDTO();
			// 관리에 DB값이 저장 되었을 떄 하기로...
			dto.setWork_sch_type_num(workType);
			dto.setGo_work(startTime);
			dto.setLeave_work(endTime);
			dto.setEmp_num(empNum);
			dto.setRemarks(remarks);
			
			RequestHistoryDTO reqdto = new RequestHistoryDTO();
			
			char requestType =  request.getParameter("request_type").charAt(0);
			reqdto.setEmp_num(empNum);
			reqdto.setRequest_type(requestType);
			
			RequestHistoryDAO dao = new RequestHistoryDAO();
			dao.insert(reqdto, dto);

		} catch (ParseException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("/userSchedule.do");
		return forward;
	}
}

