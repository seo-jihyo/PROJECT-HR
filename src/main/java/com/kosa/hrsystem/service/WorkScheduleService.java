package com.kosa.hrsystem.service;

import com.kosa.hrsystem.action.ActionForward;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface WorkScheduleService {
    /* 근무 일정 */
    public ActionForward selectAll(HttpServletRequest request, HttpServletResponse response);

    public ActionForward insert(HttpServletRequest request, HttpServletResponse response);

    public ActionForward update(HttpServletRequest request, HttpServletResponse response);

    public ActionForward delete(HttpServletRequest request, HttpServletResponse response);
    
    /* 날짜 검색 */
    public void searchByDate(HttpServletRequest request, HttpServletResponse response);
    /* 통합 검색 */
    public void searchTotal(HttpServletRequest request, HttpServletResponse response);
    
    /* 근무 일정 유형 */
    public ActionForward selectAllType(HttpServletRequest request, HttpServletResponse response);

    public ActionForward insertType(HttpServletRequest request, HttpServletResponse response);

    public ActionForward updateType(HttpServletRequest request, HttpServletResponse response);

    public ActionForward deleteType(HttpServletRequest request, HttpServletResponse response);


}
