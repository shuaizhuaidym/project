package com.jit.project.bean;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.nutz.dao.Condition;
import org.nutz.dao.entity.Entity;

import com.mysql.jdbc.StringUtils;

public class Query implements Condition {

	private int pageNumber = 1;
	private int pageSize = 10;

	private String prjName;
	private String industry;
	private String prudectVersion;
	private String issueType;
	private String describtion;
	private Date submitDate;
	private String status;
	private String engineer;

	// 过滤SQL关键字
	public String normalize(String sql) {
		return sql.replace("=", "\\=");
	}

	public String toSql(Entity<?> entity) {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		StringBuilder sqlBuilder = new StringBuilder();
		// TODO SQL injection
		sqlBuilder.append(" 1=1 ");
		if (!StringUtils.isNullOrEmpty(prjName)) {
			sqlBuilder.append(" and prj_name like '%").append(prjName).append("%'");
		}
		if (!StringUtils.isNullOrEmpty(industry)) {
			sqlBuilder.append(" and industry = '").append(industry).append("'");
		}
		if (!StringUtils.isNullOrEmpty(status)) {
			sqlBuilder.append(" and status = '").append(status).append("'");
		}
		if (!StringUtils.isNullOrEmpty(prudectVersion)) {
			sqlBuilder.append(" and prudect_version = '").append(prudectVersion).append("'");
		}
		if (!StringUtils.isNullOrEmpty(issueType)) {
			sqlBuilder.append(" and issue_type = '").append(issueType).append("'");
		}
		if (!StringUtils.isNullOrEmpty(describtion)) {
			sqlBuilder.append(" and describtion like '%").append(describtion).append("%'");
		}
		if (!StringUtils.isNullOrEmpty(engineer)) {
			sqlBuilder.append(" and engineer = '").append(engineer).append("'");
		}
		if (submitDate != null) {
			sqlBuilder.append(" and DATE_FORMAT(submit_date,'%Y-m-%d') = '").append(format.format(submitDate)).append("'");
		}
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

	public String getPrjName() {
		return prjName == null ? "" : prjName;
	}

	public void setPrjName(String prjName) {
		this.prjName = prjName;
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

	public String getIssueType() {
		return issueType;
	}

	public void setIssueType(String issueType) {
		this.issueType = issueType;
	}

	public String getDescribtion() {
		return describtion;
	}

	public void setDescribtion(String describtion) {
		this.describtion = describtion;
	}

	public Date getSubmitDate() {
		return submitDate;
	}

	public void setSubmitDate(Date submitDate) {
		this.submitDate = submitDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getEnginner() {
		return engineer;
	}

	public void setEngineer(String engineer) {
		this.engineer = engineer;
	}
}
