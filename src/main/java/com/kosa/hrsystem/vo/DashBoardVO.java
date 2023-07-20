package com.kosa.hrsystem.vo;

import java.util.Date;
import java.util.List;

import com.kosa.hrsystem.dto.RequestHistoryDTO;

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
public class DashBoardVO {
	private int emp_num;
	private Date go_work;
	private Date leave_work;
	private Date vctn_start_date;
	private Date vctn_end_date;
	private int att_count;
	private int not_att_count;
	private int leave_count;
	private int vac_count;
	private int non_approve_count;
//	private List<RequestHistoryDTO> reqHistory;
	private List<RequestHistoryVO> rhvo;
}
