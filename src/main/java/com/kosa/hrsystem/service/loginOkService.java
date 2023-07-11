package com.kosa.hrsystem.service;

import com.kosa.hrsystem.action.Action;
import com.kosa.hrsystem.action.ActionForward;
import com.kosa.hrsystem.dao.EmpDAO;
import com.kosa.hrsystem.dto.EmpDTO;
import com.kosa.hrsystem.utils.Encrypt;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;

public class loginOkService implements Action {
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
        String email = request.getParameter("email");
        String pwd = request.getParameter("pwd");
        Encrypt en = new Encrypt();
        HashMap<String, String> map = new HashMap<>();
        map.put("email", email);
        map.put("pwd", en.getEncrypt(pwd));
        // 암호화 적용
        System.out.println(map);

        // DB에 있는지 확인
        EmpDAO dao = new EmpDAO();
        EmpDTO dto = dao.selectByEmail(map);
        HttpSession session = request.getSession();
        session.setAttribute("login", dto);


        JSONObject json = new JSONObject();
        if(dto == null) {
        	json.put("errMsg", "아이디또는 비밀번호가 틀렸습니다. 다시 입력해주세요.");
        } else {
        	json.put("email", dto.getEmail());
        	json.put("emp_name", dto.getEmp_name());
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
}
