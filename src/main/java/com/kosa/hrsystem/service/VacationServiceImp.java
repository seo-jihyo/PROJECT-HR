package com.kosa.hrsystem.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kosa.hrsystem.action.ActionForward;
import com.kosa.hrsystem.dao.EmpDAO;
import com.kosa.hrsystem.dao.VacationDAO;
import com.kosa.hrsystem.dto.EmpDTO;
import com.kosa.hrsystem.dto.VacationDTO;
import com.kosa.hrsystem.dto.VacationTypeDTO;
import com.kosa.hrsystem.vo.VacationVO;

public class VacationServiceImp implements VacationService {

	@Override
	public ActionForward selectAllVacation(HttpServletRequest request, HttpServletResponse response) {
		VacationDAO dao = new VacationDAO();
		try {
			List<VacationVO> list = dao.selectAllVacation();
			List<EmpDTO> empList = new EmpDAO().selectAllEmp();
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
		/* SimpleDateFormat sdfTime = new SimpleDateFormat("yyyy-MM-dd HH:mm"); */
		try {
			int empNum = Integer.parseInt(request.getParameter("emp_num"));
			int vctnTypeNum = Integer.parseInt(request.getParameter("vctn_type_num"));
			Date vctnStartDate = sdfTime.parse(request.getParameter("vctn_start_date"));
			Date vctnEndDate = sdfTime.parse(request.getParameter("vctn_end_date"));
			String vctnReason = request.getParameter("vctn_reason");
			char vctnApproval =  request.getParameter("vctn_approval").charAt(0);
			

			VacationDTO dto = new VacationDTO();

			dto.setEmp_num(empNum);
			dto.setVctn_type_num(vctnTypeNum);
			dto.setVctn_start_date(vctnStartDate);
			dto.setVctn_end_date(vctnEndDate);
			dto.setVctn_reason(vctnReason);
			dto.setVctn_approval(vctnApproval);
			

			VacationDAO dao = new VacationDAO();
		
			dao.insertVacation(dto);
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
}