package com.jit.project.bug.bean;

import org.apache.commons.lang3.StringUtils;
import org.nutz.dao.Condition;
import org.nutz.dao.entity.Entity;

public class Query implements Condition {
	private Integer pageNumber = 1;

	private Integer pageSize = 10;
	// 负责人
	private String responsible;
	//状态
	private String status = "('打开','重新打开','新建')";

	@Override
	public String toSql(Entity<?> entity) {
		StringBuilder builder=new StringBuilder("1=1");
		if(StringUtils.isNoneEmpty(responsible)){
			builder.append(" and BG_RESPONSIBLE = ");
			builder.append("'").append(responsible).append("'");
		}
		builder.append(" and BG_STATUS in");
		builder.append(status);
		return builder.toString();
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

	public String getResponsible() {
		return responsible;
	}

	public void setResponsible(String responsible) {
		this.responsible = responsible;
	}
}