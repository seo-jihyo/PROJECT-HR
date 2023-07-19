package com.kosa.hrsystem.service;

import com.kosa.hrsystem.action.ActionForward;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface SalaryService {
    ActionForward selectAllSalary(HttpServletRequest request, HttpServletResponse response);
}
