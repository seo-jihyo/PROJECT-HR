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
import com.kosa.hrsystem.dao.VacationDAO;
import com.kosa.hrsystem.dto.RequestHistoryDTO;
import com.kosa.hrsystem.dto.VacationDTO;
import com.kosa.hrsystem.dto.VacationTypeDTO;
import com.kosa.hrsystem.vo.EmpVO;
import com.kosa.hrsystem.vo.VacationVO;
import com.kosa.hrsystem.vo.WorkScheduleVO;

public class VacationServiceImp implements VacationService {

	@Override
	public ActionForward selectAllVacation(HttpServletRequest request, HttpServletResponse response) {
		VacationDAO dao = new VacationDAO();
		try {
			List<VacationVO> list = dao.selectAllVacation();
			List<EmpVO> empList = new EmpDAO().selectAllEmp();
			List<VacationTypeDTO> vctnTypeList = dao.selectAll();
			
			request.setAttribute("list", list);
			request.setAttribute("empList", empList);
			request.setAttribute("vctnTypeList", vctnTypeList);
			
			ActionForward forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/views/admin/vacation/vacationView.jsp");
			return forward;
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	@Override
	public ActionForward insertVacation(HttpServletRequest request, HttpServletResponse response) {
		SimpleDateFormat sdfTime = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
		try {
			int empNum = Integer.parseInt(request.getParameter("emp_num"));
			int vctnTypeNum = Integer.parseInt(request.getParameter("vctn_type_num"));
			Date vctnStartDate = sdfTime.parse(request.getParameter("vctn_start_date"));
			Date vctnEndDate = sdfTime.parse(request.getParameter("vctn_end_date"));
			String vctnReason = request.getParameter("vctn_reason");
			char vctnApproval =  request.getParameter("vctn_approval").charAt(0);
			

			VacationDTO vacDto = new VacationDTO();
			vacDto.setEmp_num(empNum);
			vacDto.setVctn_type_num(vctnTypeNum);
			vacDto.setVctn_start_date(vctnStartDate);
			vacDto.setVctn_end_date(vctnEndDate);
			vacDto.setVctn_reason(vctnReason);
			vacDto.setVctn_approval(vctnApproval);

			RequestHistoryDTO reqDto = new RequestHistoryDTO();
			reqDto.setEmp_num(empNum);
			VacationDAO dao = new VacationDAO();
			dao.insertVacation(vacDto,reqDto);

		} catch (Exception e) {
			throw new RuntimeException(e);
		}
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("/vacation.do");
		return forward;
	}

	@Override
	public ActionForward updateVacation(HttpServletRequest request, HttpServletResponse response) {
		SimpleDateFormat sdfTime = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
		try {
			int vctnNum = Integer.parseInt(request.getParameter("vctn_num"));
			int vctnTypeNum = Integer.parseInt(request.getParameter("vctn_type_num"));
			Date vctnStartDate = sdfTime.parse(request.getParameter("vctn_start_date"));
			Date vctnEndDate = sdfTime.parse(request.getParameter("vctn_end_date"));
			String vctnReason = request.getParameter("vctn_reason");

			VacationDTO dto = new VacationDTO();
			dto.setVctn_num(vctnNum);
			dto.setVctn_type_num(vctnTypeNum);
			dto.setVctn_reason(vctnReason);
			dto.setVctn_start_date(vctnStartDate);
			dto.setVctn_end_date(vctnEndDate);

			VacationDAO dao = new VacationDAO();
		
			dao.updateVacation(dto);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("/vacation.do");
		return forward;
	}

	@Override
	public ActionForward deleteVacation(HttpServletRequest request, HttpServletResponse response) {
		int vctn_num = Integer.parseInt(request.getParameter("vctn_num"));
		
		VacationDAO dao = new VacationDAO();
		try {
			dao.deleteVacation(vctn_num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("/vacation.do");
		return forward;
	}

	@Override
	public ActionForward selectAllType(HttpServletRequest request, HttpServletResponse response) {
		VacationDAO dao = new VacationDAO();
		try {
			List<VacationTypeDTO> list = dao.selectAll();

			request.setAttribute("list", list);
			ActionForward forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/views/admin/vacationType/vacationTypeView.jsp");
			return forward;
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	@Override
	public ActionForward insertType(HttpServletRequest request, HttpServletResponse response) {
		String vctnName = request.getParameter("vctn_name");
		int vctnTime = Integer.parseInt(request.getParameter("vctn_time"));
		double deductionDay = Double.parseDouble(request.getParameter("deduction_day"));

		VacationTypeDTO dto = new VacationTypeDTO();
		dto.setVctn_name(vctnName);
		dto.setVctn_time(vctnTime);
		dto.setDeduction_day(deductionDay);

		VacationDAO dao = new VacationDAO();
		try {
			dao.insertVctnType(dto);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("/vacationtype.do");
		return forward;
	}

	@Override
	public ActionForward updateType(HttpServletRequest request, HttpServletResponse response) {
		int vctnNum = Integer.parseInt(request.getParameter("vctn_type_num"));
		String vctnName = request.getParameter("vctn_name");
		int vctnTime = Integer.parseInt(request.getParameter("vctn_time"));
		double deductionDay = Double.parseDouble(request.getParameter("deduction_day"));

		VacationTypeDTO dto = new VacationTypeDTO();
		dto.setVctn_type_num(vctnNum);
		dto.setVctn_name(vctnName);
		dto.setVctn_time(vctnTime);
		dto.setDeduction_day(deductionDay);

		VacationDAO dao = new VacationDAO();
		try {
			dao.updateVctnType(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("/vacationtype.do");
		return forward;
	}

	@Override
	public ActionForward deleteType(HttpServletRequest request, HttpServletResponse response) {
		int vctn_type_num = Integer.parseInt(request.getParameter("vctn_type_num"));

		VacationDAO dao = new VacationDAO();
		try {
			dao.deleteVctnType(vctn_type_num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("/vacationtype.do");
		return forward;
	}

	@Override
	public void searchVacTotal(HttpServletRequest request, HttpServletResponse response) {
		String searchType = request.getParameter("searchType");
		String searchWord = request.getParameter("searchWord");
		try {
			HashMap<String, String> map = new HashMap<>();
			map.put("searchType", searchType);
			map.put("searchWord", searchWord);
			
			VacationDAO dao = new VacationDAO();
			List<VacationVO> list = dao.searchTotal(map);
			
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

	@Override
	public void searchVacByDate(HttpServletRequest request, HttpServletResponse response) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		String startDate = request.getParameter("datepicker1");
		String endDate = request.getParameter("datepicker2");

		try {
			HashMap<String, Date> map = new HashMap<>();
			map.put("startDate", sdf.parse(startDate));
			map.put("endDate", sdf.parse(endDate));
			VacationDAO dao = new VacationDAO();
			List<VacationVO> list = dao.searchVacByDate(map);
            Gson gson = new Gson();
            String json = gson.toJson(list);
            System.out.println(json);
            
			response.setContentType("application/json");
			response.setCharacterEncoding("utf-8");
			response.getWriter().print(json);

		} catch (ParseException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}