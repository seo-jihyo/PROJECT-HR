package com.kosa.hrsystem.service;

import com.kosa.hrsystem.action.Action;
import com.kosa.hrsystem.action.ActionForward;
import com.kosa.hrsystem.dao.DeptDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DeptDeleteService implements Action {
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
        String codeName = request.getParameter("code_name");
        DeptDAO dao = new DeptDAO();

        try {
            int result = dao.deleteDept(codeName);
            if(result>0){
                System.out.println("성공");
            } else {
                System.out.println("실패");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        ActionForward forward = new ActionForward();
        forward.setRedirect(true);
        forward.setPath("/dept.do");
        return forward;
    }
}
