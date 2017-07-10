package com.jit.project.daily.bean;

import org.apache.commons.lang3.StringUtils;
import org.nutz.dao.Condition;
import org.nutz.dao.entity.Entity;

import com.jit.project.base.AbstractQuery;

import util.SQLUtil;

public class Query extends AbstractQuery implements Condition {

	private String ownerName;

	private String createDate;

	private String missionName;

	@Override
	public String toSql(Entity<?> entity) {
		StringBuilder buf = new StringBuilder("1=1");
		if (StringUtils.isNoneBlank(ownerName)) {
			buf.append(SQLUtil.varchar("owner_name", ownerName));
		}
		if (StringUtils.isNoneBlank(createDate)) {
			buf.append(SQLUtil.varchar("create_date", createDate));
		}
		// TODO precision
		if (StringUtils.isNoneBlank(missionName)) {
			buf.append(SQLUtil.varchar("mission_name", missionName));
		}
		buf.append(" order by  create_date desc ");
		return buf.toString();
	}

	public String getOwnerName() {
		return ownerName;
	}

	public void setOwnerName(String ownerName) {
		this.ownerName = ownerName;
	}

	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}

	public String getMissionName() {
		return missionName;
	}

	public void setMissionName(String missionName) {
		this.missionName = missionName;
	}
}
