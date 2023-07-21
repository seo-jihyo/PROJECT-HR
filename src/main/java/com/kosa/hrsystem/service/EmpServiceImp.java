package com.kosa.hrsystem.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Objects;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.kosa.hrsystem.action.Action;
import com.kosa.hrsystem.action.ActionForward;
import com.kosa.hrsystem.dao.*;
import com.kosa.hrsystem.dto.CareerDTO;
import com.kosa.hrsystem.dto.CertificateDTO;
import com.kosa.hrsystem.dto.CodeTableDTO;
import com.kosa.hrsystem.dto.EmpDTO;
import com.kosa.hrsystem.dto.WorkDTO;
import com.kosa.hrsystem.dto.WorkScheduleTypeDTO;
import com.kosa.hrsystem.utils.Encrypt;
import com.kosa.hrsystem.utils.NaverSMTP;
import com.kosa.hrsystem.utils.RandomPwd;
import com.kosa.hrsystem.vo.EmpVO;
import com.kosa.hrsystem.vo.MyPageVO;
import com.kosa.hrsystem.vo.WorkScheduleVO;
import com.kosa.hrsystem.vo.WorkVO;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

public class EmpServiceImp implements EmpService {

    @Override
    public ActionForward selectAll(HttpServletRequest request, HttpServletResponse response) {
        EmpDAO dao = new EmpDAO();

        try {

            List<EmpVO> list = dao.selectAllEmp();
            List<CodeTableDTO> optDept = new CodeTableDAO().selectAllByParent("D001");
            List<CodeTableDTO> optRank = new CodeTableDAO().selectAllByParent("R001");
            List<WorkVO> optWork = new WorkDAO().selectAllWork();
            request.setAttribute("list", list);
            request.setAttribute("optDept", optDept);
            request.setAttribute("optRank", optRank);
            request.setAttribute("optWork", optWork);

        } catch (Exception e) {
            e.printStackTrace();
        }
        ActionForward forward = new ActionForward();
        forward.setRedirect(false);
        forward.setPath("/views/admin/employee/employeeView.jsp");
        return forward;
    }

