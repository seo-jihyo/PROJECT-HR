package com.kosa.hrsystem.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kosa.hrsystem.action.Action;
import com.kosa.hrsystem.action.ActionForward;
import com.kosa.hrsystem.dao.WorkScheduleDAO;
import com.kosa.hrsystem.vo.WorkScheduleTypeVO;

public class WorkScheduleTypeService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		WorkScheduleDAO dao = new WorkScheduleDAO();

		try {
			List<WorkScheduleTypeVO> list = dao.selectAllWorkType();
			request.setAttribute("list", list);
			ActionForward forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/views/admin/manage/workScheduleView.jsp");
			return forward;
		} catch (Exception e) {
			throw new RuntimeException();
		}
	}
}
