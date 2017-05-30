package com.jit.project.org.web;

import org.nutz.ioc.annotation.InjectName;
import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.Ok;

import com.jit.project.org.service.IOrgService;

@InjectName("orgAction")
public class OrgAction {
	@Inject("orgService")
	private IOrgService orgService;

	@At("/org")
	@Ok("jsp:views.org.org")
	public String index() {
		return "SUCCESS";
	}

	public IOrgService getOrgService() {
		return orgService;
	}

	public void setOrgService(IOrgService orgService) {
		this.orgService = orgService;
	}

}
