package com.kosa.hrsystem.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kosa.hrsystem.action.Action;
import com.kosa.hrsystem.action.ActionForward;
import com.kosa.hrsystem.dao.DeptDAO;
import com.kosa.hrsystem.dto.CodeTableDTO;

public class DeptService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		DeptDAO dao = new DeptDAO();
		try {
			List<CodeTableDTO> list = dao.selectAllDept();
			
			request.setAttribute("list", list);
			ActionForward forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/views/admin/duty/dutyView.jsp");
			return forward;
		} catch (Exception e) {
			throw new RuntimeException();
		}
	}

}
