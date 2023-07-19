package com.kosa.hrsystem.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kosa.hrsystem.action.ActionForward;
import com.kosa.hrsystem.dao.DashBoardDAO;
import com.kosa.hrsystem.dao.RequestHistoryDAO;
import com.kosa.hrsystem.vo.DashBoardVO;
import com.kosa.hrsystem.vo.RequestHistoryVO;

public class DashBoardServiceImp implements DashBoardService {


	@Override
	public ActionForward selectAttCnt(HttpServletRequest request, HttpServletResponse response) {
		DashBoardDAO dao = new DashBoardDAO();
		try {
			List<DashBoardVO> list = dao.selectAttCnt();
			System.out.println(list);
			request.setAttribute("list", list);
			ActionForward forward  = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/views/user/dashboard.jsp");
			return forward;
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}


}
