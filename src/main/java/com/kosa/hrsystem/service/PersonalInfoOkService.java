package com.kosa.hrsystem.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kosa.hrsystem.action.Action;
import com.kosa.hrsystem.action.ActionForward;
import com.kosa.hrsystem.dao.CareerDAO;
import com.kosa.hrsystem.dao.CertificateDAO;
import com.kosa.hrsystem.dao.EducationDAO;
import com.kosa.hrsystem.dto.CareerDTO;
import com.kosa.hrsystem.dto.CertificateDTO;
import com.kosa.hrsystem.dto.EducationDTO;

// 학력, 경력, 자격증 등록하는 서비스
public class PersonalInfoOkService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		// 학력 
		int edu_num = Integer.parseInt(request.getParameter("edu-num"));
		int emp_num = 1004; // 임시 조치
		String school_name = request.getParameter("school-name");
		String school_dept = request.getParameter("school-dept");
		String addmissions_day = request.getParameter("addmissions-day");
		String graduation_day = request.getParameter("graduation-day");
		String graduation_status = request.getParameter("graduation-status");
		String edu_remarks = request.getParameter("edu-remarks");
		
		// 경력
		int career_num = Integer.parseInt(request.getParameter("career-num"));
		int car_emp_num = 1004; // 임시 조치
		String company_name = request.getParameter("company-name");
		String dept = request.getParameter("dept");
		String rank = request.getParameter("rank");
		String main_task = request.getParameter("main-task");
		String join_date = request.getParameter("join-date");
		String leave_date = request.getParameter("leave-date");
		String career_remarks = request.getParameter("career-remarks");
		
		//자격증
		int cert_num = Integer.parseInt(request.getParameter("edu-num"));
		String cert_name = request.getParameter("cert-name");
		String issuer = request.getParameter("issuer");
		String acquisition_date = request.getParameter("acquisition-date");
		String cert_remarks = request.getParameter("cert-remarks");
		
		try {
			EducationDTO eduDto = new EducationDTO();
			eduDto.setEdu_num(edu_num);
			eduDto.setEmp_num(emp_num);
			eduDto.setSchool_name(school_name);
			eduDto.setSchool_dept(school_dept);
			eduDto.setAddmissions_day(sdf.parse(addmissions_day));
			eduDto.setGraduation_day(sdf.parse(graduation_day));
			eduDto.setGraduation_status(graduation_status);
			eduDto.setRemarks(edu_remarks);

			CareerDTO careerDto = new CareerDTO();
			careerDto.setCareer_num(career_num);
			careerDto.setEmp_num(emp_num);
			careerDto.setCompany_name(company_name);
			careerDto.setDept(dept);
			careerDto.setRank(rank);
			careerDto.setMain_tesk(main_task);
			careerDto.setJoin_date(sdf.parse(join_date));
			careerDto.setLeave_date(sdf.parse(leave_date));
			careerDto.setRemarks(career_remarks);
			
			CertificateDTO certDto = new CertificateDTO();
			certDto.setCert_num(cert_num);
			certDto.setEmp_num(emp_num);
			certDto.setCrtfc_name(cert_name);
			certDto.setIssuer(issuer);
			certDto.setAcquisition_date(sdf.parse(acquisition_date));
			certDto.setEmp_num(emp_num);
			certDto.setRemarks(cert_remarks);
			
			EducationDAO eduDao = new EducationDAO();
			eduDao.insertCareer(eduDto);
			CareerDAO careerDao = new CareerDAO();
			careerDao.insertCareer(careerDto);
			CertificateDAO certDao = new CertificateDAO();
			certDao.insertCert(certDto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("/emp.do");
		return forward;
	}

}


//
