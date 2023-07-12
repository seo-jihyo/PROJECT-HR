package com.kosa.hrsystem.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kosa.hrsystem.action.ActionForward;
import com.kosa.hrsystem.dao.CommuteRecordDAO;
import com.kosa.hrsystem.vo.CommuteRecordVO;

public class CommuteRecordServiceImp implements CommuteRecordService {
	/* 출퇴근 기록 */
	@Override
	public ActionForward selectAll(HttpServletRequest request, HttpServletResponse response) {
		CommuteRecordDAO dao = new CommuteRecordDAO();
		try {
			List<CommuteRecordVO> list = dao.selectAllRecord();
			request.setAttribute("list", list);
			
			ActionForward forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/views/admin/attendance/attendanceView.jsp");
			return forward;
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	@Override
	public ActionForward insert(HttpServletRequest request, HttpServletResponse response) {
		return null;
	}

	@Override
	public ActionForward update(HttpServletRequest request, HttpServletResponse response) {
		return null;
	}

	@Override
	public ActionForward delete(HttpServletRequest request, HttpServletResponse response) {
		return null;
	}

	

}
