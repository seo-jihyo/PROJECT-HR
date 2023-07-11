package com.kosa.hrsystem.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kosa.hrsystem.action.Action;
import com.kosa.hrsystem.action.ActionForward;
import com.kosa.hrsystem.dao.RankDAO;
import com.kosa.hrsystem.dto.CodeTableDTO;

public class RankOkService implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		// 추가하기 
		String parentCode = request.getParameter("parent_code");
		String codeName = request.getParameter("code_name");
		String codeValue = request.getParameter("code_value");
		String remarks = request.getParameter("remarks");
		
		CodeTableDTO dto = new CodeTableDTO();
		dto.setParent_code(parentCode);
		dto.setCode_name(codeName);
		dto.setCode_value(codeValue);
		dto.setRemarks(remarks);

		RankDAO dao = new RankDAO(); 
		try {
			dao.insertRank(dto);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}

		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("/rank.do");
		return forward;
	}
}
