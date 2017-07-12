package com.jit.project.web;

import org.nutz.dao.Dao;
import org.nutz.mvc.NutConfig;
import org.nutz.mvc.Setup;

import task.QcTask;

import com.jit.project.auth.service.AuthorityService;
import com.jit.project.org.bean.Org;
import com.jit.project.project.bean.Project;
import com.jit.project.user.bean.User;
import com.jit.project.user.bean.UserProfile;

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
		if(!dao.exists(UserProfile.class)){
			dao.create(UserProfile.class, false);
		}
		AuthorityService auth = config.getIoc().get(AuthorityService.class);
		auth.initFormPackage("com.jit.project");
		auth.checkBasicRoles(dao.fetch(User.class, "admin"));
		//启动QC同步定时任务
		new QcTask().executeFixedRate();
	}

	public void destroy(NutConfig config) {
		System.out.println("nutz MvcSetup stop!!");
	}
}
