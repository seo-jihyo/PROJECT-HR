package com.kosa.hrsystem.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kosa.hrsystem.action.Action;
import com.kosa.hrsystem.action.ActionForward;
import com.kosa.hrsystem.dao.WorkScheduleDAO;
import com.kosa.hrsystem.dto.WorkScheduleTypeDTO;

public class WorkScheduleTypeOkService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		// 추가하기 
		
				String workname = request.getParameter("work_name");
				String dept = request.getParameter("dept");
				String rank = request.getParameter("rank");
				
				WorkScheduleTypeDTO dto = new WorkScheduleTypeDTO();
				dto.setWork_name(workname);
				dto.setDept(dept);
				dto.setRank(rank);
				WorkScheduleDAO dao = new WorkScheduleDAO(); 
				try {
					dao.insertWorkScheduleType(dto);
				} catch (Exception e) {
					throw new RuntimeException(e);
					
				}//뷰페이지설정
				ActionForward forward = new ActionForward();
				forward.setRedirect(true); 
				forward.setPath("/worktype.do");
				return forward;
			}
		}