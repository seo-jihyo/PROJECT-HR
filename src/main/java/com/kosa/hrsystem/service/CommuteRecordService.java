package com.kosa.hrsystem.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kosa.hrsystem.action.ActionForward;

public interface CommuteRecordService {

	public ActionForward selectAll(HttpServletRequest request, HttpServletResponse response);

	public ActionForward insert(HttpServletRequest request, HttpServletResponse response);

	public ActionForward update(HttpServletRequest request, HttpServletResponse response);

	public ActionForward delete(HttpServletRequest request, HttpServletResponse response);

	public void searchByDateAtt(HttpServletRequest request, HttpServletResponse response);

	public void searchTotalAtt(HttpServletRequest request, HttpServletResponse response);

}
