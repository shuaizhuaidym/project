package com.jit.project.mission;

/**
 * @author yanming_dai
 * @date 2017-06-02
 */
import java.text.SimpleDateFormat;
import java.util.Date;

import org.nutz.dao.entity.annotation.Column;
import org.nutz.dao.entity.annotation.EL;
import org.nutz.dao.entity.annotation.Id;
import org.nutz.dao.entity.annotation.Prev;
import org.nutz.dao.entity.annotation.Table;

import util.Sequence;

import com.jit.project.bean.BasePojo;
import com.jit.project.project.service.Translater;
@Table("t_mission")
public class Mission extends BasePojo{
	@Id(auto = false)
	@Prev(els = @EL("seq()"))
	@Column("mission_id")
	private Long missionID;
	
	@Column("mission_name")
	private String missionName;
	//任务类型
	@Column("type")
	private String type;
	//任务内容
	@Column("content")
	private String content;
	@Column("summary")
	private String summary;
	@Column("deadline")
	private Date deadline;
	@Column("status")
	private String status;
	@Column("progress")
	private int progress;
	//任务类别
	@Column("task_class")
	private String taskClass;
	@Column("parent_id")
	private String parentID;
	//产品迭代版本
	@Column("product_version")
	private String productVersion;
	@Column("plan_start")
	private Date planStart;
	@Column("start_date")
	private Date startDate;
	@Column("plan_end")
	private Date planEnd;
	@Column("end_date")
	private Date endDate;
	//产品子类
	@Column("product_sub_type")
	private int productSubType;
	//基线版本
	@Column("product_base_version")
	private String productBaseVersion;
	//相关项目
	@Column("project_id")
	private int projectID;
	@Column("project_name")
	private int projectName;//冗余字段
	//相关产品
	@Column("product_id")
	private int productID;
	@Column("product_name")
	private String productName;
	@Column("progress_detail")
	private String progressDetail;
	@Column("module")
	private String module;
	//项目经理
	@Column("project_manager")
	private String projectManager;
	//任务负责人
	@Column("assign_to")
	private String assignTo;
	//总投入人力*小时
	@Column("total_hours")
	private String totalHours = "0";
	@Column("team_id")
	private int teamID;
	@Column("comments")
	private String comments;
	//实际发布版本
	@Column("publish_version")
	private String publishVersion;
	//任务发起行业
	@Column("industry_id")
	private String industryID;
	@Column("industry_name")
	private String industryName;
	
	private Date lastModify;
	
	private Integer version;

	public String getFormatDeadline(){
		return deadline == null ? "" : new SimpleDateFormat("yyyy-MM-dd").format(deadline);
	}
	@Override
	public String toString() {
		return super.toString();
	}	

	@Override
	public String toSql() {
		StringBuilder template = new StringBuilder("INSERT INTO `project`.`t_mission` (");
		template.append("`mission_id`,		`mission_name`,			`type`,			`content`,		`summary`,");
		template.append("`deadline`,  		`status`,				`progress`,		`task_class`,	`parent_id`,");
		template.append("`product_version`,	`plan_start`,			`start_date`,	`plan_end`,		`end_date`,");
		template.append("`product_sub_type`,`product_base_version`,	`publish_version`,`project_id`,	`project_name`,");
		template.append("`project_manager`,	`product_id`,			`product_name`,	`module`,		`progress_detail`,");
		template.append("`assign_to`,		`total_hours`,			`team_id`,		`comments`,		`create_time`,");
		template.append("`update_time`,		`industry_id`,			`industry_name`,`version`)VALUES(");

		Sequence seq = util.Sequence.getInstance();
		SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
		template.append("(");

		Long lid = seq.nextId();
		Translater.idmaps.put(this.missionID, lid);

		template.append("`").append(lid).append("`,");
		template.append("`").append(this.missionName).append("`,");
		template.append("`").append(this.type).append("`,");
		template.append("`").append(this.content).append("`,");
		template.append("`").append(this.summary).append("`,");

		template.append("`").append(this.deadline == null ? null : fmt.format(deadline)).append("`,");
		template.append("`").append(this.status).append("`,");
		template.append("`").append(this.progress).append("`,");
		template.append("`").append(this.taskClass).append("`,");
		template.append("`").append(this.parentID).append("`,");

		template.append("`").append(this.productVersion).append("`,");
		template.append("`").append(this.planStart == null ? null : fmt.format(planStart)).append("`,");
		template.append("`").append(this.startDate == null ? null : fmt.format(startDate)).append("`,");
		template.append("`").append(this.planEnd == null ? null : fmt.format(planEnd)).append("`,");
		template.append("`").append(this.endDate == null ? null : fmt.format(endDate)).append("`,");

		template.append("`").append(this.productSubType).append("`,");
		template.append("`").append(this.productBaseVersion).append("`,");
		template.append("`").append(this.publishVersion).append("`,");
		template.append("`").append(this.projectID).append("`,");
		template.append("`").append(this.projectName).append("`,");

		template.append("`").append(this.projectManager).append("`,");
		template.append("`").append(this.productID).append("`,");
		template.append("`").append(this.productName).append("`,");
		template.append("`").append(this.module).append("`,");
		template.append("`").append(this.progressDetail).append("`,");

		template.append("`").append(this.assignTo).append("`,");
		template.append("`").append(this.totalHours).append("`,");
		template.append("`").append(this.teamID).append("`,");
		template.append("`").append(this.comments).append("`,");
		template.append("`").append(this.createTime == null ? null : fmt.format(createTime)).append("`,");

		template.append("`").append(this.updateTime == null ? null : fmt.format(updateTime)).append("`,");
		template.append("`").append(this.industryID).append("`,");
		template.append("`").append(this.industryName).append("`,");
		template.append("`").append(this.version).append("`);");
		
		return template.toString();
	}
	public Long getMissionID() {
		return missionID;
	}

