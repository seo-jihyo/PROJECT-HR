package com.kosa.hrsystem.service;

import com.kosa.hrsystem.action.Action;
import com.kosa.hrsystem.action.ActionForward;
import com.kosa.hrsystem.dao.WorkDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class WorkOkService implements Action {
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
        // insert
        String work_num = request.getParameter("workNum");
        Integer pay = Integer.valueOf(request.getParameter("pay"));
        String[] fixedWorkingDay = request.getParameterValues("fixedWorkingDay");

        WorkDAO dao = new WorkDAO();


        return null;
    }
}
