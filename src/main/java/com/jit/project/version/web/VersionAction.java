package com.jit.project.version.web;

import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.Ok;

import com.jit.project.version.service.VersionService;


public class VersionAction {
	private VersionService versionService;
	
	@At("/product/version")
	@Ok("jsp:views.product.version")
	public String index(){
		return "SUCCESS";
	}

	public VersionService getVersionService() {
		return versionService;
	}

	public void setVersionService(VersionService versionService) {
		this.versionService = versionService;
	}

}
