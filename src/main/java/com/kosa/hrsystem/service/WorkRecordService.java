package com.kosa.hrsystem.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kosa.hrsystem.action.ActionForward;

public interface WorkRecordService {
	public ActionForward selectAllRcd(HttpServletRequest request, HttpServletResponse response);
	
	public ActionForward insertRcd(HttpServletRequest request, HttpServletResponse response);

    void searchWorkRecByDate(HttpServletRequest request, HttpServletResponse response);
}
