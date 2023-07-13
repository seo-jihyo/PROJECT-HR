package com.kosa.hrsystem.service;

import com.kosa.hrsystem.action.ActionForward;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface VacationService {

    public ActionForward selectAllVacation(HttpServletRequest request , HttpServletResponse response);
    public ActionForward insert(HttpServletRequest request , HttpServletResponse response);
    public ActionForward update(HttpServletRequest request, HttpServletResponse response);
    public ActionForward delete(HttpServletRequest request, HttpServletResponse response);
    
    public ActionForward selectAllType(HttpServletRequest request , HttpServletResponse response);
    public ActionForward insertType(HttpServletRequest request , HttpServletResponse response);
    public ActionForward updateType(HttpServletRequest request, HttpServletResponse response);
    public ActionForward deleteType(HttpServletRequest request, HttpServletResponse response);
}
