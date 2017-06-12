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

//TODO dictionary
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
	/**
	 * 首页
	 * @param request
	 */
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
	@Ok("redirect:/query")
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
		// query data
		QueryResult qResult = prjService.query(query);
		request.setAttribute("result", qResult);
		request.setAttribute("query", query);// 查询条件
		request.setAttribute("mpEngineer", mpEngineer);
		return qResult;
	}

	// 加载
	@At("/edit")
	@Ok("jsp:views.edit")
	public String getProject(HttpServletRequest request, @Param("prjid") String prjID) {
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
		//更新最后响应时间
		project.setLastResponse(new java.sql.Date(System.currentTimeMillis()));
		prjService.update(project);
		return "SUCCESS";
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
		if (mpEngineer.isEmpty()) {
			mpEngineer.put("", "");
			mpEngineer.put("索瑞军", "索瑞军");
			mpEngineer.put("代艳明", "代艳明");
			mpEngineer.put("刘志钢", "刘志钢");
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
			mpEngineer.put("王会彦", "王会彦");
			mpEngineer.put("邓佳佳", "邓佳佳");
			mpEngineer.put("都保星", "都保星");
			mpEngineer.put("闫晋忠", "闫晋忠");
			mpEngineer.put("曾宇波", "曾宇波");
			mpEngineer.put("吴畏", "吴畏");
			mpEngineer.put("张杰文", "张杰文");
			mpEngineer.put("丛哲", "丛哲");
			mpEngineer.put("李红义", "李红义");
			mpEngineer.put("杜俊杰", "杜俊杰");
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
