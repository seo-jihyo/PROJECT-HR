package com.kosa.hrsystem.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kosa.hrsystem.action.Action;
import com.kosa.hrsystem.action.ActionForward;
import com.kosa.hrsystem.dao.EmpDAO;
import com.kosa.hrsystem.dto.EmpDTO;

public class EmpService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		EmpDAO dao = new EmpDAO();
		try {
			
		List<EmpDTO> list = dao.selectAllEmp();
		
		request.setAttribute("list", list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/views/admin/employee/employeeView.jsp");
		return forward;
	}

}
