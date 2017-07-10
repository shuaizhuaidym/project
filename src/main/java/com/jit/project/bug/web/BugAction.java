package com.jit.project.bug.web;

import org.nutz.dao.QueryResult;
import org.nutz.ioc.annotation.InjectName;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.Ok;
import org.nutz.mvc.annotation.Param;

import com.jit.project.bug.bean.Query;
import com.jit.project.bug.service.BugServiceImpl;

@InjectName("bugAction")
public class BugAction {
	
	private BugServiceImpl bugService;

	@At("/bug/refer")
	@Ok("jsp:views.bug.refer-widget")
	public QueryResult refer(@Param("::query.") Query vo) {
		if (vo == null) {
			vo = new Query();
		}
		return this.bugService.query(vo);
	}
	
	public BugServiceImpl getBugService() {
		return bugService;
	}

	public void setBugService(BugServiceImpl bugService) {
		this.bugService = bugService;
	}
	
}
