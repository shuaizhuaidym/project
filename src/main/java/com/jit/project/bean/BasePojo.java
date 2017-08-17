package com.jit.project.bean;

import java.sql.Date;

import org.nutz.dao.entity.annotation.Column;
import org.nutz.json.Json;
import org.nutz.json.JsonFormat;

public class BasePojo {
	@Column("create_time")
	protected Date createTime;
	@Column("update_time")
	protected Date updateTime;
	@Column("version")
	protected Integer version;

	public String toString() {
		return String.format("/*%s*/%s", super.toString(), Json.toJson(this, JsonFormat.compact()));
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
}
