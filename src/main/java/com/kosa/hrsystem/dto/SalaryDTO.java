package com.kosa.hrsystem.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class SalaryDTO {
	private int sal_num; // 급여 일련번호
	private int emp_num; //사원번호
	private int bsns_num; // 사업자번호
	private int basic_sal; // 기본금
	private int bonus_sal; // 상여금
	private int position_sal; // 직책수당
	private int annual_sal; // 연차수당
	private int national_pension; // 국민연금
	private int health_insurance; // 건강보험
	private int lncr_insurance; // 장기요양보험
	private int empl_insurance; // 고용보험
	private int income_tax; // 소득세
	private int local_intax; // 지방소득세
	private int real_sal; // 실수령급여
	private int group; // 그룹(직무,직위,직급 별 명세 그룹)
}
