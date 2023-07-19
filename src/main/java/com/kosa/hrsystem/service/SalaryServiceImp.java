package com.kosa.hrsystem.service;

import com.kosa.hrsystem.action.ActionForward;
import com.kosa.hrsystem.dao.SalaryDAO;
import com.kosa.hrsystem.dto.SalaryDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

public class SalaryServiceImp implements SalaryService {
    @Override
    public ActionForward selectAllSalary(HttpServletRequest request, HttpServletResponse response) {
        SalaryDAO salaryDAO = new SalaryDAO();
        List<SalaryDTO> list = salaryDAO.selectAllSalary();

        for (int i = 0; i < list.size(); i++) {
            list.get(i).calcAll();
        }

        request.setAttribute("list",list);

        ActionForward forward = new ActionForward();
        forward.setPath("/views/admin/salary/salaryView.jsp");
        return forward;
    }
}
