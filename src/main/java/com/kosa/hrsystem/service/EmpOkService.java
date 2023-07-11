package com.kosa.hrsystem.service;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.kosa.hrsystem.action.Action;
import com.kosa.hrsystem.action.ActionForward;
import com.kosa.hrsystem.dao.EmpDAO;
import com.kosa.hrsystem.dto.EmpDTO;
import com.kosa.hrsystem.utils.Encrypt;
import com.kosa.hrsystem.utils.NaverSMTP;
import com.kosa.hrsystem.utils.RandomPwd;

public class EmpOkService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		EmpDAO dao = new EmpDAO(); 
		
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
		
		int result = dao.checkEmail(emp_email);
		JSONObject json = new JSONObject();
		
        if(result == 1) {
        	json.put("status", "false");
        } else {
        	json.put("status", "true");
        	
        	Encrypt en = new Encrypt();
			String encryptPwd = en.getEncrypt(emp_pwd); //암호화
        	emailSend(emp_email,emp_pwd); // 메일 전송
        	
    		try {
    			EmpDTO dto = new EmpDTO();
    			dto.setEmp_num(emp_num);
    			dto.setEmp_name(emp_name);
    			dto.setEmail(emp_email);
    			dto.setPwd(encryptPwd);
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
    			
    			dao.insertEmp(dto);
    		} catch (Exception e) {
    			e.printStackTrace();
    		}
        }
        try {
            response.setCharacterEncoding("utf-8");
            response.getWriter().print(json);
            System.out.println(json);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
		
		return null;
	}
	
	public void emailSend(String email,String pwd) {
		// 이메일 내용 저장
		Map<String, String> emailInfo = new HashMap<>();
		emailInfo.put("from", "jkl02138@naver.com");
		emailInfo.put("to", email);
		emailInfo.put("subject", "아이디,비밀번호를 전달합니다.");

		// 내용은 메일 포맷에 따라 다르게 처리
		String content = "아이디 : " + email + ", 비밀번호 : " + pwd;
		emailInfo.put("content", content);
		emailInfo.put("format", "text/plain;charset=UTF-8");
		
		try {
			NaverSMTP smtpServer = new NaverSMTP();
			smtpServer.emailSending(emailInfo);
			System.out.println("이메일 전송 성공");
		} catch (MessagingException e) {
			System.out.println("이메일 전송 실패");
			e.printStackTrace();
		}
	}
}
