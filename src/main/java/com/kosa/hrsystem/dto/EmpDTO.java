package com.kosa.hrsystem.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import java.util.Date;

@Getter 
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class EmpDTO {
    private int emp_num;            // 사원 번호
    private String emp_name;        // 사원명
    private String pwd;             // 비밀번호
    private String email;           // 이메일
    private Date hire_date;         // 입사일
    private Date departure_date;    // 퇴사일
    private String reason;          // 퇴사 사유
    private String direct_num;      // 직통 번호
    private String phone;           // 연락처
    private String regist_num;      // 주민등록번호
    private double annual_num;      // 연차 수
    private String post_code; 			// 우편번호
    private String address;         // 주소
    private String detail_address;  // 상세주소
    private int permission_type;    // 직원 구분(관리자 or 사용자)
    private String dept;            // 부서
    private String rank;            // 직급
    private int work_num;			// 근로번호
    private String remarks;			// 메모
}
