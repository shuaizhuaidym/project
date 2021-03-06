package com.jit.project.project.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.nutz.dao.QueryResult;
import org.nutz.dao.pager.Pager;
import org.nutz.ioc.annotation.InjectName;
import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.Ok;
import org.nutz.mvc.annotation.Param;

import com.jit.project.base.web.BaseAction;
import com.jit.project.bean.Query;
import com.jit.project.daily.bean.DailyItem;
import com.jit.project.daily.service.DailyItemServiceImpl;
import com.jit.project.dictionary.bean.Dictionary;
import com.jit.project.dictionary.service.IDicService;
import com.jit.project.mission.History;
import com.jit.project.product.service.ProductService;
import com.jit.project.project.bean.Project;
import com.jit.project.project.service.PrjService;
import com.jit.project.project.service.Translater;
import com.jit.project.user.service.UserService;

@InjectName("prjAction")
public class PrjAction extends BaseAction{
	
	@Inject("prjService")
	private PrjService prjService;
	@Inject("userService")
	private UserService userService;
	@Inject("dicService")
	private IDicService dicService;
	@Inject("prdtService")
	private ProductService prdtService;

	@Inject("dailyItemService")
	private DailyItemServiceImpl dailyItemService;
	
	private Project project;
	
	Map<String, String> users = new LinkedHashMap<String, String>();
	Map<String, String> products = new HashMap<String, String>();
	Map<String, String> modules = new HashMap<String, String>();
	
	public PrjAction() {
		super();
	}
	
	protected void prepareDic(HttpServletRequest request) {
		if (users.isEmpty()) {
			users = this.userService.asDic();
		}
		request.setAttribute("mpEngineer", users);
	}
	/**
	 * 首页
	 * @param request
	 */
	@At("/")
	@Ok("jsp:views.project.list")
	public void home(HttpServletRequest request) {
		QueryResult qResult = new QueryResult(new ArrayList<Project>(), new Pager());
		request.setAttribute("query", new Query());
		request.setAttribute("result", qResult);
		request.setAttribute("mpEngineer", users);
	}

	@At("/form")
	@Ok("jsp:views.project.form")
	public void form(HttpServletRequest request) {
		
		request.setAttribute("products", this.prdtService.asDic(true));
		request.setAttribute("modules", this.prdtService.asDic(false));
		prepareDic(request);
		List<Dictionary> dicts = this.dicService.query(new com.jit.project.dictionary.bean.Query(1,255)).getList(Dictionary.class);
		request.setAttribute("dicts", dicts);
	}

	/** 新建 */
	@At("/create")
	@Ok("redirect:/query")
	public String createProject(@Param("::project.") Project project) {
		try {
			project.setUpdateTime(new java.sql.Date(System.currentTimeMillis()));
			prjService.add(project);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "SUCCESS";
	}

	/** 查询 */
	@At("/query")
	@Ok("jsp:views.project.list")
	public QueryResult queryProject(HttpServletRequest request, @Param("::query.") Query query) {
		if (query == null) {
			query = new Query();
		}
		// query data
		QueryResult qResult = prjService.query(query);
		request.setAttribute("result", qResult);
		request.setAttribute("query", query);// 查询条件
		request.setAttribute("mpEngineer", users);
		return qResult;
	}

	/** 加载*/
	@At("/edit")
	@Ok("jsp:views.project.edit")
	public String edit(HttpServletRequest request, @Param("prjid") String prjID) {
		long id = Long.valueOf(prjID);
		Project prj = prjService.fetch(id);
		request.setAttribute("prj", prj);
		request.setAttribute("products", this.prdtService.asDic(true));
		request.setAttribute("module", this.prdtService.asDic(false));
		prepareDic(request);
		List<Dictionary> dicts = this.dicService.query(new com.jit.project.dictionary.bean.Query(1,255)).getList(Dictionary.class);
		request.setAttribute("dicts", dicts);
		
		return "EDIT";
	}

	/** 更新/修改 */
	@At("/update")
	@Ok("redirect:/query")
	public String updateProject(@Param("::project.") Project project) {
		//更新最后响应时间
		project.setUpdateTime(new java.sql.Date(System.currentTimeMillis()));
		prjService.update(project);
		return "SUCCESS";
	}
	
	/**
	 * 日报关联引用项目
	 * @param query,项目可以多人支持，我可以支持别人的项目
	 * @return
	 */
	@At("/project/refer")
	@Ok("jsp:views.project.refer-widget")
	public QueryResult refer(@Param("::query.") Query query,HttpServletRequest request) {
		if (query == null) {
			query = new Query();
		}
		request.setAttribute("query", query);
		return this.prjService.query(query);
	}
	
	/**
	 * 项目支持历史
	 * @param prjID
	 */
	@At("/project/history")
	@Ok("jsp:views.project.history")
	public List<History> history(@Param("prj_id") String prjID, HttpServletRequest request){
		Project prj=this.prjService.fetch(Long.valueOf(prjID));
		
		//TODO 任务和项目ID有重复，需要关联名称或者保证ID唯一
		List<History> history = this.dailyItemService.queryByMissionID(prjID);
		request.setAttribute("prj", prj);
		return history;
	}
	
	/**
	 * 数据迁移，主键变换
	 */
	@At("/translate")
	@Ok("json:full")
	public Integer translate() {
		List<Project> prjs = new ArrayList<Project>();
		List<DailyItem>itms=new ArrayList<DailyItem>();
		try {
			prjs = this.prjService.query();
			itms=this.dailyItemService.query();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		try {
			Translater.translate(prjs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		try {
			Translater.translateDailyItem(itms);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return prjs.size();
	}
	
	protected PrjService getPrjService() {
		return prjService;
	}

	protected void setPrjService(PrjService prjService) {
		this.prjService = prjService;
	}

	protected Project getProject() {
		return project;
	}

	protected void setProject(Project project) {
		this.project = project;
	}

	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public DailyItemServiceImpl getDailyItemService() {
		return dailyItemService;
	}

	public void setDailyItemService(DailyItemServiceImpl dailyItemService) {
		this.dailyItemService = dailyItemService;
	}
	
}
