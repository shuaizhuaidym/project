package com.jit.project.daily.bean;

import java.util.Date;

import org.nutz.dao.entity.annotation.Table;

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
@Table("v_daily_list")
public class VDailyItem {

	public Date getReport_date() {
		return report_date;
	}

	public void setReport_date(Date report_date) {
		this.report_date = report_date;
	}

	String daily_id;
	String reporter;
	Date report_date;
	String mission_name;
	String hours;
	String percentage;
	String progress_detail;
	String problerm;
	Date plan_start;
	Date start_date;
	Date plan_end;
	Date end_date;
	String state;
	
	public java.util.Date getPlan_start() {
		return plan_start;
	}

	public void setPlan_start(java.util.Date plan_start) {
		this.plan_start = plan_start;
	}

	public java.util.Date getStart_date() {
		return start_date;
	}

	public void setStart_date(java.util.Date start_date) {
		this.start_date = start_date;
	}

	public java.util.Date getPlan_end() {
		return plan_end;
	}

	public void setPlan_end(java.util.Date plan_end) {
		this.plan_end = plan_end;
	}

	public java.util.Date getEnd_date() {
		return end_date;
	}

	public void setEnd_date(java.util.Date end_date) {
		this.end_date = end_date;
	}

	public String getDaily_id() {
		return daily_id;
	}
	
	public void setDaily_id(String daily_id) {
		this.daily_id = daily_id;
	}
	
	public String getReporter() {
		return reporter;
	}
	
	public void setReporter(String reporter) {
		this.reporter = reporter;
	}

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

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

}
