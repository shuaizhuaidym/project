package com.jit.project.daily.bean;

/**
 * <p>
 * Title:VDailyItem
 * </p>
 * <p>
 * 日报展示实体,对应数据库试图
 * </p>
 * 
 * @author daiyma
 * @date 2017年8月23日
 */
public class VDailyItem {
	
	String mission_name;
	String hours;
	String percentage;
	String progress_detail;
	String problerm;
	String plan_start;
	String start_date;
	String plan_end;
	String end_date;
	String state;

	public String getMission_name() {
		return mission_name;
	}

	public void setMission_name(String mission_name) {
		this.mission_name = mission_name;
	}

	public String getHours() {
		return hours;
	}

	public void setHours(String hours) {
		this.hours = hours;
	}

	public String getPercentage() {
		return percentage;
	}

	public void setPercentage(String percentage) {
		this.percentage = percentage;
	}

	public String getProgress_detail() {
		return progress_detail;
	}

	public void setProgress_detail(String progress_detail) {
		this.progress_detail = progress_detail;
	}

	public String getProblerm() {
		return problerm;
	}

	public void setProblerm(String problerm) {
		this.problerm = problerm;
	}

	public String getPlan_start() {
		return plan_start;
	}

	public void setPlan_start(String plan_start) {
		this.plan_start = plan_start;
	}

	public String getStart_date() {
		return start_date;
	}

	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}

	public String getPlan_end() {
		return plan_end;
	}

	public void setPlan_end(String plan_end) {
		this.plan_end = plan_end;
	}

	public String getEnd_date() {
		return end_date;
	}

	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

}
