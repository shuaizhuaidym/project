package com.jit.project.mission;

/**
 * @author yanming_dai
 * @date 2017-06-02
 */
import java.util.*;

public class Mission {

	/** @pdOid 9364051b-8e50-4553-bc07-f426120ca78d */
	private String missionID;
	/** @pdOid c7a4e452-6f6f-4a98-91c8-263dd9ad6cb3 */
	private String missionName;
	/**
	 * @pdOid f59d356b-91fd-4cac-a6b1-84c8be711f4e 类型：科研项目售前技术支持 售后技术支持 持续改进
	 *        售后需求开发 售前需求开发 售前定制开发 售后定制开发 应该是属于项目类型
	 */
	private int type;
	/** @pdOid f64ea39c-0ab7-48dd-8ab6-fd544ec284d5 */
	private String content;
	/** @pdOid cb98adef-2618-461f-9733-c1135dde7b38 */
	private Date deadLine;
	/** @pdOid 794d2ba4-379d-4352-83c4-1d5b2ebdd9f1 */
	private int status;
	/** @pdOid 50561c0a-f3b6-4fdf-8db5-28b444c057c9 */
	private int progress;
	/**
	 * @pdOid dc99cc8e-017b-481d-89fb-fbe5201fde97 任务类别：产品研发，缺陷，改进
	 */
	private int taskClass;
	/** @pdOid 5c25accb-d7cb-4cbf-ae8d-8b234d674875 */
	private String parentID;
	/** @pdOid 15ba05a4-8a81-46d1-a912-099e47ee3550 */
	private String productVersion;
	/** @pdOid a7a59ddb-57f6-4798-af41-8b63102e35cc */
	private Date planStart;
	/** @pdOid 48da0b26-5ba6-48e3-9b18-a29ab6412bd1 */
	private Date startDate;
	/** @pdOid 0113f74c-ac82-4488-a83c-fa7665163443 */
	private Date planEnd;
	/** @pdOid df6b8632-3e43-4fe5-805a-9f5a9b4ca60e */
	private Date endDate;
	/** @pdOid 94fcb208-b43f-4a57-934f-0aaf90ba2a8c */
	private int productSubType;
	/** @pdOid d4fef680-bad6-4826-8217-890fb878cab8 */
	private int productBaseVersion;

	/** @pdOid a33e5d76-8f56-4b94-bb8f-95e03ce4ffcc */
	private int module;

	public String getMissionID() {
		return missionID;
	}

	public void setMissionID(String missionID) {
		this.missionID = missionID;
	}

	public String getMissionName() {
		return missionName;
	}

	public void setMissionName(String missionName) {
		this.missionName = missionName;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getDeadLine() {
		return deadLine;
	}

	public void setDeadLine(Date deadLine) {
		this.deadLine = deadLine;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public int getProgress() {
		return progress;
	}

	public void setProgress(int progress) {
		this.progress = progress;
	}

	public int getTaskClass() {
		return taskClass;
	}

	public void setTaskClass(int taskClass) {
		this.taskClass = taskClass;
	}

	public String getParentID() {
		return parentID;
	}

	public void setParentID(String parentID) {
		this.parentID = parentID;
	}

	public String getProductVersion() {
		return productVersion;
	}

	public void setProductVersion(String productVersion) {
		this.productVersion = productVersion;
	}

	public Date getPlanStart() {
		return planStart;
	}

	public void setPlanStart(Date planStart) {
		this.planStart = planStart;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getPlanEnd() {
		return planEnd;
	}

	public void setPlanEnd(Date planEnd) {
		this.planEnd = planEnd;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public int getProductSubType() {
		return productSubType;
	}

	public void setProductSubType(int productSubType) {
		this.productSubType = productSubType;
	}

	public int getProductBaseVersion() {
		return productBaseVersion;
	}

	public void setProductBaseVersion(int productBaseVersion) {
		this.productBaseVersion = productBaseVersion;
	}

	public int getModule() {
		return module;
	}

	public void setModule(int module) {
		this.module = module;
	}

}