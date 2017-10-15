package com.jit.project.mission;

import org.apache.commons.lang3.StringUtils;
import org.nutz.dao.Condition;
import org.nutz.dao.entity.Entity;

public class Query implements Condition {

	private static final long serialVersionUID = -3996470065266548962L;

	private Integer pageNumber = 1;

	private Integer pageSize = 15;
	
	private String missionName;
	
	private String assignTo;
	
	private String module;
	
	private String status;
	
	private String createTime;
	//研发版本（计划发布版本）
	private String devVersion;
	
	private String keyword;
	
	public Query() {
		super();
	}

	public Query(String assignTo) {
		super();
		this.assignTo = assignTo;
	}

	@Override
	public String toSql(Entity<?> entity) {
		StringBuilder buf = new StringBuilder("1=1");
		if (StringUtils.isNoneEmpty(assignTo)) {
			buf.append(" and (assign_to ='").append(assignTo).append("'");
			buf.append(" or assign_to ='IPC全体') ");
		}
		if(StringUtils.isNoneEmpty(missionName)){
			buf.append(" and instr(mission_name, '").append(missionName).append("')>0");
		}
		if(StringUtils.isNoneEmpty(createTime)){
			buf.append(" and DATEDIFF(create_time,'").append(createTime).append("')>=0");
		}
		if(StringUtils.isNoneEmpty(status)){
			buf.append(" and status = '").append(status).append("'");
		}
		if(StringUtils.isNoneEmpty(module)){
			buf.append(" and (module ='").append(module).append("'");
			buf.append(" or product_name='").append(module).append("')");
		}
		if(StringUtils.isNoneEmpty(devVersion)){
			buf.append(" and publish_version ='").append(devVersion).append("'");
		}
		buf.append(" order by create_time desc");
		return buf.toString();
	}

	public Integer getPageNumber() {
		return pageNumber;
	}

	public void setPageNumber(Integer pageNumber) {
		this.pageNumber = pageNumber;
	}

	public Integer getPageSize() {
		return pageSize;
	}

	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}

	public String getAssignTo() {
		return assignTo;
	}

	public void setAssignTo(String assignTo) {
		this.assignTo = assignTo;
	}

	public String getModule() {
		return module;
	}

	public void setModule(String module) {
		this.module = module;
	}

	public String getMissionName() {
		return missionName;
	}

	public void setMissionName(String missionName) {
		this.missionName = missionName;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getCreateTime() {
		return createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

	public String getDevVersion() {
		return devVersion;
	}

	public void setDevVersion(String devVersion) {
		this.devVersion = devVersion;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
}
