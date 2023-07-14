package com.kosa.hrsystem.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kosa.hrsystem.action.ActionForward;
import com.kosa.hrsystem.dao.CodeTableDAO;
import com.kosa.hrsystem.dao.EmpDAO;
import com.kosa.hrsystem.dao.WorkScheduleDAO;
import com.kosa.hrsystem.dto.CodeTableDTO;
import com.kosa.hrsystem.dto.EmpDTO;
import com.kosa.hrsystem.dto.WorkScheduleDTO;
import com.kosa.hrsystem.dto.WorkScheduleTypeDTO;

public class WorkScheduleServiceImp implements WorkScheduleService{
    /* 근무 일정 */
    @Override
    public ActionForward selectAll(HttpServletRequest request, HttpServletResponse response) {
        WorkScheduleDAO dao = new WorkScheduleDAO();
        try {
            //List<WorkScheduleVO> list = dao.selectAllWorkSchedule();
           // List<WorkScheduleTypeVO> tlist = dao.selectAllWorkType();
            List<CodeTableDTO> optDept = new CodeTableDAO().selectAllByParent("D001");
            List<CodeTableDTO> optRank = new CodeTableDAO().selectAllByParent("R001");
            List<EmpDTO> elist = new EmpDAO().selectAllEmp();
            
            //request.setAttribute("list", list);
            //request.setAttribute("tlist", tlist);
            request.setAttribute("optDept", optDept);
            request.setAttribute("optRank", optRank);
            request.setAttribute("elist", elist);

            ActionForward forward = new ActionForward();
            forward.setRedirect(false);
            forward.setPath("/views/admin/workSchedule/workScheduleView.jsp");
            return forward;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public ActionForward insert(HttpServletRequest request, HttpServletResponse response) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        SimpleDateFormat sdfTime = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        
        try {
            Date ws_date = sdf.parse(request.getParameter("ws-date"));
            String workType = request.getParameter("ws-type");
            String dept = request.getParameter("ws-dept");
            String rank = request.getParameter("ws-rank");
            Date startTime = sdfTime.parse(request.getParameter("ws-date") +" "+request.getParameter("startTime"));
            Date endTime = sdfTime.parse(request.getParameter("ws-date") +" "+request.getParameter("endTime"));
            String empName = request.getParameter("emp-name");
            String remarks = request.getParameter("ws-area");

            WorkScheduleDTO dto = new WorkScheduleDTO();
            // 관리에 DB값이 저장 되었을 떄 하기로...
			dto.setSchedule(ws_date);
			dto.setGo_work(startTime);
			dto.setLeave_work(endTime);
			dto.setDept(dept);
			dto.setRank(rank);
			dto.setRemarks(remarks);
            WorkScheduleDAO dao = new WorkScheduleDAO();
            dao.insertWorkSchedule(dto);

        } catch (ParseException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
        ActionForward forward = new ActionForward();
        forward.setRedirect(true);
        forward.setPath("/workschedule.do");
        return forward;
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
    		List<WorkScheduleTypeDTO> list = dao.selectAllWorkType();
    		request.setAttribute("list", list);
    		
    		ActionForward forward = new ActionForward();
    		forward.setRedirect(false);
    		forward.setPath("/views/admin/manage/workScheduleView.jsp");
    		return forward;
    	} catch (Exception e) {
    		throw new RuntimeException(e);
    	}
    }
    
    //추가
    @Override
    public ActionForward insertType(HttpServletRequest request, HttpServletResponse response) {
    	SimpleDateFormat sdf = new SimpleDateFormat("HH:mm");
    	
    	try {
    		int work_sch_type_num = Integer.parseInt(request.getParameter("work_sch_type_num"));
    		String work_name = request.getParameter("work_name");
        	Date work_start = sdf.parse(request.getParameter("work_start"));
        	Date work_end = sdf.parse(request.getParameter("work_end"));


        	WorkScheduleTypeDTO dto = new WorkScheduleTypeDTO();
        	dto.setWork_sch_type_num(work_sch_type_num);
        	dto.setWork_name(work_name);
        	dto.setWork_start(work_start);
        	dto.setWork_end(work_end);
        	
        	WorkScheduleDAO dao = new WorkScheduleDAO();
            dao.insertWorkScheduleType(dto);
            
		} catch (ParseException e) {
			e.printStackTrace();
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
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
    	
    	try {
    		int work_sch_type_num = Integer.parseInt(request.getParameter("work_sch_type_num"));
    		String work_name = request.getParameter("name");
        	Date work_start = sdf.parse("1999-09-03 "+request.getParameter("start"));
        	Date work_end = sdf.parse("1999-09-03 "+request.getParameter("end"));


        	WorkScheduleTypeDTO dto = new WorkScheduleTypeDTO();
        	dto.setWork_sch_type_num(work_sch_type_num);
        	dto.setWork_name(work_name);
        	dto.setWork_start(work_start);
        	dto.setWork_end(work_end);
        	
        	WorkScheduleDAO dao = new WorkScheduleDAO();
            dao.updateWorkScheduleType(dto);
            
		} catch (ParseException e) {
			e.printStackTrace();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }//뷰페이지설정
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
