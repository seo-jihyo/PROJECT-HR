package com.kosa.hrsystem.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kosa.hrsystem.action.Action;
import com.kosa.hrsystem.action.ActionForward;
import com.kosa.hrsystem.dao.WorkScheduleDAO;
import com.kosa.hrsystem.dto.WorkScheduleTypeDTO;

public class WorkScheduleTypeUpdateService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {

		int work_sch_type_num = Integer.parseInt(request.getParameter("work_sch_type_num"));
		String work_name = request.getParameter("name");
		String dept = request.getParameter("dept");
		String rank = request.getParameter("rank");
		
		try {
			
		WorkScheduleTypeDTO dto = new WorkScheduleTypeDTO();
		dto.setWork_sch_type_num(work_sch_type_num);
		dto.setWork_name(work_name);
		dto.setDept(dept);
		dto.setRank(rank);
		
		WorkScheduleDAO dao = new WorkScheduleDAO();
		dao.updateWorkScheduleType(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("/worktype.do");
		
		
		return forward;
		
	}

}
