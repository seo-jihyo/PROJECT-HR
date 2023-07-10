package com.kosa.hrsystem.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kosa.hrsystem.action.Action;
import com.kosa.hrsystem.action.ActionForward;
import com.kosa.hrsystem.dao.EmpDAO;
import com.kosa.hrsystem.dto.EmpDTO;

public class EmpDeleteService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		int emp_num = Integer.parseInt(request.getParameter("emp-num"));
		
		EmpDAO dao = new EmpDAO();
		try {
			dao.deleteEmp(emp_num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("/emp.do");
		return forward;
	}

}
