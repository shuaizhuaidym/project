package com.jit.project.org.web;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.nutz.dao.Cnd;
import org.nutz.ioc.annotation.InjectName;
import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.Ok;
import org.nutz.mvc.annotation.Param;

import com.jit.project.org.bean.Org;
import com.jit.project.org.service.OrgServiceImple;

@InjectName("orgAction")
public class OrgAction {
	@Inject("orgService")
	private OrgServiceImple orgService;

	/**
	 * 显示列表
	 * 
	 * @return
	 */
	@At("/org/list")
	@Ok("jsp:views.org.org")
	public String index() {
		return "SUCCESS";
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

	public OrgServiceImple getOrgService() {
		return orgService;
	}

	public void setOrgService(OrgServiceImple orgService) {
		this.orgService = orgService;
	}
}
