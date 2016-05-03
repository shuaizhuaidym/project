package com.jit.project.web;

import org.nutz.ioc.annotation.InjectName;
import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.Ok;

import com.jit.project.service.PrjService;

/**
 * 报表
 * @author daiyma
 *
 */
@InjectName("reportAction")
public class ReportAction {
	
	@Inject("prjService")
	private PrjService prjService;
	
	@At("/data/analyse")
	@Ok("jsp:views.report.report")
	public String analyse(){
		//TODO
		return "REPORT";
	}

	protected PrjService getPrjService() {
		return prjService;
	}

	protected void setPrjService(PrjService prjService) {
		this.prjService = prjService;
	}

}
