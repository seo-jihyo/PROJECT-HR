package com.kosa.hrsystem.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kosa.hrsystem.action.Action;
import com.kosa.hrsystem.action.ActionForward;
import com.kosa.hrsystem.dao.DeptDAO;
import com.kosa.hrsystem.dao.EmpDAO;
import com.kosa.hrsystem.dao.RankDAO;
import com.kosa.hrsystem.dto.CodeTableDTO;
import com.kosa.hrsystem.dto.EmpDTO;

public class EmpService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		EmpDAO dao = new EmpDAO();

		try {
			
		List<EmpDTO> list = dao.selectAllEmp();
		List<CodeTableDTO> optDept= new DeptDAO().selectAllDept();
		List<CodeTableDTO> optRank= new RankDAO().selectAllRank();

		request.setAttribute("list", list);
		request.setAttribute("optDept",optDept);
		request.setAttribute("optRank",optRank);
		} catch (Exception e) {
			e.printStackTrace();
		}
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/views/admin/employee/employeeView.jsp");
		return forward;
	}

}
