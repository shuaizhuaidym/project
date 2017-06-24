package com.jit.project.portal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.shiro.authz.annotation.RequiresUser;
import org.nutz.dao.QueryResult;
import org.nutz.ioc.annotation.InjectName;
import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.Ok;
import org.nutz.mvc.annotation.Param;

import com.jit.project.bug.service.BugServiceImpl;
import com.jit.project.mission.MissionServiceImpl;
import com.jit.project.mission.Query;

@InjectName("portalAction")
public class PortalAction {

	private String success = "SUCCESS";
	// 任务
	@Inject("missionService")
	MissionServiceImpl missionService;

	// bug
	@Inject("bugService")
	BugServiceImpl bugService;

	/**
	 * 我的首页
	 * 
	 * @return
	 */
	@At("/portal")
	@Ok("jsp:views.portal.portal")
	@RequiresUser
	public String portal() {
		return success;
	}

	/**
	 * BUG
	 * 
	 * @return
	 */
	@At("/portal/bug")
	@Ok("jsp:views.portal.bugWidget")
	public QueryResult bug(@Param("::query.") com.jit.project.bug.bean.Query vo, HttpServletRequest request,
			HttpSession session) {
		if (vo == null) {
			vo = new com.jit.project.bug.bean.Query();
		}
		String userName = (String) session.getAttribute("me");
		vo.setResponsible(userName);
		request.setAttribute("query", vo);
		QueryResult bugs = this.bugService.query(vo);
		return bugs;
	}

	/**
	 * 待办任务
	 * 
	 * @return
	 */
	@At("/portal/mission")
	@Ok("jsp:views.portal.missionWidget")
	public QueryResult mission(@Param("::query.") Query vo, HttpServletRequest request, HttpSession session) {
		if (vo == null) {
			vo = new Query();
		}
		String userName = (String) session.getAttribute("me");
		vo.setAssignTo(userName);
		request.setAttribute("query", vo);
		QueryResult missions = this.missionService.query(vo);
		return missions;
	}

	/**
	 * 任务列表和bug列表需要分开加载，异步处理
	 * 
	 * @return
	 */
	@At("/demo")
	@Ok("raw:json")
	public String demo(@Param("::query.") Query cnd) {
		String json = "[ {} ]";
		return json;
	}

	public MissionServiceImpl getMissionService() {
		return missionService;
	}

	public void setMissionService(MissionServiceImpl missionService) {
		this.missionService = missionService;
	}

	public BugServiceImpl getBugService() {
		return bugService;
	}

	public void setBugService(BugServiceImpl bugService) {
		this.bugService = bugService;
	}
}
