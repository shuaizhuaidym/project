package com.jit.project.report.bean;

/**
 * 报表条目实体
 * 
 * @author yanming_dai
 * @date 2017年8月16日
 */
public class Report {
	String mission;
	String industry;
	String type;
	String manager;
	String state;
	String product;
	
	String module;
	String baseVersion;
	String publishVersion;
	String 	function;
	String engineer;
	String planStartDate;
	
	String startDate;
	String planEndDate;
	String endDate;
	//人力投入
	String arrangedInvestment;
	String investment;
	String content;
	//进展/处理过程
	String process;
	
	public Report() {
		super();
	}

	
	public Report(String mission, String industry, String type, String manager, String content,
			String engineer, String state, String startDate, String endDate, String investment) {
		super();
		this.mission = mission;
		this.industry = industry;
		this.type = type;
		this.manager = manager;
		this.state = state;
		this.engineer = engineer;
		this.startDate = startDate;
		this.endDate = endDate;
		this.investment = investment;
		this.content = content;
	}


	public Report(String mission, String industry, String type, String manager, String state,
			String product, String module, String baseVersion, String publishVersion, String function,
			String engineer, String planStartDate, String startDate, String planEndDate, String endDate,
			String arrangedInvestment, String investment, String process,String content) {
		super();
		this.mission = mission;
		this.industry = industry;
		this.type = type;
		this.manager = manager;
		this.state = state;
		this.product = product;
		this.module = module;
		this.baseVersion = baseVersion;
		this.publishVersion = publishVersion;
		this.function = function;
		this.engineer = engineer;
		this.planStartDate = planStartDate;
		this.startDate = startDate;
		this.planEndDate = planEndDate;
		this.endDate = endDate;
		this.arrangedInvestment = arrangedInvestment;
		this.investment = investment;
		this.process = process;
		this.content = content;
	}

	public String getMission() {
		return mission;
	}

	public void setMission(String mission) {
		this.mission = mission;
	}

	public String getIndustry() {
		return industry;
	}

	public void setIndustry(String industry) {
		this.industry = industry;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getManager() {
		return manager;
	}

	public void setManager(String manager) {
		this.manager = manager;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getProduct() {
		return product;
	}

	public void setProduct(String product) {
		this.product = product;
	}

	public String getModule() {
		return module;
	}

	public void setModule(String module) {
		this.module = module;
	}

	public String getBaseVersion() {
		return baseVersion;
	}

	public void setBaseVersion(String baseVersion) {
		this.baseVersion = baseVersion;
	}

	public String getPublishVersion() {
		return publishVersion;
	}

	public void setPublishVersion(String publishVersion) {
		this.publishVersion = publishVersion;
	}

	public String getFunction() {
		return function;
	}

	public void setFunction(String function) {
		this.function = function;
	}

	public String getEngineer() {
		return engineer;
	}

	public void setEngineer(String engineer) {
		this.engineer = engineer;
	}

	public String getPlanStartDate() {
		return planStartDate;
	}

	public void setPlanStartDate(String planStartDate) {
		this.planStartDate = planStartDate;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getPlanEndDate() {
		return planEndDate;
	}

	public void setPlanEndDate(String planEndDate) {
		this.planEndDate = planEndDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public String getArrangedInvestment() {
		return arrangedInvestment;
	}

	public void setArrangedInvestment(String arrangedInvestment) {
		this.arrangedInvestment = arrangedInvestment;
	}

	public String getInvestment() {
		return investment;
	}

	public void setInvestment(String investment) {
		this.investment = investment;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getProcess() {
		return process;
	}

	public void setProcess(String process) {
		this.process = process;
	}
	
}
