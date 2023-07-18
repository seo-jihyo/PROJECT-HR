package com.kosa.hrsystem.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kosa.hrsystem.action.ActionForward;
import com.kosa.hrsystem.dao.UserScheduleDAO;
import com.kosa.hrsystem.dto.EmpDTO;
import com.kosa.hrsystem.vo.UserScheduleVO;

public class UserScheduleServiceImp implements UserScheduleService{
	
	@Override
	public ActionForward selectUserSchedule(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		
		EmpDTO dto = (EmpDTO) session.getAttribute("login");
		
		int empNum = dto.getEmp_num();
		
		
		UserScheduleDAO dao = new UserScheduleDAO();
		
		try {
			List<UserScheduleVO> userSchedule = dao.selectUserSchedule(empNum);
			
			request.setAttribute("userSchedule", userSchedule);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/views/user/userScheduleView.jsp");
		return forward;
	}

}
