package com.kosa.hrsystem.vo;

import java.util.Date;
import java.util.List;

import com.kosa.hrsystem.dto.CareerDTO;
import com.kosa.hrsystem.dto.CertificateDTO;
import com.kosa.hrsystem.dto.IfileDTO;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class EmpVO {
	private int emp_num; 			// 사원번호
	private String emp_name; 		// 직통번호 
	private String permission_type; // 권한타입
	private String dept_code;		// 부서코드
	private String dept; 			// 부서명
	private String rank_code;		// 직급코드
	private String rank; 			// 직급명
	private int work_num;			// 근무형태코드
	private String work_name;		// 근무형태
	private Date hire_date;			// 입사일
	private Date departure_date;    // 퇴사일
	private String reason;			// 퇴사사유
	private String direct_num; 		// 직통번호
	private String phone;			// 연락처
	private String regist_num;		// 주민번호
	private String post_code;		// 우편번호
	private String address;			// 주소
	private String detail_address;	// 상세주소
	private int annual_num;			// 연차수
	private String email;			// 이메일
	private String remarks;			// 비고
	
}
