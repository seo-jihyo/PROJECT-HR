package com.kosa.hrsystem.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.kosa.hrsystem.action.ActionForward;
import com.kosa.hrsystem.dao.RequestHistoryDAO;
import com.kosa.hrsystem.dao.WorkScheduleDAO;
import com.kosa.hrsystem.dto.EmpDTO;
import com.kosa.hrsystem.vo.RequestHistoryVO;
import com.kosa.hrsystem.vo.WorkScheduleVO;

public class RequestHistoryServiceImp implements RequestHistoryService {

    @Override
    public ActionForward selectAllRequest(HttpServletRequest request, HttpServletResponse response) {
        RequestHistoryDAO dao = new RequestHistoryDAO();
        try {
            List<RequestHistoryVO> list = dao.selectAllRequest();

            request.setAttribute("list", list);
            ActionForward forward = new ActionForward();
            forward.setRedirect(false);
            forward.setPath("/views/admin/requestHistory/requestHistoryView.jsp");
            return forward;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public ActionForward update(HttpServletRequest request, HttpServletResponse response) {

        String historyStatus = request.getParameter("historyStatus");
        String historyNum = request.getParameter("historyNum");
        String historyRequest = request.getParameter("code");
        String historyType = request.getParameter("historyType");
        RequestHistoryDAO dao = new RequestHistoryDAO();

        // 요청번호  요청타입 요청사항
        HashMap<String, Object> map = new HashMap<>();
        map.put("historyType", historyType); // 근무, 휴가, 근태
        map.put("historyRequest", historyRequest); // 해당 내역의 번호( 근무번호, 휴가번호, 근태번호)
        map.put("historyNum", historyNum); // 요청번호
        map.put("historyStatus", historyStatus); // 요청 상태 승인인지 거절인지

        // 상태 승인 취소
        dao.update(map);

        ActionForward forward = new ActionForward();
        forward.setRedirect(true);
        forward.setPath("/requesthistory.do");
        return forward;
    }

    @Override
    public void approval(HttpServletRequest request, HttpServletResponse response) {
        // 승인
        String approval = request.getParameter("approval");
        String rqstNum = request.getParameter("rqstNum");
        String remarks = request.getParameter("remarks");

        RequestHistoryDAO requestHistoryDAO = new RequestHistoryDAO();
        HashMap<String,Object> map = new HashMap<>();
        if (approval.equals("true")) {
            map.put("rqstNum",rqstNum);
            map.put("remarks",remarks);
            map.put("state",1);
            requestHistoryDAO.update(map);
        } else if(approval.equals("false")){
            map.put("rqstNum",rqstNum);
            map.put("remarks",remarks);
            map.put("state",2);
            requestHistoryDAO.update(map);
        } else if(approval.equals("cancle")){
            map.put("rqstNum",rqstNum);
            map.put("remarks",null);
            map.put("state",3);
            requestHistoryDAO.update(map);
        }

    }

    @Override
    public ActionForward selectAllByEmp(HttpServletRequest request, HttpServletResponse response) {
        RequestHistoryDAO requestHistoryDAO = new RequestHistoryDAO();
        HttpSession session = request.getSession();
        EmpDTO dto = (EmpDTO) session.getAttribute("login");

        List<RequestHistoryVO> list = requestHistoryDAO.selectAllByEmp(dto.getEmp_num());
        System.out.println(list);
        request.setAttribute("list" ,list);

        ActionForward forward = new ActionForward();
        forward.setPath("/views/user/requestHistoryView.jsp");
        return forward;
    }

	@Override
	public void searchTotalRequestHistory(HttpServletRequest request, HttpServletResponse response) {
		String searchType = request.getParameter("searchType");
		String searchWord = request.getParameter("searchWord");
		System.out.println(searchType); System.out.println(searchWord);
		try {
			HashMap<String, String> map = new HashMap<>();
			map.put("searchType", searchType);
			map.put("searchWord", searchWord);
			
			RequestHistoryDAO dao = new RequestHistoryDAO();
			List<RequestHistoryVO> list = dao.searchTotalRequestHistory(map);
			
			Gson gson = new Gson();
			String json = gson.toJson(list);
			System.out.println(json);
			
			response.setContentType("application/json");
			response.setCharacterEncoding("utf-8");
			response.getWriter().print(json);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void searchByDateRequestHistory(HttpServletRequest request, HttpServletResponse response) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		String startDate = request.getParameter("datepicker1");
		String endDate = request.getParameter("datepicker2");

		try {
			HashMap<String, Date> map = new HashMap<>();
			map.put("startDate", sdf.parse(startDate));
			map.put("endDate", sdf.parse(endDate));

			RequestHistoryDAO dao = new RequestHistoryDAO();
			List<RequestHistoryVO> list = dao.searchByDateRequestHistory(map);

            Gson gson = new Gson();
            String json = gson.toJson(list);
            System.out.println(json);
     
            
			// jsonArr.add(json);
// 			System.out.println(json.toJSONString());
			response.setContentType("application/json");
			response.setCharacterEncoding("utf-8");
			response.getWriter().print(json);

		} catch (ParseException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}


}