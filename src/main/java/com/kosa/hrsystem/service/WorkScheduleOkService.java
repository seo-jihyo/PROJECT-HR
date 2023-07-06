package com.kosa.hrsystem.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kosa.hrsystem.action.Action;
import com.kosa.hrsystem.action.ActionForward;
import com.kosa.hrsystem.dao.WorkScheduleDAO;
import com.kosa.hrsystem.dto.WorkScheduleDTO;

public class WorkScheduleOkService implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)  {
		//추가하기
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
		
		try {
			Date ws_date = sdf.parse(request.getParameter("ws_date"));
			Date startTime = sdf.parse(request.getParameter("startTime"));
			Date endTime = sdf.parse(request.getParameter("endTime"));
			String workType = request.getParameter("workType");
			String group = request.getParameter("group");
			String job = request.getParameter("job");
			String empName = request.getParameter("empName");
			String remarks = request.getParameter("ws_area");
			
			WorkScheduleDTO dto = new WorkScheduleDTO();
			// 관리에 DB값이 저장 되었을 떄 하기로...
//			dto.setSchedule(ws_date);
//			dto.setGo_work(startTime);
//			dto.setLeave_work(endTime);
//			dto.setDept(group);
//			dto.setRank(job);
//			dto.setEmp_num(0);
//			dto.setRemarks(remarks);
			WorkScheduleDAO dao = new WorkScheduleDAO();
			dao.insertWorkSchedule(dto);
			
		} catch (ParseException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
