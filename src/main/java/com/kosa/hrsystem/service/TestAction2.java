package com.kosa.hrsystem.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kosa.hrsystem.action.Action;
import com.kosa.hrsystem.action.ActionForward;
import com.kosa.hrsystem.dao.testDAO;
import com.kosa.hrsystem.dto.testDTO;

public class TestAction2 implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		//조회
		testDAO dao = new testDAO();
		try {
			List<testDTO> list = dao.selectTest();
			
			request.setAttribute("list", list);
			
			ActionForward forward = new ActionForward();
			forward.setRedirect(false);//True 클라이언트가 새로운 페이지를 요청하게
			forward.setPath("/testok.jsp");
			return forward;
			
		} catch (Exception e) {
//			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}
}
