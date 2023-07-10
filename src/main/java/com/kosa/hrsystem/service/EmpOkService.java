package com.kosa.hrsystem.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kosa.hrsystem.action.Action;
import com.kosa.hrsystem.action.ActionForward;
import com.kosa.hrsystem.dao.EmpDAO;
import com.kosa.hrsystem.dto.EmpDTO;
import com.kosa.hrsystem.utils.RandomPwd;

public class EmpOkService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		RandomPwd rp = new RandomPwd();
		
		int emp_num = Integer.parseInt(request.getParameter("emp-num"));
		String emp_name = request.getParameter("emp-name");
		String emp_email = request.getParameter("emp-email");
		String emp_pwd = rp.generateRandomPassword(12);
		String emp_dept = request.getParameter("emp-dept");
		String emp_regist_num = request.getParameter("emp-regist-num");
		String emp_rank = request.getParameter("emp-rank");
		String emp_phone = request.getParameter("emp-phone");
		int emp_permission_type = Integer.parseInt(request.getParameter("emp-permission-type"));
		String emp_direct_num = request.getParameter("emp-direct-num");
		String emp_post_code = request.getParameter("emp-post-code");
		String emp_address = request.getParameter("emp-address");
		String emp_detail_address = request.getParameter("emp-detail-address");
		String emp_reason = request.getParameter("emp-reason");
		String emp_remarks = request.getParameter("remarks");
		String emp_hire_date = request.getParameter("emp-hire-date");
		String emp_departure_date = request.getParameter("emp-departure-date");
		try {
			EmpDTO dto = new EmpDTO();
			dto.setEmp_num(emp_num);
			dto.setEmp_name(emp_name);
			dto.setEmail(emp_email);
			dto.setPwd(emp_pwd);
			dto.setDept(emp_dept);
			dto.setRegist_num(emp_regist_num);
			dto.setRank(emp_rank);
			dto.setPhone(emp_phone);
			dto.setPermission_type(emp_permission_type);
			dto.setDirect_num(emp_direct_num);
			dto.setPost_code(emp_post_code);
			dto.setAddress(emp_address);
			dto.setDetail_address(emp_detail_address);
			dto.setRemarks(emp_remarks);
			dto.setReason(emp_reason);
			dto.setHire_date(sdf.parse(emp_hire_date));
			if(!emp_departure_date.equals("")) {
				dto.setDeparture_date(sdf.parse(emp_departure_date));
			} else {
				dto.setDeparture_date(null);
			}
			
			EmpDAO dao = new EmpDAO(); 
			dao.insertEmp(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("/emp.do");
		return forward;
	}

}
