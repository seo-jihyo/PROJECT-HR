package com.kosa.hrsystem.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kosa.hrsystem.action.ActionForward;
import com.kosa.hrsystem.dao.EmpDAO;
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

	

}
