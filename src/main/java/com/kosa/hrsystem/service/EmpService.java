package com.kosa.hrsystem.service;

import com.kosa.hrsystem.action.ActionForward;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface EmpService {

    public ActionForward selectAll(HttpServletRequest request , HttpServletResponse response);
    
    public ActionForward insert(HttpServletRequest request , HttpServletResponse response);
    public ActionForward update(HttpServletRequest request, HttpServletResponse response);
    public ActionForward delete(HttpServletRequest request, HttpServletResponse response);
    public ActionForward searchId(HttpServletRequest request, HttpServletResponse response);
    public ActionForward searchPwd(HttpServletRequest request, HttpServletResponse response);
    public ActionForward updatePwd(HttpServletRequest request, HttpServletResponse response);
	public ActionForward insertCareerByManager(HttpServletRequest request, HttpServletResponse response);
	public ActionForward insertCertByManager(HttpServletRequest request, HttpServletResponse response);
	public ActionForward selectCertByManager(HttpServletRequest request, HttpServletResponse response);
	public ActionForward deleteCertByManager(HttpServletRequest request, HttpServletResponse response);
	public ActionForward selectCareerByManager(HttpServletRequest request, HttpServletResponse response);
	public ActionForward deleteCareerByManager(HttpServletRequest request, HttpServletResponse response);

    void searchEmp(HttpServletRequest request, HttpServletResponse response);
}