package com.kosa.hrsystem.service;

import com.kosa.hrsystem.action.Action;
import com.kosa.hrsystem.action.ActionForward;
import com.kosa.hrsystem.dao.EmpDAO;
import com.kosa.hrsystem.dto.EmpDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

public class loginOkService implements Action {
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
        String email = request.getParameter("email");
        String pwd = request.getParameter("pwd");

        HashMap<String, String> map = new HashMap<>();
        map.put("email", email);
        map.put("pwd", pwd);
        // 암호화 적용

        // DB에 있는지 확인
        EmpDAO dao = new EmpDAO();
        EmpDTO dto = dao.selectByEmail(map);

        HttpSession session = request.getSession();
        session.setAttribute("login", dto);

        ActionForward forward = new ActionForward();
        forward.setRedirect(true);
        forward.setPath("/index.jsp");

        return forward;
    }
}
