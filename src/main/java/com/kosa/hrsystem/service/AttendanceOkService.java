package com.kosa.hrsystem.service;

import com.kosa.hrsystem.action.Action;
import com.kosa.hrsystem.action.ActionForward;
import com.kosa.hrsystem.dao.AttendanceDAO;
import com.kosa.hrsystem.dto.AttendanceDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AttendanceOkService implements Action {
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
        int attState = Integer.parseInt(request.getParameter("attState"));

        AttendanceDAO dao = new AttendanceDAO();
        AttendanceDTO dto = new AttendanceDTO();
        if (attState == 1) {
            // 출근 상태가 1이고 같은날 출근이 존재하면 error 반환
            dao.insertAttend(dto);

        } else {
            // 퇴근 상태가 0이고 db상태가 1일때 퇴근가능

        }


        return null;
    }
}
