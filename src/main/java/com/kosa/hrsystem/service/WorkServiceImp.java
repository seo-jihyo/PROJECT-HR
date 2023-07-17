package com.kosa.hrsystem.service;

import com.kosa.hrsystem.action.Action;
import com.kosa.hrsystem.action.ActionForward;
import com.kosa.hrsystem.dao.WorkDAO;
import com.kosa.hrsystem.dto.DayInfoDTO;
import com.kosa.hrsystem.dto.WorkDTO;
import com.kosa.hrsystem.vo.WorkVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class WorkServiceImp implements WorkService {
    @Override
    public ActionForward selectAll(HttpServletRequest request, HttpServletResponse response) {
        // 조회
        WorkDAO dao = new WorkDAO();

        try {
            List<WorkVO> list = dao.selectAllWork();
            request.setAttribute("list",list);

        } catch (Exception e){
            request.setAttribute("state","false");
            request.setAttribute("error",e.getMessage());
            e.printStackTrace();
        }

        ActionForward forward = new ActionForward();
        forward.setPath("/views/admin/manage/workView.jsp");
        return forward;
    }

    @Override
    public ActionForward insert(HttpServletRequest request, HttpServletResponse response) {
        // 근로정보 이름, 시급, 소정근로, 주휴 메모
        try {
            request.setCharacterEncoding("UTF-8");
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException(e);
        }
        String workName = request.getParameter("workName");
        Integer pay = Integer.valueOf(request.getParameter("pay"));
        String remarks = request.getParameter("remarks");
        String[] fixedWorkingDay = request.getParameterValues("fixedWorkingDay");
        String[] weeklyHoliday = request.getParameterValues("weekly_holiday");

        WorkDAO dao = new WorkDAO();
        WorkDTO workDTO = new WorkDTO();
        workDTO.setWork_name(workName);
        workDTO.setPay(pay);
        workDTO.setRemarks(remarks);

        List<DayInfoDTO> fixedDayList = new ArrayList<>();
        for (int i = 0; i < fixedWorkingDay.length; i++) {
            DayInfoDTO dto = new DayInfoDTO();
            dto.setDay(fixedWorkingDay[i].charAt(0));
            fixedDayList.add(dto);
        }

        List<DayInfoDTO> holiDayList = new ArrayList<>();
        for (int i = 0; i < weeklyHoliday.length; i++) {
            DayInfoDTO dto = new DayInfoDTO();
            dto.setDay(weeklyHoliday[i].charAt(0));
            holiDayList.add(dto);
        }

        dao.insertWork(workDTO,fixedDayList,holiDayList);
        ActionForward forward = new ActionForward();
        forward.setRedirect(true);
        forward.setPath("/work.do");
        return forward;
    }

    @Override
    public ActionForward update(HttpServletRequest request, HttpServletResponse response) {

        // 데이터 초기화
        String workNum = request.getParameter("workNum");
        String workName = request.getParameter("workName");
        Integer pay = Integer.valueOf(request.getParameter("pay"));
        String remarks = request.getParameter("remarks");
        String[] fixedWorkingDay = request.getParameterValues("fixedWorkingDay");
        String[] weeklyHoliday = request.getParameterValues("weekly_holiday");

        // dto 초기화
        WorkDAO dao = new WorkDAO();
        WorkDTO workDTO = new WorkDTO();
        workDTO.setWork_num(Integer.parseInt(workNum));
        workDTO.setWork_name(workName);
        workDTO.setPay(pay);
        workDTO.setRemarks(remarks);

        List<DayInfoDTO> fixedDayList = new ArrayList<>();
        for (int i = 0; i < fixedWorkingDay.length; i++) {
            DayInfoDTO dto = new DayInfoDTO();
            dto.setWork_num(Integer.parseInt(workNum));
            dto.setDay(fixedWorkingDay[i].charAt(0));
            fixedDayList.add(dto);
        }

        List<DayInfoDTO> holiDayList = new ArrayList<>();
        for (int i = 0; i < weeklyHoliday.length; i++) {
            DayInfoDTO dto = new DayInfoDTO();
            dto.setWork_num(Integer.parseInt(workNum));
            dto.setDay(weeklyHoliday[i].charAt(0));
            holiDayList.add(dto);
        }

        dao.updateWork(workDTO,fixedDayList,holiDayList);

        ActionForward forward = new ActionForward();
        forward.setRedirect(true);
        forward.setPath("/work.do");
        return forward;
    }

    @Override
    public ActionForward delete(HttpServletRequest request, HttpServletResponse response) {

        String workNum = request.getParameter("workNum");
        WorkDAO dao = new WorkDAO();
        dao.deleteWork(Integer.parseInt(workNum));

        ActionForward forward = new ActionForward();
        forward.setRedirect(true);
        forward.setPath("/work.do");
        return forward;
    }
}
