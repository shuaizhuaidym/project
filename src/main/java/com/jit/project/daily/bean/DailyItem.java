package com.jit.project.daily.bean;

import org.nutz.dao.entity.annotation.Column;
import org.nutz.dao.entity.annotation.Id;
import org.nutz.dao.entity.annotation.Table;


/**
 * @author yanming_dai
 * @date 2017-06-02
 */
@Table("t_daily_item")
public class DailyItem {
	@Id
	@Column("item_id")
	private int itemID;
	
	@Column("daily_id")
	private int dailyID = -1;
	
	@Column("mission_id")
	private String missionID;
	
	@Column("mission_name")
	private String missionName;
	
	@Column("mission_summary")
	private String missionSummary;
	//工时
	@Column("hours")
	private int hours;
	//完成百分比
	@Column("percentage")
	private int percentage;
	//处理过程（工作内容）
	@Column("progress_detail")
	private String detail;
	//遇到的问题
	@Column("problerm")
	private String problerm;

	public int getItemID() {
		return itemID;
	}

	public void setItemID(int itemID) {
		this.itemID = itemID;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public String getProblerm() {
		return problerm;
	}

	public void setProblerm(String problerm) {
		this.problerm = problerm;
	}

	public int getDailyID() {
		return dailyID;
	}

	public void setDailyID(int dailyID) {
		this.dailyID = dailyID;
	}

	public String getMissionID() {
		return missionID;
	}

	public void setMissionID(String missionID) {
		this.missionID = missionID;
	}

	public String getMissionSummary() {
		return missionSummary;
	}

	public void setMissionSummary(String missionSummary) {
		this.missionSummary = missionSummary;
	}

	public int getHours() {
		return hours;
	}

	public void setHours(int hours) {
		this.hours = hours;
	}

	public int getPercentage() {
		return percentage;
	}

	public void setPercentage(int percentage) {
		this.percentage = percentage;
	}

	public String getMissionName() {
		return missionName;
	}

	public void setMissionName(String missionName) {
		this.missionName = missionName;
	}

}