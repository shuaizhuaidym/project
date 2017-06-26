package com.jit.project.web;

import org.nutz.dao.Dao;
import org.nutz.mvc.NutConfig;
import org.nutz.mvc.Setup;

import com.jit.project.auth.service.AuthorityService;
import com.jit.project.org.bean.Org;
import com.jit.project.project.bean.Project;
import com.jit.project.user.bean.User;

public class MvcSetup implements Setup {
	public void init(NutConfig config) {
		System.out.println("nutz MvcSetup start!!");
		Dao dao = config.getIoc().get(Dao.class, "dao");
		if (!dao.exists(Project.class)) {
			dao.create(Project.class, false);
		}
		if (!dao.exists(Org.class)) {
			dao.create(Org.class, false);
		}
		AuthorityService auth = config.getIoc().get(AuthorityService.class);
		auth.initFormPackage("com.jit.project");
		auth.checkBasicRoles(dao.fetch(User.class, "admin"));
	}

	public void destroy(NutConfig config) {
		System.out.println("nutz MvcSetup stop!!");
	}
}
