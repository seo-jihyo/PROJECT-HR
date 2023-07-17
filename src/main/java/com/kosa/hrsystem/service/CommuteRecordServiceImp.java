package com.kosa.hrsystem.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.kosa.hrsystem.action.ActionForward;
import com.kosa.hrsystem.dao.CommuteRecordDAO;
import com.kosa.hrsystem.dao.EmpDAO;
import com.kosa.hrsystem.dto.EmpDTO;
import com.kosa.hrsystem.vo.CommuteRecordVO;

public class CommuteRecordServiceImp implements CommuteRecordService {

	/* 출퇴근 기록 */
	@Override
	public ActionForward selectAll(HttpServletRequest request, HttpServletResponse response) {
		CommuteRecordDAO dao = new CommuteRecordDAO();
		try {

			List<EmpDTO> empList = new EmpDAO().selectAllEmp();
			List<CommuteRecordVO> list = dao.selectAllRecord();
			request.setAttribute("list", list);
			request.setAttribute("empList", empList);

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
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat sdfTime = new SimpleDateFormat("yyyy-MM-dd HH:mm");

		try {
			int emp_num = Integer.parseInt(request.getParameter("emp_num"));
			
			int att_status = 0;
			String cmt_date = request.getParameter("cmt_date");
			Date go_work = sdfTime.parse(cmt_date + " " + request.getParameter("go_work"));
			Date leave_work = null;
			
				if (request.getParameter("leave_work") == null) {
					 att_status = 1;
				}else {
					 leave_work = sdfTime.parse(cmt_date + " " + request.getParameter("leave_work"));
				}
			CommuteRecordVO vo = new CommuteRecordVO();
			vo.setEmp_num(emp_num);
			vo.setGo_work(go_work);
			vo.setLeave_work(leave_work);

			CommuteRecordDAO dao = new CommuteRecordDAO();
			dao.insertRecord(vo);
		} catch (ParseException e) {
			e.printStackTrace();
		} catch (Exception e) {
			throw new RuntimeException(e);
		} // 뷰페이지설정
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("/cmtrecord.do");
		
		return forward;
	}

	@Override
	public ActionForward update(HttpServletRequest request, HttpServletResponse response) {
	    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	    SimpleDateFormat sdfTime = new SimpleDateFormat("yyyy-MM-dd HH:mm");

	    try {
	    	int att_status = 0;
	    	
	    	int att_num = Integer.parseInt(request.getParameter("att_num"));
			int emp_num = Integer.parseInt(request.getParameter("emp_num"));
			String cmt_date = request.getParameter("cmt_date");
			Date go_work = sdfTime.parse(cmt_date + " " + request.getParameter("go_time"));
//			Date leave_work = sdfTime.parse(request.getParameter("go_work") + " " +request.getParameter("leave_time"));
			Date leave_work = sdfTime.parse(cmt_date + " " + request.getParameter("leave_time"));
			
			System.out.println(emp_num);
			System.out.println(request.getParameter("go_time"));
			System.out.println(request.getParameter("leave_time"));
			
			CommuteRecordVO vo = new CommuteRecordVO();
			vo.setAtt_num(att_num);
 			vo.setEmp_num(emp_num);
			vo.setGo_work(go_work);
			vo.setLeave_work(leave_work);
			
			CommuteRecordDAO dao = new CommuteRecordDAO();
			dao.updateRecord(vo);

		} catch (ParseException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("/cmtrecord.do");
		return forward;   
	}


	@Override
	public ActionForward delete(HttpServletRequest request, HttpServletResponse response) {
		int att_num = Integer.parseInt(request.getParameter("att_num"));
		CommuteRecordDAO dao = new CommuteRecordDAO();
		try {
			dao.deleteRecord(att_num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("/cmtrecord.do");
		return forward;
	}

}
