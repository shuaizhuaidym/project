package com.jit.project.mission;

import org.nutz.dao.entity.annotation.View;

/**
 * 任务研发历史，对应数据库视图，数据来源于日报表
 * @author yanming_dai
 * @date 2017年8月30日
 */
@View("v_daily_list")
public class History {
	String reporter;
	
	String progress_detail;
	
	String report_date;
	
	String hours;
	
	String percentage;
	
	String problem;
	
	public String getProgress_detail() {
		return progress_detail;
	}
	public void setProgress_detail(String progress_detail) {
		this.progress_detail = progress_detail;
	}
	public String getReport_date() {
		return report_date;
	}
	public void setReport_date(String report_date) {
		this.report_date = report_date;
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
	public String getProblem() {
		return problem;
	}
	public void setProblem(String problem) {
		this.problem = problem;
	}
	public String getReporter() {
		return reporter;
	}
	public void setReporter(String reporter) {
		this.reporter = reporter;
	}
	
}
