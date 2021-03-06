package com.jit.project.dictionary.bean;

import java.util.Date;

import org.nutz.dao.Condition;
import org.nutz.dao.entity.Entity;

import com.mysql.jdbc.StringUtils;

public class Query implements Condition {
	private static final long serialVersionUID = -3973815914642536113L;
	private int pageNumber = 1;
	private int pageSize = 10;

	private String dicName;
	private String industry;
	private String prudectVersion;
	private String dicType;
	private String describtion;
	private Date submitDate1;
	private Date submitDate2;
	private Date lastRespDate1;
	private Date lastRespDate2;
	
	private String status;
	private String engineer;
	private String reporter;
	
	public Query() {
		super();
	}
	
	public Query(int pageNumber, int pageSize) {
		super();
		this.pageNumber = pageNumber;
		this.pageSize = pageSize;
	}

	public Query(String dicType) {
		super();
		this.dicType = dicType;
	}

	public Query(int pageSize) {
		super();
		this.pageSize = pageSize;
	}


	// 过滤SQL关键字
	public String normalize(String sql) {
		return sql.replace("=", "\\=");
	}

	public String toSql(Entity<?> entity) {
		StringBuilder sqlBuilder = new StringBuilder();
		// TODO SQL injection
		sqlBuilder.append(" 1=1 ");
		if (!StringUtils.isNullOrEmpty(dicName)) {
			sqlBuilder.append(" and dic_name like '%").append(dicName).append("%'");
		}
		if (!StringUtils.isNullOrEmpty(industry)) {
			sqlBuilder.append(" and industry = '").append(industry).append("'");
		}
		if (!StringUtils.isNullOrEmpty(status)) {
			sqlBuilder.append(" and INSTR('").append(status).append("',status)>0");
		}
		if (!StringUtils.isNullOrEmpty(prudectVersion)) {
			sqlBuilder.append(" and prudect_version = '").append(prudectVersion).append("'");
		}
		if (!StringUtils.isNullOrEmpty(dicType)) {
			sqlBuilder.append(" and dic_type = '").append(dicType).append("'");
		}
		if (!StringUtils.isNullOrEmpty(describtion)) {
			sqlBuilder.append(" and describtion like '%").append(describtion).append("%'");
		}
		
		sqlBuilder.append(" order by display_number");
		return sqlBuilder.toString();
	}

	public int getPageNumber() {
		return pageNumber;
	}

	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	
	public String getIndustry() {
		return industry;
	}

	public void setIndustry(String industry) {
		this.industry = industry;
	}

	public String getPrudectVersion() {
		return prudectVersion;
	}

	public void setPrudectVersion(String prudectVersion) {
		this.prudectVersion = prudectVersion;
	}

	public String getDescribtion() {
		return describtion;
	}

	public void setDescribtion(String describtion) {
		this.describtion = describtion;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getEngineer() {
		return engineer;
	}

	public void setEngineer(String engineer) {
		this.engineer = engineer;
	}

	public String getReporter() {
		return reporter;
	}

	public void setReporter(String reporter) {
		this.reporter = reporter;
	}

	public Date getSubmitDate1() {
		return submitDate1;
	}

	public void setSubmitDate1(Date submitDate1) {
		this.submitDate1 = submitDate1;
	}

	public Date getSubmitDate2() {
		return submitDate2;
	}

	public void setSubmitDate2(Date submitDate2) {
		this.submitDate2 = submitDate2;
	}

	public Date getLastRespDate1() {
		return lastRespDate1;
	}

	public void setLastRespDate1(Date lastRespDate1) {
		this.lastRespDate1 = lastRespDate1;
	}

	public Date getLastRespDate2() {
		return lastRespDate2;
	}

	public void setLastRespDate2(Date lastRespDate2) {
		this.lastRespDate2 = lastRespDate2;
	}

	public String getDicName() {
		return dicName;
	}

	public void setDicName(String dicName) {
		this.dicName = dicName;
	}

	public String getDicType() {
		return dicType;
	}

	public void setDicType(String dicType) {
		this.dicType = dicType;
	}
}
