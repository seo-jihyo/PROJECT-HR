package com.kosa.hrsystem.service;

import com.kosa.hrsystem.action.Action;
import com.kosa.hrsystem.action.ActionForward;
import com.kosa.hrsystem.dao.AttendanceDAO;
import com.kosa.hrsystem.dto.AttendanceDTO;
import com.kosa.hrsystem.dto.EmpDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AttendanceServiceImp implements AttendanceService {
    @Override
    public boolean checkedAtt(HttpServletRequest request, HttpServletResponse response) {
        boolean flag = false;
        AttendanceDAO dao = new AttendanceDAO();
        HttpSession session = request.getSession();
        EmpDTO dto = (EmpDTO) session.getAttribute("login");

        // 값이 있고 근무 상태가 1일때 true || 값이 없거나 근무 상태가 0일때 false
        AttendanceDTO attDTO = dao.checkedAtt(dto.getEmp_num());

        if(attDTO != null && attDTO.getAtt_status() == 1){ // 출근중
            flag = true;
            session.setAttribute("attStatus",attDTO.getAtt_status());
        } else if(attDTO == null || attDTO.getAtt_status() == 0){ // 퇴근중
            flag = false;
            session.removeAttribute("attStatus");
        }
        return flag;
    }

    @Override
    public void insert(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        EmpDTO sessiondata = (EmpDTO) session.getAttribute("login");

        int attState = Integer.parseInt(request.getParameter("attState"));
        AttendanceDTO dto = new AttendanceDTO();
        dto.setEmp_num(sessiondata.getEmp_num());
        dto.setAtt_status(attState);
        AttendanceDAO dao = new AttendanceDAO();

        if (attState == 1) {
            // 출근 상태가 1이고 같은날 출근이 존재하면 error 반환
            dao.insertAttend(dto);
        } else {
            // 퇴근 상태가 0이고 db상태가 1일때 퇴근가능
            dao.updateAttend(dto);
        }
    }

    @Override
    public void update(HttpServletRequest request, HttpServletResponse response) {
    }

    @Override
    public void delete(HttpServletRequest request, HttpServletResponse response) {

    }
}
