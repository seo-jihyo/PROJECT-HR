package com.kosa.hrsystem.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
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
    	SimpleDateFormat sdf = new SimpleDateFormat("HH:mm");
    	
    	try {
			int emp_num = Integer.parseInt(request.getParameter("emp_num"));
			String emp_name = request.getParameter("emp_name");
			Date go_work = sdf.parse(request.getParameter("go_work"));
			Date leave_work = sdf.parse(request.getParameter("leave_work"));
			int break_time = Integer.parseInt(request.getParameter("break_time"));
			int work_time = Integer.parseInt(request.getParameter("work_time"));
			String work_name = request.getParameter("work_name");
		
			CommuteRecordVO vo = new CommuteRecordVO();
			vo.setEmp_num(emp_num);
			vo.setEmp_name(emp_name);
			vo.setGo_work(go_work);
			vo.setLeave_work(leave_work);
			vo.setBreak_time(break_time);
			vo.setWork_time(work_time);
			vo.setWork_name(work_name);
			
			CommuteRecordDAO dao = new CommuteRecordDAO();
			dao.insertRecord(vo);
		} catch (ParseException e) {
			e.printStackTrace();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }//뷰페이지설정
        ActionForward forward = new ActionForward();
        forward.setRedirect(true);
			forward.setPath("/cmtrecordupdate.do");
			
			return forward;
	}

	@Override
	public ActionForward update(HttpServletRequest request, HttpServletResponse response) {
		int emp_num = Integer.parseInt(request.getParameter("emp_num"));
		String emp_neme = request.getParameter("emp_name");
		String go_work = request.getParameter("go_work");
		String leave_work = request.getParameter("leave_work");
		int break_time = Integer.parseInt(request.getParameter("break_time"));
		int work_time = Integer.parseInt(request.getParameter("work_time"));
		String work_name = request.getParameter("work_name");
		
		try {
			CommuteRecordVO vo = new CommuteRecordVO();
			vo.setEmp_num(emp_num);
			vo.setEmp_name(work_name);
			vo.setGo_work(null);
//			vo.set
		}catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public ActionForward delete(HttpServletRequest request, HttpServletResponse response) {
		return null;
	}

	

}
