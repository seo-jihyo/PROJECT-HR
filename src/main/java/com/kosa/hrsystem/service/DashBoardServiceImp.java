package com.kosa.hrsystem.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kosa.hrsystem.action.ActionForward;
import com.kosa.hrsystem.dao.DashBoardDAO;
import com.kosa.hrsystem.vo.DashBoardVO;

public class DashBoardServiceImp implements DashBoardService {

	@Override
	public ActionForward selectAll(HttpServletRequest request, HttpServletResponse response) {
		DashBoardDAO dao = new DashBoardDAO();
		DashBoardVO vo = new DashBoardVO();
		
		vo.setAtt_count(dao.selectAttCnt());
		vo.setNot_att_count(dao.selectNotAttCnt());
		vo.setLeave_count(dao.selectLeaveCnt());
		vo.setVac_count(dao.selectVacCnt());

		request.setAttribute("vo", vo);

		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/views/user/dashboard.jsp");
		return forward;
	}

}
