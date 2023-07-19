package com.kosa.hrsystem.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kosa.hrsystem.action.ActionForward;
public interface DashBoardService {

	// 미승인 요청내역 select
//	public ActionForward selectAllRequest(HttpServletRequest request , HttpServletResponse response);
	
    public ActionForward selectAll(HttpServletRequest request, HttpServletResponse response);
}