	public void setMissionID(Long missionID) {
		this.missionID = missionID;
	}

	public String getMissionName() {
		return missionName;
	}

	public void setMissionName(String missionName) {
		this.missionName = missionName;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getSummary() {
		return summary;
	}

	public void setSummary(String summary) {
		this.summary = summary;
	}

	public Date getDeadline() {
		return deadline;
	}

	public void setDeadline(Date deadLine) {
		this.deadline = deadLine;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getProgress() {
		return progress;
	}

	public void setProgress(int progress) {
		this.progress = progress;
	}

	public String getTaskClass() {
		return taskClass;
	}

	public void setTaskClass(String taskClass) {
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
	
	public String getFormatPlanStart(){
		return new SimpleDateFormat("yyyy-MM-dd").format(planStart);
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

	public String getProductBaseVersion() {
		return productBaseVersion;
	}

	public void setProductBaseVersion(String productBaseVersion) {
		this.productBaseVersion = productBaseVersion;
	}

	public int getProjectID() {
		return projectID;
	}

	public void setProjectID(int projectID) {
		this.projectID = projectID;
	}

	public int getProductID() {
		return productID;
	}

	public void setProductID(int productID) {
		this.productID = productID;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getProgressDetail() {
		return progressDetail;
	}

	public void setProgressDetail(String progressDetail) {
		this.progressDetail = progressDetail;
	}

	public String getModule() {
		return module;
	}

	public void setModule(String module) {
		this.module = module;
	}

	public String getAssignTo() {
		return assignTo;
	}

	public void setAssignTo(String assginTo) {
		this.assignTo = assginTo;
	}

	public int getTeamID() {
		return teamID;
	}

	public void setTeamID(int teamID) {
		this.teamID = teamID;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public int getProjectName() {
		return projectName;
	}

	public void setProjectName(int projectName) {
		this.projectName = projectName;
	}
	public String getTotalHours() {
		return totalHours;
	}
	public void setTotalHours(String totalHours) {
		this.totalHours = totalHours;
	}
	public String getPublishVersion() {
		return publishVersion;
	}
	public void setPublishVersion(String publishVersion) {
		this.publishVersion = publishVersion;
	}
	public String getIndustryID() {
		return industryID;
	}
	public void setIndustryID(String industryID) {
		this.industryID = industryID;
	}
	public String getIndustryName() {
		return industryName;
	}
	public void setIndustryName(String industryName) {
		this.industryName = industryName;
	}
	public Date getLastModify() {
		return lastModify;
	}
	public void setLastModify(Date lastModify) {
		this.lastModify = lastModify;
	}
	public Integer getVersion() {
		return version;
	}
	public void setVersion(Integer version) {
		this.version = version;
	}
	public String getProjectManager() {
		return projectManager;
	}
	public void setProjectManager(String projectManager) {
		this.projectManager = projectManager;
	}
	
}