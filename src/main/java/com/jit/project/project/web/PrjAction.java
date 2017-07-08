package com.jit.project.project.web;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.nutz.dao.QueryResult;
import org.nutz.dao.pager.Pager;
import org.nutz.ioc.annotation.InjectName;
import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.Ok;
import org.nutz.mvc.annotation.Param;

import com.jit.project.bean.Query;
import com.jit.project.project.bean.Project;
import com.jit.project.project.service.PrjService;
import com.jit.project.user.service.UserService;

@InjectName("prjAction")
public class PrjAction {
	
	@Inject("prjService")
	private PrjService prjService;
	
	private UserService userService;

	private Project project;

	Map<String, String> mpIndustry = new LinkedHashMap<String, String>();
	Map<String, String> mpIssueType = new LinkedHashMap<String, String>();
	Map<String, String> mpStatus = new LinkedHashMap<String, String>();
	Map<String, String> users = new LinkedHashMap<String, String>();
	
	public PrjAction() {
		super();
		initIndustry();
	}
	
	private void prepareDic(HttpServletRequest request) {
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
		request.setAttribute("mpIndustry", mpIndustry);
		request.setAttribute("mpIssueType", mpIssueType);
		request.setAttribute("mpStatus", mpStatus);
		prepareDic(request);
	}

	/** 新建 */
	@At("/create")
	@Ok("redirect:/query")
	public String createProject(@Param("::project.") Project project) {
		try {
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

	// 加载
	@At("/edit")
	@Ok("jsp:views.project.edit")
	public String getProject(HttpServletRequest request, @Param("prjid") String prjID) {
		long id = Long.valueOf(prjID);
		Project prj = prjService.fetch(id);
		request.setAttribute("prj", prj);
		request.setAttribute("mpIndustry", mpIndustry);
		request.setAttribute("mpIssueType", mpIssueType);
		request.setAttribute("mpStatus", mpStatus);
		prepareDic(request);
		
		return "EDIT";
	}

	/** 更新/修改 */
	@At("/update")
	@Ok("redirect:/query")
	public String updateProject(@Param("::project.") Project project) {
		//更新最后响应时间
		project.setLastResponse(new java.sql.Date(System.currentTimeMillis()));
		prjService.update(project);
		return "SUCCESS";
	}
	
	/**
	 * 日报关联引用项目
	 * @param query
	 * @return
	 */
	@At("/project/refer")
	@Ok("jsp:views.project.refer-widget")
	public QueryResult refer(@Param("::query.") Query query) {
		if (query == null) {
			query = new Query();
		}
		return this.prjService.query(query);//TODO 当前用户的项目
	}

	/**
	 * 初始化行业类型字典
	 */
	protected void initIndustry() {
		if (mpIndustry.isEmpty()) {
			mpIndustry.put("", "");
			mpIndustry.put("军工", "军工");
			mpIndustry.put("公安", "公安");
			mpIndustry.put("财政", "财政");
			mpIndustry.put("政府/综合", "政府/综合");
			mpIndustry.put("能源", "能源");
			mpIndustry.put("东北政务", "东北政务");
			mpIndustry.put("金融/电信", "金融/电信");
		}
		if (mpIssueType.isEmpty()) {
			mpIssueType.put("", "");
			mpIssueType.put("网关_客户端", "网关_客户端");
			mpIssueType.put("网关_旁路_Agent", "网关_旁路_Agent");
			mpIssueType.put("网关_服务器", "网关_服务器");
			mpIssueType.put("网关_旁路_报文", "网关_旁路_报文");
			mpIssueType.put("网关_移动", "网关_移动");
			mpIssueType.put("磐石_客户端", "磐石_客户端");
			mpIssueType.put("网关_旁路_其它", "网关_旁路_其它");
			mpIssueType.put("磐石_服务器", "磐石_服务器");
			mpIssueType.put("网关_其他", "网关_其他");
		}
		if (mpStatus.isEmpty()) {
			mpStatus.put("未开始", "未开始");
			mpStatus.put("进行中", "进行中");
			mpStatus.put("等待反馈", "等待反馈");
			mpStatus.put("暂停", "暂停");
			mpStatus.put("已完成", "已完成");
		}
//		if (users.isEmpty()) {
//			users.put("", "");
//			users.put("索瑞军", "索瑞军");
//			users.put("代艳明", "代艳明");
//			users.put("刘志钢", "刘志钢");
//			users.put("何金龙", "何金龙");
//			users.put("史志伟", "史志伟");
//			users.put("丁为厂", "丁为厂");
//			users.put("朱虹宇", "朱虹宇");
//			users.put("王毅", "王毅");
//			users.put("邢世宇", "邢世宇");
//			users.put("祝连海", "祝连海");
//			users.put("胡闯闯", "胡闯闯");
//			users.put("梁杰", "梁杰");
//			users.put("刘莎", "刘莎");
//			users.put("袁春旭", "袁春旭");
//			users.put("王建平", "王建平");
//			users.put("刘宗凯", "刘宗凯");
//			users.put("王会彦", "王会彦");
//			users.put("邓佳佳", "邓佳佳");
//			users.put("都保星", "都保星");
//			users.put("闫晋忠", "闫晋忠");
//			users.put("曾宇波", "曾宇波");
//			users.put("吴畏", "吴畏");
//			users.put("张杰文", "张杰文");
//			users.put("丛哲", "丛哲");
//			users.put("李红义", "李红义");
//			users.put("杜俊杰", "杜俊杰");
//		}
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
}
