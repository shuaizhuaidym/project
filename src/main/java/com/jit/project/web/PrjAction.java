package com.jit.project.web;

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

import com.jit.project.bean.Project;
import com.jit.project.bean.Query;
import com.jit.project.service.PrjService;

//TODO Excel export/dictionary
@InjectName("prjAction")
public class PrjAction {
	
	Map<String, String> mpIndustry = new LinkedHashMap<String, String>();
	Map<String, String> mpIssueType = new LinkedHashMap<String, String>();
	Map<String, String> mpStatus = new LinkedHashMap<String, String>();
	Map<String, String> mpEngineer = new LinkedHashMap<String, String>();
	
	@Inject("prjService")
	private PrjService prjService;

	private Project project;

	public PrjAction() {
		super();
		initIndustry();
	}

	@At("/")
	@Ok("jsp:views.list")
	public void home(HttpServletRequest request) {
		QueryResult qResult = new QueryResult(new ArrayList<Project>(), new Pager());
		request.setAttribute("query", new Query());
		request.setAttribute("result", qResult);
		request.setAttribute("mpEngineer", mpEngineer);
	}

	@At("/form")
	@Ok("jsp:views.form")
	public void form(HttpServletRequest request) {
		request.setAttribute("mpIndustry", mpIndustry);
		request.setAttribute("mpIssueType", mpIssueType);
		request.setAttribute("mpStatus", mpStatus);
		request.setAttribute("mpEngineer", mpEngineer);
	}

	/** 新建 */
	@At("/create")
	@Ok("redirect:/")
	public String createProject(@Param("::project.") Project project) {
		try {
			prjService.add(project);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "jsp:views/error";
	}

	/** 查询 */
	@At("/query")
	@Ok("jsp:views.list")
	public QueryResult queryProject(HttpServletRequest request, @Param("::query.") Query query) {
		if (query == null) {
			query = new Query();
		}
		QueryResult qResult = prjService.query(query);
		request.setAttribute("query", query);
		request.setAttribute("result", qResult);
		request.setAttribute("mpEngineer", mpEngineer);
		return qResult;
	}

	// 加载
	@At("/edit")
	@Ok("jsp:views.edit")
	public String getProject(HttpServletRequest request, @Param("prjid") String prjID) {
		System.out.println(prjID);
		long id = Long.valueOf(prjID);
		Project prj = prjService.fetch(id);
		request.setAttribute("prj", prj);
		request.setAttribute("mpIndustry", mpIndustry);
		request.setAttribute("mpIssueType", mpIssueType);
		request.setAttribute("mpStatus", mpStatus);
		request.setAttribute("mpEngineer", mpEngineer);
		
		return "EDIT";
	}

	/** 更新/修改 */
	@At("/update")
	@Ok("redirect:/query")
	public String updateProject(@Param("::project.") Project project) {
		// TODO
		prjService.update(project);
		return "SUCCESS";
	}

	// 导出Excel报表
	public String export() {
		// TODO
		return "Excel";
	}
	
	/**
	 * 初始化行业类型字典
	 */
	protected void initIndustry() {
		if (mpIndustry.isEmpty()) {
			mpIndustry.put("", "");
			mpIndustry.put("能源", "能源");
			mpIndustry.put("军工", "军工");
			mpIndustry.put("公安", "公安");
			mpIndustry.put("政府/综合", "政府/综合");
			mpIndustry.put("财政", "财政");
		}
		if (mpIssueType.isEmpty()) {
			mpIssueType.put("网关客户端", "网关客户端");
			mpIssueType.put("网关服务器", "网关服务器");
			mpIssueType.put("旁路报文", "旁路报文");
			mpIssueType.put("旁路Agent", "旁路Agent");
			mpIssueType.put("移动中间件", "移动中间件");
			mpIssueType.put("其他", "其他");
		}
		if (mpStatus.isEmpty()) {
			mpStatus.put("未开始", "未开始");
			mpStatus.put("进行中", "进行中");
			mpStatus.put("等待反馈", "等待反馈");
			mpStatus.put("暂停", "暂停");
			mpStatus.put("完成", "完成");
		}
		if (mpEngineer.isEmpty()) {
			mpEngineer.put("", "");
			mpEngineer.put("索瑞军", "索瑞军");
			mpEngineer.put("代艳明", "代艳明");
			mpEngineer.put("刘志刚", "刘志刚");
			mpEngineer.put("何金龙", "何金龙");
			mpEngineer.put("史志伟", "史志伟");
			mpEngineer.put("丁为厂", "丁为厂");
			mpEngineer.put("朱虹宇", "朱虹宇");
			mpEngineer.put("王毅", "王毅");
			mpEngineer.put("邢世宇", "邢世宇");
			mpEngineer.put("祝连海", "祝连海");
			mpEngineer.put("胡闯闯", "胡闯闯");
			mpEngineer.put("梁杰", "梁杰");
			mpEngineer.put("刘莎", "刘莎");
			mpEngineer.put("袁春旭", "袁春旭");
			mpEngineer.put("王建平", "王建平");
			mpEngineer.put("刘宗凯", "刘宗凯");
		}
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
}
