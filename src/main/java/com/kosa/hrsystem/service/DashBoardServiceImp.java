package com.kosa.hrsystem.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kosa.hrsystem.action.ActionForward;
import com.kosa.hrsystem.dao.DashBoardDAO;
import com.kosa.hrsystem.dao.RequestHistoryDAO;
import com.kosa.hrsystem.vo.DashBoardVO;
import com.kosa.hrsystem.vo.RequestHistoryVO;

public class DashBoardServiceImp implements DashBoardService {

//    @Override
//    public ActionForward selectAllRequest(HttpServletRequest request, HttpServletResponse response) {
//        RequestHistoryDAO dao = new RequestHistoryDAO();
//        try {
//            List<RequestHistoryVO> list = dao.selectAllRequest();
//            System.out.println(list);
//            request.setAttribute("list", list);
//            ActionForward forward = new ActionForward();
//            forward.setRedirect(false);
//            forward.setPath("/views/user/dashboard.jsp");
//            return forward;
//        } catch (Exception e) {
//            throw new RuntimeException(e);
//        }
//    }

	@Override
	public ActionForward selectAttCnt(HttpServletRequest request, HttpServletResponse response) {
		DashBoardDAO dao = new DashBoardDAO();
		try {
			List<DashBoardVO> list = dao.selectAttCnt();
			System.out.println(list);
			request.setAttribute("list", list);
			ActionForward forward  = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/views/user/dashboard.jsp");
			return forward;
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

/*
    private DashBoardDAO dashBoardDAO;
    
    public DashBoardServiceImp() {
        dashBoardDAO = new DashBoardDAO();
    }

    @Override
    public ActionForward selectAttCount(HttpServletRequest request, HttpServletResponse response) {
        try {
            DashBoardVO attCnt = dashBoardDAO.selectAttCount();
            request.setAttribute("attCnt", attCnt);
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        ActionForward forward = new ActionForward();
        forward.setRedirect(false);
        forward.setPath("/dashboard.jsp");
        return forward;
    }

    @Override
    public ActionForward selectNotAttCount(HttpServletRequest request, HttpServletResponse response) {
        try {
            DashBoardVO notAttCnt = dashBoardDAO.selectNotAttCount();
            request.setAttribute("notAttCnt", notAttCnt);
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        ActionForward forward = new ActionForward();
        forward.setRedirect(false);
        forward.setPath("/dashboard.jsp");
        return forward;
    }

    @Override
    public ActionForward selectLeaveCount(HttpServletRequest request, HttpServletResponse response) {
        try {
            DashBoardVO leaveCnt = dashBoardDAO.selectLeaveCount();
            request.setAttribute("leaveCnt", leaveCnt);
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        ActionForward forward = new ActionForward();
        forward.setRedirect(false);
        forward.setPath("/dashboard.jsp");
        return forward;
    }

    @Override
    public ActionForward selectVacCount(HttpServletRequest request, HttpServletResponse response) {
        try {
            DashBoardVO vacCnt = dashBoardDAO.selectVacCount();
            request.setAttribute("vacCnt", vacCnt);
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        ActionForward forward = new ActionForward();
        forward.setRedirect(false);
        forward.setPath("/dashboard.jsp");
        return forward;
    }
*/

}
