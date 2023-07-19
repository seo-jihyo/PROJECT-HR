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
	private String emp_name;
	private int basic; // 기본금
	private int bonus; // 상여금
	private int directBenefits; // 직책수당
	private int annualAllowance; // 연차수당
	private int payment; //지급액 계
	private int totalPay;



	private int national_pension; // 국민연금
	private int health_insurance; // 건강보험
	private int lncr_insurance; // 장기요양보험
	private int empl_insurance; // 고용보험
	private int totalDeduction; // 공제액 계



	public void calcAll(){
		this.national_pension = (int) (this.basic * 0.045);
		this.health_insurance = (int) (this.basic * 0.03545);
		this.empl_insurance = (int) (this.basic * 0.009);
		this.lncr_insurance = (int) (this.health_insurance * (0.009082/0.0709));

		this.payment = basic+bonus+(directBenefits==1?0:directBenefits*10000)+annualAllowance;
		this.totalDeduction = national_pension+health_insurance+lncr_insurance+empl_insurance;
		this.totalPay = payment - totalDeduction;
	}


//	private int income_tax; // 소득세
//	private int local_intax; // 지방소득세
//	private int real_sal; // 실수령급여
//	private int group; // 그룹(직무,직위,직급 별 명세 그룹)
}
