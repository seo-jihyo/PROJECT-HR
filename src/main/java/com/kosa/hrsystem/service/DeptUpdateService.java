package com.kosa.hrsystem.service;

import com.kosa.hrsystem.action.Action;
import com.kosa.hrsystem.action.ActionForward;
import com.kosa.hrsystem.dao.DeptDAO;
import com.kosa.hrsystem.dto.CodeTableDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DeptUpdateService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		// 추가하기 
		String codeName = request.getParameter("code_name");
		String codeValue = request.getParameter("code_value");
		String remarks = request.getParameter("remarks");
		
		CodeTableDTO dto = new CodeTableDTO();
		dto.setCode_name(codeName);
		dto.setCode_value(codeValue);
		dto.setRemarks(remarks);

		DeptDAO dao = new DeptDAO();
		try {
			dao.updateDept(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("/dept.do");
		return forward;
		
	}

}
