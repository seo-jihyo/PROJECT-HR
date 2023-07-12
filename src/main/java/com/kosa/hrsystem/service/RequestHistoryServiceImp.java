package com.kosa.hrsystem.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kosa.hrsystem.action.ActionForward;
import com.kosa.hrsystem.dao.RequestHistoryDAO;
import com.kosa.hrsystem.dto.RequestHistoryDTO;

public class RequestHistoryServiceImp implements RequestHistoryService {

	@Override
	public ActionForward selectAllRequest(HttpServletRequest request, HttpServletResponse response) {
		RequestHistoryDAO dao = new RequestHistoryDAO();
		try {
			List<RequestHistoryDTO> list = dao.selectAllRequest();
			
			request.setAttribute("list", list);
			ActionForward forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/views/admin/requestHistory/requestHistoryView.jsp");
			return forward;
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

}
