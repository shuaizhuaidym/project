package com.jit.project.report.bean;

/** 
 * 周统计报表 公用实体 
 */
public class DeptReport {

	//任务类型
	String count_type;
	//任务总数
	String work_count;
	//投入人力总数（最好单位为天，如果是小时，转换为天后不能有误差）
	String hours;
	

	/**
	 * 任务类型/行业统计
	 * @param work_type 分组类型，可能是工作量类型或者行业
	 * @param work_count
	 * @param hours
	 */
	public DeptReport(String count_type, String work_count, String hours) {
		super();
		this.count_type = count_type;
		this.work_count = work_count;
		this.hours = hours;
	}

	public String getWork_count() {
		return work_count;
	}

	public void setWork_count(String work_count) {
		this.work_count = work_count;
	}

	public String getHours() {
		return hours;
	}

	public void setHours(String hours) {
		this.hours = hours;
	}



	public String getCount_type() {
		return count_type;
	}



	public void setCount_type(String count_type) {
		this.count_type = count_type;
	}
}
