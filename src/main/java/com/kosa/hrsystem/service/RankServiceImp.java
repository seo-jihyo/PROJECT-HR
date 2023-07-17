package com.kosa.hrsystem.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kosa.hrsystem.action.Action;
import com.kosa.hrsystem.action.ActionForward;
import com.kosa.hrsystem.dao.CodeTableDAO;
import com.kosa.hrsystem.dao.RankDAO;
import com.kosa.hrsystem.dto.CodeTableDTO;

public class RankServiceImp implements CodeTableService {
	@Override
	public ActionForward selectAllByParent(HttpServletRequest request, HttpServletResponse response) {
		CodeTableDAO dao = new CodeTableDAO();
		try {
			String codeName = "R001";
			List<CodeTableDTO> list = dao.selectAllByParent(codeName);

			request.setAttribute("list", list);
			ActionForward forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/views/admin/rank/rankView.jsp");
			return forward;
		} catch (Exception e) {
			throw new RuntimeException(e);
		}

	}

	@Override
	public ActionForward insert(HttpServletRequest request, HttpServletResponse response) {
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

		CodeTableDAO dao = new CodeTableDAO();
		try {
			dao.insertCodeTable(dto);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}

		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("/rank.do");
		return forward;
	}

	@Override
	public ActionForward update(HttpServletRequest request, HttpServletResponse response) {
		// 추가하기
		String codeName = request.getParameter("code_name");
		String codeValue = request.getParameter("code_value");
		String remarks = request.getParameter("remarks");

		CodeTableDTO dto = new CodeTableDTO();
		dto.setCode_name(codeName);
		dto.setCode_value(codeValue);
		dto.setRemarks(remarks);

		CodeTableDAO dao = new CodeTableDAO();
		try {
			dao.updateCodeTable(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}


		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("/rank.do");
		return forward;
	}

	@Override
	public ActionForward delete(HttpServletRequest request, HttpServletResponse response) {
		String codeName = request.getParameter("code_name");
		CodeTableDAO dao = new CodeTableDAO();

		try {
			int result = dao.deleteCodeTable(codeName);
			if(result>0){
				System.out.println("성공");
			} else {
				System.out.println("실패");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("/rank.do");
		return forward;
	}
}
