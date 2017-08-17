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
	//进展/处理过程
	String process;
	
	public Report() {
		super();
	}

	public Report(String mission, String industry, String type, String manager, String state,
			String product, String module, String baseVersion, String publishVersion, String function,
			String engineer, String planStartDate, String startDate, String planEndDate, String endDate,
			String arrangedInvestment, String investment, String process) {
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
	}
	
}
