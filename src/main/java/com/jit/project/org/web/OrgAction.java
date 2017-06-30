package com.jit.project.org.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.nutz.dao.Cnd;
import org.nutz.dao.QueryResult;
import org.nutz.ioc.annotation.InjectName;
import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.Ok;
import org.nutz.mvc.annotation.Param;

import com.jit.project.org.bean.Org;
import com.jit.project.org.bean.Query;
import com.jit.project.org.service.OrgServiceImple;
import com.jit.project.user.service.UserService;

@InjectName("orgAction")
public class OrgAction {
	@Inject("orgService")
	private OrgServiceImple orgService;
	
	@Inject("userService")
	private UserService userService;

	/**
	 * 显示列表
	 * 
	 * @return
	 */
	@At("/org/list")
	@Ok("jsp:views.org.org")
	public QueryResult index(@Param("::query.") com.jit.project.org.bean.Query query,
			HttpServletRequest request) {
		if (query == null) {
			query = new Query();
		}
		request.setAttribute("query", query);
		QueryResult result = this.userService.search(query);
		return result;
	}

	/**
	 * 新增机构
	 * 
	 * @return
	 */
	@At("/org/form")
	@Ok("jsp:views.org.form")
	public String form() {
		return "SUCCESS";
	}

	/**
	 * 保存机构
	 * 
	 * @return
	 */
	@At("/org/save")
	@Ok("jsp:views.org.list")
	public String save() {
		return "SUCCESS";
	}

	/**
	 * 加载机构数
	 * 
	 * @return
	 */
	@At("/org/tree")
	@Ok("json:full")
	public Object tree(@Param("parent_id") String parentID) {
		if (StringUtils.isEmpty(parentID)) {
			parentID = "-1";
		}
		Cnd cnd = Cnd.where("parent_id", "=", parentID);
		List<Org> nodes = this.orgService.query(cnd, null);
		return nodes;
	}

	/**
	 * 显示用户列表
	 * @param query
	 * @param request
	 * @return
	 */
	public QueryResult queryUser(@Param("::query.") com.jit.project.org.bean.Query query,
			HttpServletRequest request) {
		if (query == null) {
			query = new Query();
		}
		request.setAttribute("query", query);
		QueryResult result = this.userService.search(query);
		return result;
	}
	
	public OrgServiceImple getOrgService() {
		return orgService;
	}

	public void setOrgService(OrgServiceImple orgService) {
		this.orgService = orgService;
	}

	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}
}
