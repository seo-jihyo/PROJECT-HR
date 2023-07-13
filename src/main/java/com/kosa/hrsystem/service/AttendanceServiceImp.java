package com.kosa.hrsystem.service;

import com.kosa.hrsystem.action.Action;
import com.kosa.hrsystem.action.ActionForward;
import com.kosa.hrsystem.dao.AttendanceDAO;
import com.kosa.hrsystem.dto.AttendanceDTO;
import com.kosa.hrsystem.dto.EmpDTO;
import org.json.simple.JSONObject;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class AttendanceServiceImp implements AttendanceService {
    @Override
    public void toggleAtt(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        // 값을 다시 view단으로 json으로 보내주고 그값을 localStorage에 담아서 사용
        EmpDTO dto = (EmpDTO) session.getAttribute("login");
        AttendanceDTO attDto = new AttendanceDTO();

        int attState = Integer.parseInt(request.getParameter("attState"));
        attDto.setAtt_status(attState);
        attDto.setEmp_num(dto.getEmp_num());

        // 출근시 필요한 정보 EMP_NUM,ATT_STATUS
        JSONObject json = new JSONObject();
        try {
            AttendanceDAO dao = new AttendanceDAO();
            if(attState==1){
                // 버튼 클릭시 근태 시작시간 추가
                if(dao.insertAttend(attDto)>0){
//                    System.out.println("insert");
                } else {
//                    System.out.println("not in");
                }

            } else {
                // 버튼 클릭시 근태 종료시간 업데이트로 추가
                if(dao.updateAttend(attDto)>0){
//                    System.out.println("update");
                } else {
//                    System.out.println("not up");
                }
            }

            json.put("status","true");
        } catch (Exception e){
            json.put("status","false");
            json.put("error",e.getMessage());
            e.printStackTrace();
        }

        try {
            response.setCharacterEncoding("utf-8");
            response.getWriter().print(json);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public boolean checkedAtt(HttpServletRequest request, HttpServletResponse response) {
        boolean flag = false;
        AttendanceDAO dao = new AttendanceDAO();
        HttpSession session = request.getSession();
        EmpDTO dto = (EmpDTO) session.getAttribute("login");

        System.out.println(dto.getEmp_num());
        // 값이 있고 근무 상태가 1일때 true || 값이 없거나 근무 상태가 0일때 false
        AttendanceDTO attDTO = dao.checkedAtt(dto.getEmp_num());

        System.out.println(attDTO);
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
