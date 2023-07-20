package com.kosa.hrsystem.service;

import com.kosa.hrsystem.action.ActionForward;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface VacationService {

	public ActionForward selectAllVacation(HttpServletRequest request, HttpServletResponse response);

	public ActionForward insertVacation(HttpServletRequest request, HttpServletResponse response);

	public ActionForward updateVacation(HttpServletRequest request, HttpServletResponse response);

	public ActionForward deleteVacation(HttpServletRequest request, HttpServletResponse response);

	public ActionForward selectAllType(HttpServletRequest request, HttpServletResponse response);

	public ActionForward insertType(HttpServletRequest request, HttpServletResponse response);

	public ActionForward updateType(HttpServletRequest request, HttpServletResponse response);

	public ActionForward deleteType(HttpServletRequest request, HttpServletResponse response);

	/* 통합 검색 */
	public void searchVacTotal(HttpServletRequest request, HttpServletResponse response);
	/* 날짜 검색 */
    public void searchVacByDate(HttpServletRequest request, HttpServletResponse response);
}
