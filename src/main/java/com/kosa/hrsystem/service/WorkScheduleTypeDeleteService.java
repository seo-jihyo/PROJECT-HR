package com.kosa.hrsystem.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kosa.hrsystem.action.Action;
import com.kosa.hrsystem.action.ActionForward;
import com.kosa.hrsystem.dao.WorkScheduleDAO;

public class WorkScheduleTypeDeleteService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		int work_sch_type_num = Integer.parseInt(request.getParameter("work_sch_type_num"));
		WorkScheduleDAO dao = new WorkScheduleDAO();
		try {
			dao.deleteWorkScheduleType(work_sch_type_num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("/worktype.do");
		return forward;
	}

}
