package com.kosa.hrsystem.service;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kosa.hrsystem.action.Action;
import com.kosa.hrsystem.action.ActionForward;
import com.kosa.hrsystem.dao.RankDAO;
import com.kosa.hrsystem.dto.CodeTableDTO;

public class RankService implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		RankDAO dao = new RankDAO();
		try {
			List<CodeTableDTO> list = dao.selectAllRank();
			
			request.setAttribute("list", list);
			ActionForward forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/views/admin/rank/rankView.jsp");
			return forward;
		} catch (Exception e) {
			throw new RuntimeException();
		}
		
	}
}