    @Override
    public ActionForward insert(HttpServletRequest request, HttpServletResponse response) {
        EmpDAO dao = new EmpDAO();

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        RandomPwd rp = new RandomPwd();


        String emp_name = Objects.requireNonNullElse(request.getParameter("emp-name"), "");
        int emp_num = Integer.parseInt(Objects.requireNonNullElse(request.getParameter("emp-num"), "0"));
        String emp_email = Objects.requireNonNullElse(request.getParameter("emp-email"), "");
        String emp_pwd = rp.generateRandomPassword(12);
        String emp_dept = Objects.requireNonNullElse(request.getParameter("emp-dept"), "");
        String emp_regist_num = Objects.requireNonNullElse(request.getParameter("emp-regist-num"), "");
        String emp_rank = Objects.requireNonNullElse(request.getParameter("emp-rank"), "");
        String emp_phone = Objects.requireNonNullElse(request.getParameter("emp-phone"), "");
        int emp_permission_type = Integer.parseInt(Objects.requireNonNullElse(request.getParameter("emp-permission-type"), "0"));
        String emp_direct_num = Objects.requireNonNullElse(request.getParameter("emp-direct-num"), "");
        String emp_post_code = Objects.requireNonNullElse(request.getParameter("emp-post-code"), "");
        String emp_address = Objects.requireNonNullElse(request.getParameter("emp-address"), "");
        String emp_detail_address = Objects.requireNonNullElse(request.getParameter("emp-detail-address"), "");
        String emp_reason = Objects.requireNonNullElse(request.getParameter("emp-reason"), "");
        String emp_remarks = Objects.requireNonNullElse(request.getParameter("remarks"), "");
        String emp_hire_date = Objects.requireNonNullElse(request.getParameter("emp-hire-date"), "");
        String emp_departure_date = Objects.requireNonNullElse(request.getParameter("emp-departure-date"), "");
        int work_num = Integer.parseInt(Objects.requireNonNullElse(request.getParameter("emp-workNum"), "0"));

        int result = dao.checkEmail(emp_email);

        JSONObject json = new JSONObject();

        if (result == 1) {
            json.put("status", "false");
        } else {
            json.put("status", "true");

            Encrypt en = new Encrypt();
            String encryptPwd = en.getEncrypt(emp_pwd); // 암호화 emp_pwd
            emailSend(emp_email, emp_pwd); // 메일 전송

            try {
                EmpDTO dto = new EmpDTO();
                dto.setEmp_num(emp_num);
                dto.setEmp_name(emp_name);
                dto.setEmail(emp_email);
                dto.setPwd(encryptPwd);
                dto.setDept(emp_dept);
                dto.setRegist_num(emp_regist_num);
                dto.setRank(emp_rank);
                dto.setPhone(emp_phone);
                dto.setPermission_type(emp_permission_type);
                dto.setDirect_num(emp_direct_num);
                dto.setPost_code(emp_post_code);
                dto.setAddress(emp_address);
                dto.setDetail_address(emp_detail_address);
                dto.setRemarks(emp_remarks);
                dto.setReason(emp_reason);
                dto.setHire_date(sdf.parse(emp_hire_date));
                dto.setWork_num(work_num);
                if (!emp_departure_date.equals("")) {
                    dto.setDeparture_date(sdf.parse(emp_departure_date));
                } else {
                    dto.setDeparture_date(null);
                }

                dao.insertEmp(dto);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        try {
            response.setCharacterEncoding("utf-8");
            response.getWriter().print(json);
            //System.out.println(json);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

        return null;
    }

    @Override
    public ActionForward update(HttpServletRequest request, HttpServletResponse response) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        RandomPwd rp = new RandomPwd();

        int emp_num = Integer.parseInt(request.getParameter("emp-num"));
        String emp_name = request.getParameter("emp-name");
        String emp_dept = request.getParameter("emp-dept");
        String emp_rank = request.getParameter("emp-rank");
        String emp_phone = request.getParameter("emp-phone");
        int emp_permission_type = Integer.parseInt(request.getParameter("emp-permission-type"));
        String emp_direct_num = request.getParameter("emp-direct-num");
        String emp_post_code = request.getParameter("emp-post-code");
        String emp_address = request.getParameter("emp-address");
        String emp_detail_address = request.getParameter("emp-detail-address");
        String emp_reason = request.getParameter("emp-reason");
        String emp_remarks = request.getParameter("remarks");
        String emp_hire_date = request.getParameter("emp-hire-date");
        String emp_departure_date = request.getParameter("emp-departure-date");
        String workNum = request.getParameter("workNum");

        try {
            EmpDTO dto = new EmpDTO();
            dto.setEmp_num(emp_num);
            dto.setEmp_name(emp_name);
            dto.setDept(emp_dept);
            dto.setRank(emp_rank);
            dto.setPhone(emp_phone);
            dto.setPermission_type(emp_permission_type);
            dto.setDirect_num(emp_direct_num);
            dto.setPost_code(emp_post_code);
            dto.setAddress(emp_address);
            dto.setDetail_address(emp_detail_address);
            dto.setReason(emp_reason);
            dto.setRemarks(emp_remarks);
            dto.setHire_date(sdf.parse(emp_hire_date));
            dto.setWork_num(Integer.parseInt(workNum));
            if (!emp_departure_date.equals("")) {
                dto.setDeparture_date(sdf.parse(emp_departure_date));
            } else {
                dto.setDeparture_date(null);
            }
            EmpDAO dao = new EmpDAO();
            dao.updateEmp(dto);
        } catch (Exception e) {
            e.printStackTrace();
        }

        ActionForward forward = new ActionForward();
        forward.setRedirect(true);
        forward.setPath("/emp.do?cate=nav-emp");
        return forward;
    }

    @Override
    public ActionForward delete(HttpServletRequest request, HttpServletResponse response) {
        int emp_num = Integer.parseInt(request.getParameter("emp-num"));
        System.out.println(emp_num);
        EmpDAO dao = new EmpDAO();
        try {
            dao.deleteEmp(emp_num);
        } catch (Exception e) {
            e.printStackTrace();
        }
        ActionForward forward = new ActionForward();
        forward.setRedirect(true);
        forward.setPath("/emp.do?cate=nav-emp");
        return forward;
    }

    public void emailSend(String email, String pwd) {
        // 이메일 내용 저장
        Map<String, String> emailInfo = new HashMap<>();
        emailInfo.put("from", "jkl02138@naver.com");
        emailInfo.put("to", email);
        emailInfo.put("subject", "아이디,비밀번호를 전달합니다.");

        // 내용은 메일 포맷에 따라 다르게 처리
        String content = "아이디 : " + email + ", 비밀번호 : " + pwd;
        emailInfo.put("content", content);
        emailInfo.put("format", "text/plain;charset=UTF-8");

        try {
            NaverSMTP smtpServer = new NaverSMTP();
            smtpServer.emailSending(emailInfo);
            System.out.println("이메일 전송 성공");
        } catch (MessagingException e) {
            System.out.println("이메일 전송 실패");
            e.printStackTrace();
        }
    }

    @Override
    public ActionForward searchId(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        String registNum = request.getParameter("regist-num");
        //System.out.println(name + " , " + registNum);
        HashMap<String, String> map = new HashMap<>();
        map.put("emp_name", name);
        map.put("regist_num", registNum);

        EmpDAO dao = new EmpDAO();
        String email = dao.searchId(map);

        try {
            if (email != null) {
                response.getOutputStream().write(email.getBytes());
            } else {
                response.getOutputStream().write("없어용".getBytes());
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public ActionForward searchPwd(HttpServletRequest request, HttpServletResponse response) {
        String email = request.getParameter("email");
        String registNum = request.getParameter("regist-num");

        HashMap<String, String> map = new HashMap<>();
        map.put("email", email);
        map.put("regist_num", registNum);

        EmpDAO dao = new EmpDAO();
        String pwd = dao.searchPwd(map);
        resetPassword(email);
        try {
            if (pwd != null) {
                response.getOutputStream().write(pwd.getBytes());
            } else {
                response.getOutputStream().write("없어용".getBytes());
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }

    public void resetPassword(String email) {
        EmpDAO dao = new EmpDAO();
        Map<String, String> emailInfo = new HashMap<>();
        emailInfo.put("from", "jkl02138@naver.com");
        emailInfo.put("to", email);
        emailInfo.put("subject", "아이디,비밀번호를 전달합니다.");

        // 내용은 메일 포맷에 따라 다르게 처리
        String content = "<input type=\"button\" value=\"비밀번호 재설정\" onclick='location.href=\"http://localhost:8080/resetPwd.do?email=" + email + "\"'>";
        emailInfo.put("content", content);
        emailInfo.put("format", "text/plain;charset=UTF-8");

        try {
            NaverSMTP smtpServer = new NaverSMTP();
            smtpServer.emailSending(emailInfo);
            System.out.println("이메일 전송 성공");
        } catch (MessagingException e) {
            System.out.println("이메일 전송 실패");
            e.printStackTrace();
        }
    }

    @Override
    public ActionForward updatePwd(HttpServletRequest request, HttpServletResponse response) {
        String email = request.getParameter("email");
        String pwd = request.getParameter("pwd");

        HashMap<String, String> map = new HashMap<>();

        map.put("email", email);
        map.put("pwd", Encrypt.getEncrypt(pwd));

        EmpDAO dao = new EmpDAO();
        dao.updatePwd(map);
        ActionForward forward = new ActionForward();
        forward.setRedirect(true);
        forward.setPath("/login.do");
        return forward;
    }

    @Override
    public ActionForward insertCareerByManager(HttpServletRequest request, HttpServletResponse response) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

        try {
            String[] jsonData = request.getParameterValues("careerGroup");
            JSONParser jsonParser = new JSONParser();
            JSONArray jsonArray = (JSONArray) jsonParser.parse(jsonData[0]);
            String[][] arrData = new String[jsonArray.size()][];
            for (int i = 0; i < jsonArray.size(); i++) {
                JSONArray rowArray = (JSONArray) jsonArray.get(i);
                String[] row = new String[rowArray.size() - 1];
                for (int j = 0; j < rowArray.size() - 1; j++) {
                    row[j] = (String) rowArray.get(j);
                }
                arrData[i] = row;
                System.out.println(Arrays.toString(arrData[i]));

                CareerDTO cdto = new CareerDTO();
                cdto.setEmp_num(Integer.parseInt(arrData[i][0]));
                cdto.setCompany_name(arrData[i][1]);
                cdto.setDept(arrData[i][2]);
                cdto.setRank(arrData[i][3]);
                cdto.setMain_tesk(arrData[i][4]);
                cdto.setJoin_date(sdf.parse(arrData[i][5]));
                cdto.setLeave_date(sdf.parse(arrData[i][6]));
                cdto.setRemarks(arrData[i][7]);

                CareerDAO dao = new CareerDAO();
                int result = dao.insertCareer(cdto);
                System.out.println("Manager insert : " + result);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        ActionForward forward = new ActionForward();
        forward.setRedirect(true);
        forward.setPath("/emp.do?cate=nav-emp");
        return forward;
    }

    @Override
    public ActionForward insertCertByManager(HttpServletRequest request, HttpServletResponse response) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

        try {
            String[] jsonData = request.getParameterValues("certGroup");
            JSONParser jsonParser = new JSONParser();
            JSONArray jsonArray;
            jsonArray = (JSONArray) jsonParser.parse(jsonData[0]);
            String[][] arrData = new String[jsonArray.size()][];
            for (int i = 0; i < jsonArray.size(); i++) {
                JSONArray rowArray = (JSONArray) jsonArray.get(i);
                String[] row = new String[rowArray.size() - 1];
                for (int j = 0; j < rowArray.size() - 1; j++) {
                    row[j] = (String) rowArray.get(j);
                }
                arrData[i] = row;
                System.out.println(Arrays.toString(arrData[i]));

                CertificateDTO cdto = new CertificateDTO();
                cdto.setEmp_num(Integer.parseInt(arrData[i][0]));
                cdto.setCrtfc_name(arrData[i][1]);
                cdto.setIssuer(arrData[i][2]);
                cdto.setAcquisition_date(sdf.parse(arrData[i][3]));
                cdto.setRemarks(arrData[i][4]);
                CertificateDAO dao = new CertificateDAO();
                int result = dao.insertCert(cdto);
                System.out.println("result : " + result);
            }
        } catch (org.json.simple.parser.ParseException e) {
            e.printStackTrace();
        } catch (ParseException e) {
            e.printStackTrace();
        }
        ActionForward forward = new ActionForward();
        forward.setRedirect(true);
        forward.setPath("/emp.do?cate=nav-emp");
        return forward;
    }

    @Override
    public ActionForward selectCertByManager(HttpServletRequest request, HttpServletResponse response) {

        int empNum = Integer.parseInt(request.getParameter("emp-num"));

        EmpDAO dao = new EmpDAO();
        try {
            MyPageVO info = dao.selectOneUser(empNum);
            System.out.println(info);
            request.setAttribute("info", info);
        } catch (Exception e) {
            e.printStackTrace();
        }

        ActionForward forward = new ActionForward();
        forward.setRedirect(false);
        forward.setPath("/emp.do?cate=nav-emp");
        return forward;
    }

    @Override
    public ActionForward deleteCertByManager(HttpServletRequest request, HttpServletResponse response) {
        //int certNum = Integer.parseInt(request.getParameter("certNum"));

        String certName = Objects.requireNonNullElse(request.getParameter("certName"), "");
        String issuer = Objects.requireNonNullElse(request.getParameter("issuer"), "");
        System.out.println(certName);
        System.out.println(issuer);
        HashMap<String, String> map = new HashMap<>();
        map.put("certName", certName);
        map.put("issuer", issuer);

        CertificateDAO dao = new CertificateDAO();
        int result = dao.deleteCertByCrtfcNumAndIssuer(map);
        System.out.println("delete : " + result);

        ActionForward forward = new ActionForward();
        forward.setRedirect(true);
        forward.setPath("/emp.do?cate=nav-emp");
        return forward;
    }

    @Override
    public ActionForward selectCareerByManager(HttpServletRequest request, HttpServletResponse response) {
        try {
            int empNum = Integer.parseInt("emp-num");
            CareerDAO dao = new CareerDAO();
            List<CareerDTO> list = dao.selectCareer(empNum);
            System.out.println("리스트 : " + list);
            request.setAttribute("careerlist", list);
        } catch (Exception e) {
            e.printStackTrace();
        }
        ActionForward forward = new ActionForward();
        forward.setRedirect(true);
        forward.setPath("/emp.do?cate=nav-emp");
        return forward;
    }

    @Override
    public ActionForward deleteCareerByManager(HttpServletRequest request, HttpServletResponse response) {
        String companyName = request.getParameter("companyName");

        CareerDAO dao = new CareerDAO();
        try {
            int result = dao.deleteCareerByCompanyName(companyName);
            System.out.println(result);
        } catch (Exception e) {
            e.printStackTrace();
        }

        ActionForward forward = new ActionForward();
        forward.setRedirect(true);
        forward.setPath("/emp.do?cate=nav-emp");
        return forward;
    }

    @Override
    public void searchEmp(HttpServletRequest request, HttpServletResponse response) {
        String searchType = request.getParameter("searchType");
        String searchWord = request.getParameter("searchWord");
        System.out.println(searchType); System.out.println(searchWord);
        try {
            HashMap<String, String> map = new HashMap<>();
            map.put("searchType", searchType);
            map.put("searchWord", searchWord);

            EmpDAO dao = new EmpDAO();
            List<EmpVO> list = dao.searchEmp(map);

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

}
