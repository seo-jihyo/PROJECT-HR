package com.kosa.hrsystem.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kosa.hrsystem.action.ActionForward;
import com.kosa.hrsystem.dao.EmpDAO;
import com.kosa.hrsystem.dao.WorkScheduleDAO;
import com.kosa.hrsystem.dto.RequestHistoryDTO;
import com.kosa.hrsystem.dto.WorkScheduleDTO;
import com.kosa.hrsystem.dto.WorkScheduleTypeDTO;
import com.kosa.hrsystem.vo.EmpVO;
import com.kosa.hrsystem.vo.WorkScheduleVO;

public class WorkScheduleServiceImp implements WorkScheduleService {
	
	/* 통합 검색 */ 
	@Override
	public void searchTotal(HttpServletRequest request, HttpServletResponse response) {
		String searchType = request.getParameter("searchType");
		String searchWord = request.getParameter("searchWord");
		System.out.println(searchType); System.out.println(searchWord);
		try {
			HashMap<String, String> map = new HashMap<>();
			map.put("searchType", searchType);
			map.put("searchWord", searchWord);
			
			WorkScheduleDAO dao = new WorkScheduleDAO();
			List<WorkScheduleVO> list = dao.searchTotal(map);
			
			Gson gson = new Gson();
			String json = gson.toJson(list);
			System.out.println(json);
			
			response.setContentType("application/json");
			response.setCharacterEncoding("utf-8");
			response.getWriter().print(json);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/* 날짜 검색 */
	@Override
	public void searchByDate(HttpServletRequest request, HttpServletResponse response) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		String startDate = request.getParameter("datepicker1");
		String endDate = request.getParameter("datepicker2");

		try {
			HashMap<String, Date> map = new HashMap<>();
			map.put("startDate", sdf.parse(startDate));
			map.put("endDate", sdf.parse(endDate));
 
			WorkScheduleDAO dao = new WorkScheduleDAO();
			List<WorkScheduleVO> list = dao.searchByDate(map);

            Gson gson = new Gson();
            String json = gson.toJson(list);
            System.out.println(json);
     
            
			// jsonArr.add(json);
// 			System.out.println(json.toJSONString());
			response.setContentType("application/json");
			response.setCharacterEncoding("utf-8");
			response.getWriter().print(json);

		} catch (ParseException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/* 근무 일정 */
	@Override
	public ActionForward selectAll(HttpServletRequest request, HttpServletResponse response) {
		WorkScheduleDAO dao = new WorkScheduleDAO();
		try {
			List<WorkScheduleVO> list = dao.selectAllWorkSchedule();
			List<WorkScheduleTypeDTO> tlist = dao.selectAllWorkType();
			List<EmpVO> elist = new EmpDAO().selectAllEmp();

			request.setAttribute("list", list);
			request.setAttribute("tlist", tlist);
			request.setAttribute("elist", elist);

			ActionForward forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/views/admin/workSchedule/workScheduleView.jsp");
			return forward;
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	@Override
	public ActionForward insert(HttpServletRequest request, HttpServletResponse response) {
		SimpleDateFormat sdfTime = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");

		try {
			int workType = Integer.parseInt(request.getParameter("ws-type"));
			Date startTime = sdfTime.parse(request.getParameter("startTime"));
			Date endTime = sdfTime.parse(request.getParameter("endTime"));
			int empNum = Integer.parseInt(request.getParameter("emp-name"));
			String remarks = request.getParameter("ws-area");

			WorkScheduleDTO wsDto = new WorkScheduleDTO();
			// 관리에 DB값이 저장 되었을 떄 하기로...
			wsDto.setWork_sch_type_num(workType);
			wsDto.setGo_work(startTime);
			wsDto.setLeave_work(endTime);
			wsDto.setEmp_num(empNum);
			wsDto.setRemarks(remarks);

			RequestHistoryDTO reqDto = new RequestHistoryDTO();
			reqDto.setEmp_num(empNum);
			WorkScheduleDAO dao = new WorkScheduleDAO();
			dao.insertWorkSchedule(wsDto, reqDto);

		} catch (ParseException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("/workschedule.do");
		return forward;
	}

	@Override
	public ActionForward update(HttpServletRequest request, HttpServletResponse response) {
		SimpleDateFormat sdfTime = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");

		try {
			int workNum = Integer.parseInt(request.getParameter("ws-num"));
			int workType = Integer.parseInt(request.getParameter("ws-type"));
			Date startTime = sdfTime.parse(request.getParameter("startTime"));
			Date endTime = sdfTime.parse(request.getParameter("endTime"));
			int empNum = Integer.parseInt(request.getParameter("emp-name"));
			String remarks = request.getParameter("ws-area");

			WorkScheduleDTO dto = new WorkScheduleDTO();
			// 관리에 DB값이 저장 되었을 떄 하기로...
			dto.setWork_sch_num(workNum);
			dto.setWork_sch_type_num(workType);
			dto.setGo_work(startTime);
			dto.setLeave_work(endTime);
			dto.setEmp_num(empNum);
			dto.setRemarks(remarks);
			
			WorkScheduleDAO dao = new WorkScheduleDAO();
			dao.updateWorkSchedule(dto);

		} catch (ParseException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("/workschedule.do");
		return forward;
	}

	@Override
	public ActionForward delete(HttpServletRequest request, HttpServletResponse response) {
		int workScheduleNum = Integer.parseInt(request.getParameter("ws-num"));
		System.out.println(workScheduleNum);
		WorkScheduleDAO dao = new WorkScheduleDAO();
		dao.deleteWorkSchedule(workScheduleNum);

		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("/workschedule.do");
		return forward;
	}

	/* 근무 일정 유형 */
	@Override
	public ActionForward selectAllType(HttpServletRequest request, HttpServletResponse response) {
		WorkScheduleDAO dao = new WorkScheduleDAO();
		try {
			List<WorkScheduleTypeDTO> list = dao.selectAllWorkType();
			request.setAttribute("list", list);

			ActionForward forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/views/admin/manage/workScheduleView.jsp");
			return forward;
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	// 추가
	@Override
	public ActionForward insertType(HttpServletRequest request, HttpServletResponse response) {
		SimpleDateFormat sdf = new SimpleDateFormat("HH:mm");

		try {
			int work_sch_type_num = Integer.parseInt(request.getParameter("work_sch_type_num"));
			String work_name = request.getParameter("work_name");
			Date work_start = sdf.parse(request.getParameter("work_start"));
			Date work_end = sdf.parse(request.getParameter("work_end"));

			WorkScheduleTypeDTO dto = new WorkScheduleTypeDTO();
			dto.setWork_sch_type_num(work_sch_type_num);
			dto.setWork_name(work_name);
			dto.setWork_start(work_start);
			dto.setWork_end(work_end);

			WorkScheduleDAO dao = new WorkScheduleDAO();
			dao.insertWorkScheduleType(dto);

		} catch (ParseException e) {
			e.printStackTrace();
		} catch (Exception e) {
			throw new RuntimeException(e);
		} // 뷰페이지설정
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("/worktype.do");
		return forward;
	}

	@Override
	public ActionForward updateType(HttpServletRequest request, HttpServletResponse response) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");

		try {
			int work_sch_type_num = Integer.parseInt(request.getParameter("work_sch_type_num"));
			String work_name = request.getParameter("name");
			Date work_start = sdf.parse("1999-09-03 " + request.getParameter("start"));
			Date work_end = sdf.parse("1999-09-03 " + request.getParameter("end"));

			WorkScheduleTypeDTO dto = new WorkScheduleTypeDTO();
			dto.setWork_sch_type_num(work_sch_type_num);
			dto.setWork_name(work_name);
			dto.setWork_start(work_start);
			dto.setWork_end(work_end);

			WorkScheduleDAO dao = new WorkScheduleDAO();
			dao.updateWorkScheduleType(dto);

		} catch (ParseException e) {
			e.printStackTrace();
		} catch (Exception e) {
			throw new RuntimeException(e);
		} // 뷰페이지설정
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("/worktype.do");
		return forward;
	}

	@Override
	public ActionForward deleteType(HttpServletRequest request, HttpServletResponse response) {
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
