package com.kosa.hrsystem.service;

import com.kosa.hrsystem.action.Action;
import com.kosa.hrsystem.action.ActionForward;
import com.kosa.hrsystem.dao.VacationDAO;
import com.kosa.hrsystem.dto.VacationTypeDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

public class VacationTypeService implements Action {
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {

        // 휴가일정 조회
        VacationDAO dao = new VacationDAO();
        List<VacationTypeDTO> list = dao.selectAllVctnType();

        request.setAttribute("list", list);

        ActionForward forward = new ActionForward();
        forward.setPath("/views/admin/manage/vacationTypeView.jsp");
        return forward;
    }
}
