package com.jit.project.bean;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.nutz.dao.entity.annotation.Column;
import org.nutz.dao.entity.annotation.Id;
import org.nutz.dao.entity.annotation.Name;
import org.nutz.dao.entity.annotation.Table;
/**
 * 项目问题
 * @author yanming_dai
 * @date 2016年4月16日
 */
@Table("t_project")
public class Project {

	@Id
	@Column("prj_id")
	private Integer prjID;
	//项目或单位名称
	@Name
	@Column("prj_name")
	private String prjName;
	//所属行业
	@Column("industry")
	private String industry;
	//产品版本
	@Column("product_version")
	private String prudectVersion;
	//问题类型
	@Column("issue_type")
	private String issueType;
	//详细描述
	@Column("describtion")
	private String describtion;
	//提交日期
	@Column("submit_date")
	private Date submitDate;
	//当前状态
	@Column("status")
	private String status;
	//负责人
	@Column("engineer")
	private String engineer;
	//负责人联系方式
	@Column("engineer_tel")
	private String engineerTel;
	//结束日期
	@Column("finish_date")
	private Date finishDate = new Date();
	//人力成本 人*周
	@Column("labor_costs")
	private float laborCosts;
	//报告人
	@Column("reporter")
	private String reporter;
	//联系方式
	@Column("contact")
	private String contact;
	//处理过程
	@Column("process")
	private String process;
	//改进措施
	@Column("improvement")
	private String improvement;
	//备注
	@Column("comments")
	private String comments;
	//最后响应日期
	@Column("last_response")
	private Date lastResponse=new Date();
	//操作人，记录当前操作者IP，然后根据对应关系可以找到人
	@Column("operator_ip")
	private String operatorIP;
	
	public Project() {
		super();
	}

	public Project(String prjName, String industry, String prudectVersion, String issueType, String describtion,
			Date submitDate, String status, String engineer, Date finishDate, float laborCosts, String reporter,
			String contact, String process) {
		super();
		this.prjName = prjName;
		this.industry = industry;
		this.prudectVersion = prudectVersion;
		this.issueType = issueType;
		this.describtion = describtion;
		this.submitDate = submitDate;
		this.status = status;
		this.engineer = engineer;
		this.finishDate = finishDate;
		this.laborCosts = laborCosts;
		this.reporter = reporter;
		this.contact = contact;
		this.process = process;
	}


	public Integer getPrjID() {
		return prjID;
	}

	public void setPrjID(Integer prjID) {
		this.prjID = prjID;
	}

	public String getPrjName() {
		return prjName;
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

	public String getEngineer() {
		return engineer;
	}

	public void setEngineer(String engineer) {
		this.engineer = engineer;
	}

	public Date getFinishDate() {
		return finishDate;
	}

	public void setFinishDate(Date finishDate) {
		this.finishDate = finishDate;
	}

	public float getLaborCosts() {
		return laborCosts;
	}

	public void setLaborCosts(float laborCosts) {
		this.laborCosts = laborCosts;
	}

	public String getReporter() {
		return reporter;
	}

	public void setReporter(String reporter) {
		this.reporter = reporter;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public String getProcess() {
		return process;
	}

	public void setProcess(String process) {
		this.process = process;
	}

	public String getImprovement() {
		return improvement;
	}

	public void setImprovement(String improvement) {
		this.improvement = improvement;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public String getEngineerTel() {
		return engineerTel;
	}

	public void setEngineerTel(String engineerTel) {
		this.engineerTel = engineerTel;
	}

	public Date getLastResponse() {
		return lastResponse;
	}

	public void setLastResponse(Date lastResponse) {
		this.lastResponse = lastResponse;
	}

	public String getShortDesc(){
		if(describtion==null||describtion.length()<32){
			return describtion;
		}
		return describtion.substring(0, 32)+"...";
	}
	
	public String getLocalSubmitDate(){
		SimpleDateFormat ft=new SimpleDateFormat("yyyy-MM-dd");
		return ft.format(submitDate);
	}

	protected String getOperatorIP() {
		return operatorIP;
	}

	protected void setOperatorIP(String operatorIP) {
		this.operatorIP = operatorIP;
	}
}
