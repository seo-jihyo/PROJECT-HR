package com.kosa.hrsystem.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kosa.hrsystem.action.ActionForward;

public interface UserScheduleService {

	public ActionForward selectUserSchedule(HttpServletRequest request, HttpServletResponse response);

}
