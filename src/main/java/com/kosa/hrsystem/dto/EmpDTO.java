package com.kosa.hrsystem.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.Date;

@Getter @Setter
@ToString
public class EmpDTO {
    private int emp_num;            // 사원 번호
    private int bsns_num;           // 사업자 번호

    private String emp_name;        // 사원명
    private String pwd;             // 비밀번호
    private String email;           // 이메일
    private int emp_type;           // 고용 형태
    private String reason;          // 퇴사 사유
    private int dept;               // 부서
    private int position;           // 직위
    private int duty;               // 직책
    private int duty_order;         // 직책 순서
    private int rank;               // 직급
    private int rank_order;         // 직급 순서
    private String direct_num;      // 직통 번호
    private String phone;           // 연락처
    private String regist_num;      // 주민등록번호
    private double annual_num;         // 연차 수
    private String address;         // 주소
    private String detail_address;  // 상세주소
    private char emp_sort;          // 직원 구분(관리자 or 사용자)
    private Date hire_date;         // 입사일
    private Date departure_date;    // 퇴사일
}
