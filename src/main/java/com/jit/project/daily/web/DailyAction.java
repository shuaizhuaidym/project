package com.jit.project.daily.web;

import org.nutz.ioc.annotation.InjectName;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.Ok;

import com.jit.project.daily.service.IDailyItemService;
import com.jit.project.daily.service.IDailyService;

@InjectName("dailyAction")
public class DailyAction {
	
	private IDailyService dailyService;
	
	private IDailyItemService dailyItemService;

	@At("/daily/form")
	@Ok("jsp:views.daily.form")
	public String form(){
		
		return "SUCCESS";
	}

	public IDailyService getDailyService() {
		return dailyService;
	}

	public void setDailyService(IDailyService dailyService) {
		this.dailyService = dailyService;
	}

	public IDailyItemService getDailyItemService() {
		return dailyItemService;
	}

	public void setDailyItemService(IDailyItemService dailyItemService) {
		this.dailyItemService = dailyItemService;
	}
}
