package com.kosa.hrsystem.service;

import com.kosa.hrsystem.action.ActionForward;
import com.kosa.hrsystem.dao.CodeTableDAO;
import com.kosa.hrsystem.dao.WorkScheduleDAO;
import com.kosa.hrsystem.dto.CodeTableDTO;
import com.kosa.hrsystem.dto.WorkScheduleDTO;
import com.kosa.hrsystem.dto.WorkScheduleTypeDTO;
import com.kosa.hrsystem.vo.WorkScheduleTypeVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class WorkScheduleServiceImp implements WorkScheduleService{
    /* 근무 일정 */
    @Override
    public ActionForward selectAll(HttpServletRequest request, HttpServletResponse response) {
        return null;
    }

    @Override
    public ActionForward insert(HttpServletRequest request, HttpServletResponse response) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");

        try {
            Date ws_date = sdf.parse(request.getParameter("ws_date"));
            Date startTime = sdf.parse(request.getParameter("startTime"));
            Date endTime = sdf.parse(request.getParameter("endTime"));
            String workType = request.getParameter("workType");
            String group = request.getParameter("group");
            String job = request.getParameter("job");
            String empName = request.getParameter("empName");
            String remarks = request.getParameter("ws_area");

            WorkScheduleDTO dto = new WorkScheduleDTO();
            // 관리에 DB값이 저장 되었을 떄 하기로...
//			dto.setSchedule(ws_date);
//			dto.setGo_work(startTime);
//			dto.setLeave_work(endTime);
//			dto.setDept(group);
//			dto.setRank(job);
//			dto.setEmp_num(0);
//			dto.setRemarks(remarks);
            WorkScheduleDAO dao = new WorkScheduleDAO();
            dao.insertWorkSchedule(dto);

        } catch (ParseException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public ActionForward update(HttpServletRequest request, HttpServletResponse response) {
        return null;
    }

    @Override
    public ActionForward delete(HttpServletRequest request, HttpServletResponse response) {
        return null;
    }


    /* 근무 일정 유형 */
    @Override
    public ActionForward selectAllType(HttpServletRequest request, HttpServletResponse response) {
        WorkScheduleDAO dao = new WorkScheduleDAO();
        try {
            List<WorkScheduleTypeVO> list = dao.selectAllWorkType();
            List<CodeTableDTO> optDept = new CodeTableDAO().selectAllByParent("D001");
            List<CodeTableDTO> optRank = new CodeTableDAO().selectAllByParent("R001");

            request.setAttribute("list", list);
            request.setAttribute("optDept", optDept);
            request.setAttribute("optRank", optRank);

            ActionForward forward = new ActionForward();
            forward.setRedirect(false);
            forward.setPath("/views/admin/manage/workScheduleView.jsp");
            return forward;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public ActionForward insertType(HttpServletRequest request, HttpServletResponse response) {
        String workname = request.getParameter("work_name");
        String dept = request.getParameter("dept");
        String rank = request.getParameter("rank");

        WorkScheduleTypeDTO dto = new WorkScheduleTypeDTO();
        dto.setWork_name(workname);
        dto.setDept(dept);
        dto.setRank(rank);
        WorkScheduleDAO dao = new WorkScheduleDAO();
        try {
            dao.insertWorkScheduleType(dto);
        } catch (Exception e) {
            throw new RuntimeException(e);

        }//뷰페이지설정
        ActionForward forward = new ActionForward();
        forward.setRedirect(true);
        forward.setPath("/worktype.do");
        return forward;
    }

    @Override
    public ActionForward updateType(HttpServletRequest request, HttpServletResponse response) {
        int work_sch_type_num = Integer.parseInt(request.getParameter("work_sch_type_num"));
        String work_name = request.getParameter("name");
        String dept = request.getParameter("dept");
        String rank = request.getParameter("rank");

        try {
            WorkScheduleTypeDTO dto = new WorkScheduleTypeDTO();
            dto.setWork_sch_type_num(work_sch_type_num);
            dto.setWork_name(work_name);
            dto.setDept(dept);
            dto.setRank(rank);

            WorkScheduleDAO dao = new WorkScheduleDAO();
            dao.updateWorkScheduleType(dto);
        } catch (Exception e) {
            e.printStackTrace();
        }
        ActionForward forward = new ActionForward();
        forward.setRedirect(true);
        forward.setPath("/worktype.do");

        return forward;
    }

    @Override
    public ActionForward deleteType(HttpServletRequest request, HttpServletResponse response) {
        int work_sch_type_num = Integer.parseInt(request.getParameter("work_sch_type_num"));
        WorkScheduleDAO dao = new WorkScheduleDAO();
        try {
            dao.deleteWorkScheduleType(work_sch_type_num);
        } catch (Exception e) {
            e.printStackTrace();
        }
        ActionForward forward = new ActionForward();
        forward.setRedirect(true);
        forward.setPath("/worktype.do");
        return forward;
    }
}
