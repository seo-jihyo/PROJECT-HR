package com.kosa.hrsystem.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kosa.hrsystem.action.ActionForward;

public interface UserService {
	
	// 마이페이지
	public ActionForward selectOneUser(HttpServletRequest request, HttpServletResponse response);

	public ActionForward updateOneUser(HttpServletRequest request, HttpServletResponse response);

	public ActionForward insertCert(HttpServletRequest request, HttpServletResponse response);

	public ActionForward updateCert(HttpServletRequest request, HttpServletResponse response);

	public ActionForward deleteCert(HttpServletRequest request, HttpServletResponse response);
	
	public ActionForward selectCareer(HttpServletRequest request, HttpServletResponse response);
	
	public ActionForward insertCareer(HttpServletRequest request, HttpServletResponse response);

	public ActionForward updateCareer(HttpServletRequest request, HttpServletResponse response);

	public ActionForward deleteCareer(HttpServletRequest request, HttpServletResponse response);

	public ActionForward uploadImage(HttpServletRequest request, HttpServletResponse response);

}
