package com.kosa.hrsystem.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.javassist.Loader.Simple;

import com.kosa.hrsystem.action.ActionForward;
import com.kosa.hrsystem.dao.CertificateDAO;
import com.kosa.hrsystem.dao.EmpDAO;
import com.kosa.hrsystem.dto.CertificateDTO;
import com.kosa.hrsystem.dto.EmpDTO;
import com.kosa.hrsystem.vo.MyPageVO;

public class UserServiceImp implements UserService {

	@Override
	public ActionForward selectOneUser(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		
		EmpDTO dto = (EmpDTO) session.getAttribute("login"); 
		
		int empNum = dto.getEmp_num();
		System.out.println(empNum);
		
		EmpDAO dao = new EmpDAO();
		try {
			MyPageVO info = dao.selectOneUser(empNum);
			System.out.println(info);
			request.setAttribute("info", info);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/views/user/myPage.jsp");
		return forward;
	}

	@Override
	public ActionForward updateOneUser(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		EmpDTO dto = (EmpDTO) session.getAttribute("login");

//		int empNum = Integer.parseInt(request.getParameter("empNum"));
		int empNum = dto.getEmp_num();
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String postCode = request.getParameter("postCode");
		String address = request.getParameter("address");
		String detailAddress = request.getParameter("detailAddress");
		
		try {
			dto = new EmpDTO();
			dto.setEmp_num(empNum);
			dto.setEmp_name(name);
			dto.setPhone(phone);
			dto.setPost_code(postCode);
			dto.setAddress(address);
			dto.setDetail_address(detailAddress);
			EmpDAO dao = new EmpDAO();
			int result = dao.updateOneUser(dto);
			System.out.println("업데이트 성공" + result);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("/myPage.do");
		return forward;
	}

	@Override
	public ActionForward insertCert(HttpServletRequest request, HttpServletResponse response) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		HttpSession session = request.getSession();
		EmpDTO edto = (EmpDTO) session.getAttribute("login"); 
		
		try {
			int empNum = edto.getEmp_num();
			String certNum = request.getParameter("certNum");
			String certName = request.getParameter("certName");
			String issuer = request.getParameter("issuer");
			Date acqDate = sdf.parse(request.getParameter("acqDate"));
			String remarks = request.getParameter("remarks");
			
			CertificateDTO dto = new CertificateDTO();
			dto.setEmp_num(empNum);
			dto.setCert_num(certNum);
			dto.setCrtfc_name(certName);
			dto.setIssuer(issuer);
			dto.setAcquisition_date(acqDate);
			dto.setRemarks(remarks);
			
			CertificateDAO dao = new CertificateDAO();
			dao.insertCert(dto);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("/myPage.do");
		return forward;
	}

	

}
