package com.kosa.hrsystem.service;



import com.kosa.hrsystem.action.Action;
import com.kosa.hrsystem.action.ActionForward;
import com.kosa.hrsystem.dao.testDAO;
import com.kosa.hrsystem.dto.testDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//회원가입 처리를 목적으로 하는 서비스 구현 .... Action 구현
//강제사항 ActionForward execute 구현해야 한다
public class TestAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		// 1. request 요청으로부터 데이터 입력 받기
		testDTO dto = new testDTO();
		dto.setTestval1(request.getParameter("testVal1"));
		dto.setTestval2(request.getParameter("testVal2"));
		testDAO dao = new testDAO();

		try {
			System.out.println("db ="+dao.selectDataAll());
			System.out.println("insert="+dao.insertData(dto));

		} catch (Exception e) {
			throw new RuntimeException(e);
		}
		
		return null;
	}

}