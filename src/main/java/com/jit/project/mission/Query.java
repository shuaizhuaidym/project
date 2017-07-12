package com.jit.project.mission;

import org.apache.commons.lang3.StringUtils;
import org.nutz.dao.Condition;
import org.nutz.dao.entity.Entity;

public class Query implements Condition {
	private Integer pageNumber = 1;

	private Integer pageSize = 15;
	
	private String assignTo;
	
	private String module;

	@Override
	public String toSql(Entity<?> entity) {
		StringBuilder buf = new StringBuilder("1=1");
		if (StringUtils.isNoneEmpty(assignTo)) {
			buf.append(" and assign_to='").append(assignTo).append("'");
		}
		if(StringUtils.isNoneEmpty(module)){
			buf.append(" and (module='").append(module).append("'");
			buf.append(" or product_name='").append(module).append("')");
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
}
