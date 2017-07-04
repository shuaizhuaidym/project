package com.jit.project.daily.web;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.shiro.authz.annotation.RequiresUser;
import org.nutz.dao.QueryResult;
import org.nutz.ioc.annotation.InjectName;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.Ok;
import org.nutz.mvc.annotation.Param;

import com.jit.project.daily.bean.Daily;
import com.jit.project.daily.bean.DailyItem;
import com.jit.project.daily.bean.Query;
import com.jit.project.daily.service.IDailyItemService;
import com.jit.project.daily.service.IDailyService;
import com.jit.project.dictionary.service.DicService;
import com.jit.project.user.service.UserService;

@InjectName("dailyAction")
public class DailyAction {

	private IDailyService dailyService;

	private IDailyItemService dailyItemService;
	
	private DicService dicService;
	
	private UserService userService;

	private static String success = "操作成功";

	/**
	 * 写日报-模态窗口
	 * 
	 * @return
	 */
	@At("/daily/window")
	@Ok("jsp:views.daily.window")
	public String window() {
		String today = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
		return today;
	}

	/**
	 * 写日报-常规页面
	 * 
	 * @return
	 */
	@At("/daily/form")
	@Ok("jsp:views.daily.form")
	@RequiresUser
	public String form() {
		String today = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
		return today;
	}

	/**
	 * 保存日报
	 * 
	 * @return
	 */
	@At("/daily/save")
	@Ok("redirect:/daily/search")
	public String save(@Param("::daily.") Daily daily, HttpSession session) {
		daily.setCreateDate(Calendar.getInstance().getTime());
		daily.setOwnerName((String) session.getAttribute("me"));

		this.dailyService.saveWith(daily);
		return success;
	}

	/**
	 * 检索日报
	 * 
	 * @return
	 */
	@At("/daily/search")
	@Ok("jsp:views.daily.search")
	public QueryResult search(@Param("::query.") Query query, HttpServletRequest request) {
		if (query == null) {
			query = new Query();
		}
		Map<String, String> owners = this.userService.asDic();
		request.setAttribute("owners", owners);
		request.setAttribute("query", query);
		QueryResult result = this.dailyService.search(query);
		return result;
	}
	
	/**
	 * 查看条目
	 * @param itemID
	 * @return
	 */
	@At("/daily/item")
	@Ok("jsp:views.daily.item")
	public DailyItem item(@Param("item_id")String itemID){
		DailyItem item=this.dailyItemService.fetch(itemID);
		return item;
	}

	/**
	 * 查看详情（所有条目）
	 * @param dailyID
	 * @return
	 */
	@At("/daily/items")
	@Ok("jsp:views.daily.items")
	public Daily items(@Param("daily_id")String dailyID){
		
		Daily daily=this.dailyService.fetch(dailyID);		
		this.dailyService.fetchLinks(daily, "items");
		return daily;
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

	public DicService getDicService() {
		return dicService;
	}

	public void setDicService(DicService dicService) {
		this.dicService = dicService;
	}

	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}
}
