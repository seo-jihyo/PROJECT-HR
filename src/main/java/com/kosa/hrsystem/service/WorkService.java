package com.kosa.hrsystem.service;

import com.kosa.hrsystem.action.Action;
import com.kosa.hrsystem.action.ActionForward;
import com.kosa.hrsystem.dao.WorkDAO;
import com.kosa.hrsystem.dto.WorkDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

public class WorkService implements Action {
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {

        // 조회
        WorkDAO dao = new WorkDAO();

        try {
            List<WorkDTO> list = dao.selectAllWork();
            HttpSession session = request.getSession();
            session.setAttribute("list", list);


        } catch (Exception e){
            request.setAttribute("state","false");
            request.setAttribute("error",e.getMessage());
            e.printStackTrace();
        }

        ActionForward forward = new ActionForward();
        forward.setPath("/views/admin/manage/workView.jsp");
        return forward;
    }
}
