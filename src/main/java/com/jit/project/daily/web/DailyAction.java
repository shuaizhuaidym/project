package com.jit.project.daily.web;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
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
import com.jit.project.daily.bean.VDailyItem;
import com.jit.project.daily.service.IDailyItemService;
import com.jit.project.daily.service.IDailyService;
import com.jit.project.dictionary.bean.Dictionary;
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
	public String form(HttpSession session) {
		String who = (String) session.getAttribute("me");
		List<Daily> staged = this.dailyService.getStagedDaily(who, 0);
		if (staged != null && !staged.isEmpty()) {//有暂存的日报，先处理暂存
			//TODO
		}
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
//		daily.setCreateDate(Calendar.getInstance().getTime());
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
		query.setScope((String)request.getSession().getAttribute("me"));
		Map<String, String> owners = this.userService.asDic();
		List<Dictionary> dicts = this.dicService.query(new com.jit.project.dictionary.bean.Query(1,255)).getList(Dictionary.class);
		request.setAttribute("dicts", dicts);
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
	public List<com.jit.project.daily.bean.VDailyItem> items(@Param("daily_id") String dailyID,
			HttpServletRequest request, HttpSession session) {
		// Daily daily=this.dailyService.fetch(dailyID);
		// this.dailyService.fetchLinks(daily, "items");
		List<VDailyItem> items = this.dailyService.queryDailyDetail(dailyID);
		request.setAttribute("report_date", items.get(0).getReport_date());
		request.setAttribute("reporter", items.get(0).getReporter());
		return items;
	}
	
	/**
	 * 编辑日报草稿
	 * @param id
	 * @return
	 */
	@At("/daily/edit")
	@Ok("jsp:views.daily.edit")
	public Daily edit(@Param("daily_id") String id) {
		Daily daily = dailyService.fetch(id);
		//获取并设置集合
		this.dailyService.fetchLinks(daily, "items");
		return daily;
	}
	
	/**
	 * 更新日报
	 * @param daily
	 */
	@At("/daily/update")
	@Ok("redirect:/daily/search")
	public void update(@Param("::daily.") Daily daily) {
		this.dailyService.upateWith(daily);
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
