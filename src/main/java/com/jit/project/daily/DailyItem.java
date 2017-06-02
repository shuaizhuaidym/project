package com.jit.project.daily;


/**
 * @author yanming_dai
 * @date 2017-06-02
 */
public class DailyItem {
	/** @pdOid 54173c3b-4371-487d-9ee9-8105c7405421 */
	private int itemID;
	/** @pdOid be220743-df0d-4b00-822d-9a30304f887f */
	/** @pdOid 41496809-cc4e-407f-8436-c6de3d40885b */
	private String detail;
	/** @pdOid 4178dfc5-83f4-4bf2-ade4-0c527af15a8f */
	private String problerm;
	/** @pdOid 7e6ea280-81ff-4e07-b341-0f7e839af384 */
	private int progress;

	/** @pdOid 8cd68897-a1ac-4af5-b947-7861e4118eee */
	private int dailyID;
	/** @pdRoleInfo migr=no name=Mission assc=association7 mult=1..1 */
	public String missionID;

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

	public int getProgress() {
		return progress;
	}

	public void setProgress(int progress) {
		this.progress = progress;
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

}