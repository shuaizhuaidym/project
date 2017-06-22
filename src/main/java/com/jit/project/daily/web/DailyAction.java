package com.jit.project.daily.web;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.nutz.ioc.annotation.InjectName;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.Ok;
import org.nutz.mvc.annotation.Param;

import com.jit.project.daily.bean.Daily;
import com.jit.project.daily.service.IDailyItemService;
import com.jit.project.daily.service.IDailyService;

@InjectName("dailyAction")
public class DailyAction {
	
	private IDailyService dailyService;
	
	private IDailyItemService dailyItemService;

	private static String success = "SUCCESS";
	/**
	 * 模态窗口
	 * @return
	 */
	@At("/daily/window")
	@Ok("jsp:views.daily.window")
	public String window(){
		String today = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
		return today;
	}
	
	/**
	 * 常规页面
	 * @return
	 */
	@At("/daily/form")
	@Ok("jsp:views.daily.form")
	public String form(){
		String today = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
		return today;
	}
	
	/**
	 * 保存日报
	 * @return
	 */
	@At("/daily/save")
	@Ok("jsp:views.daily.save")
	public String save(@Param("::daily.") Daily daily) {
		// TODO
		return success;
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
