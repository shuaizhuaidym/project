package com.jit.project.web;

import java.util.ArrayList;

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

//TODO Excel export
@InjectName("prjAction")
public class PrjAction {
	@Inject("prjService")
	private PrjService prjService;

	private Project project;

	@At("/")
	@Ok("jsp:views.list")
	public void home(HttpServletRequest request) {
		QueryResult qResult = new QueryResult(new ArrayList<Project>(), new Pager());
		request.setAttribute("query", new Query());
		request.setAttribute("result", qResult);
	}

	@At("/form")
	@Ok("jsp:views.form")
	public void form() {
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
