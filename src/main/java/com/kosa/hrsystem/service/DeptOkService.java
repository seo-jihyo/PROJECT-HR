package com.kosa.hrsystem.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kosa.hrsystem.action.Action;
import com.kosa.hrsystem.action.ActionForward;
import com.kosa.hrsystem.dao.DeptDAO;
import com.kosa.hrsystem.dto.CodeTableDTO;

public class DeptOkService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		// 추가하기 
		String parentCode = request.getParameter("parent_code");
		String codeName = request.getParameter("code_name");
		String codeValue = request.getParameter("code_value");
		String remarks = request.getParameter("remarks");
		
		CodeTableDTO dto = new CodeTableDTO(parentCode, codeName, codeValue, 0, remarks);
		DeptDAO dao = new DeptDAO();
		try {
			dao.insertDept(dto);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
		return null;
		
	}

}
