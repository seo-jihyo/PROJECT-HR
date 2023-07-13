package com.kosa.hrsystem.service;

import com.kosa.hrsystem.action.ActionForward;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface AttendanceService {

    // 출퇴근 기능
    public void toggleAtt(HttpServletRequest request, HttpServletResponse response);
    public boolean checkedAtt(HttpServletRequest request , HttpServletResponse response);
    public void insert(HttpServletRequest request , HttpServletResponse response);
    public void update(HttpServletRequest request, HttpServletResponse response);
    public void delete(HttpServletRequest request, HttpServletResponse response);



}
