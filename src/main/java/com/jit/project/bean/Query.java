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
	
	public Query(int pageSize) {
		super();
		this.pageSize = pageSize;
	}


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
			sqlBuilder.append(" and INSTR('").append(status).append("',status)>0");
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
		if(!StringUtils.isNullOrEmpty(reporter)){
			sqlBuilder.append(" and reporter like '%").append(reporter).append("%'");
		}
		if (submitDate1 != null && submitDate2 != null) {
			sqlBuilder.append(" and UNIX_TIMESTAMP(submit_date) between UNIX_TIMESTAMP('");
			sqlBuilder.append(format.format(submitDate1)).append("')").append(" and UNIX_TIMESTAMP('");
			sqlBuilder.append(format.format(submitDate2)).append("')");
		}else if(submitDate1 != null){
			sqlBuilder.append(" and UNIX_TIMESTAMP(submit_date) >= UNIX_TIMESTAMP('");
			sqlBuilder.append(format.format(submitDate1)).append("')");
		}else if(submitDate2 != null){
			sqlBuilder.append(" and UNIX_TIMESTAMP(submit_date) <= UNIX_TIMESTAMP('");
			sqlBuilder.append(format.format(submitDate2)).append("')");
		}
		if(lastRespDate1!=null&&lastRespDate2!=null){
			sqlBuilder.append(" and UNIX_TIMESTAMP(last_response) between UNIX_TIMESTAMP('");
			sqlBuilder.append(format.format(lastRespDate1)).append("')").append(" and UNIX_TIMESTAMP('");
			sqlBuilder.append(format.format(lastRespDate2)).append("')");
		}else if(lastRespDate1!=null){
			sqlBuilder.append(" and UNIX_TIMESTAMP(last_response) >= UNIX_TIMESTAMP('");
			sqlBuilder.append(format.format(lastRespDate1)).append("')");
		}else if(lastRespDate2!=null){
			sqlBuilder.append(" and UNIX_TIMESTAMP(last_response) <= UNIX_TIMESTAMP('");
			sqlBuilder.append(format.format(lastRespDate2)).append("')");
		}
		sqlBuilder.append(" order by last_response DESC,submit_date DESC");
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
}
