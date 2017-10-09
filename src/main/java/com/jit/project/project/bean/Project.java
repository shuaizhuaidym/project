package com.jit.project.project.bean;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import util.Sequence;

import org.nutz.dao.entity.annotation.Column;
import org.nutz.dao.entity.annotation.EL;
import org.nutz.dao.entity.annotation.Id;
import org.nutz.dao.entity.annotation.Name;
import org.nutz.dao.entity.annotation.Prev;
import org.nutz.dao.entity.annotation.Table;

import com.jit.project.bean.BasePojo;
import com.jit.project.project.service.Translater;
/**
 * 项目问题
 * @author yanming_dai
 * @date 2016年4月16日
 */
@Table("t_project")
public class Project extends BasePojo{

	@Id(auto=false)
	@Prev(els=@EL("seq()"))
	@Column("prj_id")
	private Long prjID;
	//项目或单位名称
	@Name
	@Column("prj_name")
	private String prjName;
	//所属行业
	@Column("industry")
	private String industry;
	//项目类型:售前开发/售中/售后..
	@Column("project_type")
	private String prjType;
	//相关产品
	@Column("product_id")
	private int productID;
	@Column("product_name")
	private String productName;
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
	private Date finishDate = new Date(System.currentTimeMillis());
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


	public Long getPrjID() {
		return prjID;
	}

	public void setPrjID(Long prjID) {
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

	public String getShortDesc(){
		if(describtion==null||describtion.length()<64){
			return describtion;
		}
		return describtion.substring(0, 64)+"...";
	}
	
	public String getLocalSubmitDate() {
		SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd");
		return submitDate == null ? "" : ft.format(submitDate);
	}
	public String getLocalLastResponse(){
		SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd");
		return submitDate == null ? "" : ft.format(updateTime);
	}

	public String getLocalFinishDate() {
		SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd");
		return finishDate == null ? "" : ft.format(finishDate);
	}

	public String getOperatorIP() {
		return operatorIP;
	}

	public void setOperatorIP(String operatorIP) {
		this.operatorIP = operatorIP;
	}

	public final String getColor() {
		int passed = diff(Calendar.getInstance().getTime(), this.submitDate);
		String color;
		if ("已完成".equals(this.status)) {
			return "white";
		}
		switch (passed) {
		case 0:
		case 1:
		case 2:
			color = "white";
			break;
		case 3: {
			color = "yellow";
			break;
		}
		case 4: {
			color = "red";
			break;
		}
		default: {
			color = "red";
			break;
		}
		}
		return color;
	}

	public int diff(java.util.Date late, java.util.Date earler) {
		int pass = (int) (late.getTime() - earler.getTime()) / 1000 / 3600 / 24;
		return pass;
	}
	
	public String toSql(){
		StringBuilder template=new StringBuilder("INSERT INTO `project`.`t_project` (");
				template.append("`prj_id`,`prj_name`,`industry`,`project_type`,`product_id`,");
				template.append("`product_name`,`product_version`,`issue_type`,`describtion`,`submit_date`,");
				template.append("`status`,`engineer`,`engineer_tel`,`finish_date`,`labor_costs`,");
				template.append("`reporter`,`contact`,`process`,`improvement`,`comments`,");
				template.append("`create_time`,`update_time`,`version`,`operator_ip`)VALUES");
			
				Sequence seq=util.Sequence.getInstance();
				SimpleDateFormat fmt=new SimpleDateFormat("yyyy-MM-dd");
				template.append("(");
				
				Long lid=seq.nextId();
				Translater.idmaps.put(this.prjID, lid);
				
				template.append(lid).append(",");
				template.append("'").append(this.prjName).append("',");
				template.append("'").append(this.industry).append("',");
				template.append("'").append(this.prjType).append("',");
				template.append("'").append(this.productID).append("',");
				
				template.append("'").append(this.productName).append("',");
				template.append("'").append(this.prudectVersion).append("',");
				template.append("'").append(this.issueType).append("',");
				template.append("'").append(this.describtion).append("',");
				template.append("'").append(submitDate == null ? "NULL" : fmt.format(this.submitDate)).append("',");
				
				template.append("'").append(this.status).append("',");
				template.append("'").append(this.engineer).append("',");
				template.append("'").append(this.engineerTel).append("',");
				template.append("'").append(finishDate == null ? "NULL" : fmt.format(this.finishDate)).append("',");
				template.append("'").append(this.laborCosts).append("',");
				
				template.append("'").append(this.reporter).append("',");
				template.append("'").append(this.contact).append("',");
				template.append("'").append(this.process).append("',");
				template.append("'").append(this.improvement).append("',");
				template.append("'").append(this.comments).append("',");
				
				template.append("'").append(createTime == null ? "NULL" : fmt.format(this.createTime)).append("',");
				template.append("'").append(updateTime == null ? "NULL" : fmt.format(this.updateTime)).append("',");
				template.append("'").append(this.version).append("',");
				template.append("'").append(this.operatorIP).append("');");

				
		return template.toString();
	}

	public int getProductID() {
		return productID;
	}

	public void setProductID(int productID) {
		this.productID = productID;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getPrjType() {
		return prjType;
	}

	public void setPrjType(String prjType) {
		this.prjType = prjType;
	}
}
