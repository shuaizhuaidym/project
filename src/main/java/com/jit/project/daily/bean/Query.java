package com.jit.project.daily.bean;

import org.apache.commons.lang3.StringUtils;
import org.nutz.dao.Cnd;
import org.nutz.dao.Condition;
import org.nutz.dao.entity.Entity;
import org.nutz.dao.sql.Criteria;

import com.jit.project.base.AbstractQuery;

public class Query extends AbstractQuery implements Condition {

	private static final long serialVersionUID = 8887767994742296510L;

	private String ownerName;
	//默认只能查询当前用户自己的和他人已经提交的日报
	private String scope;
	
	private String _group;

	private String createDate;
	
	private String createDate2;

	private String missionName;
	
	private Integer status;
	
	public Query() {
		super();
	}

	public Query(String ownerName, Integer status) {
		super();
		this.ownerName = ownerName;
		this.status = status;
	}

	@Override
	public String toSql(Entity<?> entity) {
//		StringBuilder buf = new StringBuilder("1=1");
		Criteria cri = Cnd.cri();
		if (StringUtils.isNoneBlank(ownerName)) {
			cri.where().andEquals("owner_name", ownerName);
		}else{
			cri.where().andEquals("owner_name", scope).orEquals("status", "1");
		}
		if(StringUtils.isNotBlank(_group)){
			cri.where().and(Cnd.exp("_group", "=", _group));
		}
		if (StringUtils.isNoneBlank(createDate)) {
			cri.where().and(Cnd.exp("DATEDIFF(create_date,'" + createDate + "')", ">=", 0));
//			buf.append(SQLUtil.varchar("create_date", createDate));
		}
		if (StringUtils.isNoneBlank(createDate2)) {
			cri.where().and(Cnd.exp("DATEDIFF(create_date,'" + createDate2 + "')", "<=", 0));
//			buf.append(SQLUtil.varchar("create_date", createDate));
		}
		// TODO precision
		if (StringUtils.isNoneBlank(missionName)) {
//			buf.append(SQLUtil.varchar("mission_name", missionName));
		}
		if (null != status) {
			cri.where().andEquals("status", status);
		}
		cri.getOrderBy().desc("create_date");
//		buf.append(" order by  create_date desc ");
		return cri.toSql(null);//buf.toString();
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

	public String getCreateDate2() {
		return createDate2;
	}

	public void setCreateDate2(String createDate2) {
		this.createDate2 = createDate2;
	}

	public String get_group() {
		return _group;
	}

	public void set_group(String _group) {
		this._group = _group;
	}

	public String getScope() {
		return scope;
	}

	public void setScope(String scope) {
		this.scope = scope;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}
}
