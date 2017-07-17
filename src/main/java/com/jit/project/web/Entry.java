package com.jit.project.web;

import org.nutz.integration.shiro.ShiroSessionProvider;
import org.nutz.mvc.annotation.IocBy;
import org.nutz.mvc.annotation.Modules;
import org.nutz.mvc.annotation.SessionBy;
import org.nutz.mvc.annotation.SetupBy;
import org.nutz.mvc.ioc.provider.JsonIocProvider;

import com.jit.project.bug.web.BugAction;
import com.jit.project.daily.web.DailyAction;
import com.jit.project.dictionary.web.DicAction;
import com.jit.project.mission.MissionAction;
import com.jit.project.org.web.OrgAction;
import com.jit.project.portal.PortalAction;
import com.jit.project.product.web.ProductAction;
import com.jit.project.project.web.PrjAction;
import com.jit.project.user.web.UserAction;
import com.jit.project.version.web.VersionAction;

@Modules({ PrjAction.class, 
	DicAction.class, 
	ChartAction.class, 
	ProductAction.class, 
	OrgAction.class,
	MissionAction.class, 
	DailyAction.class, 
	PortalAction.class, 
	UserAction.class, 
	BugAction.class, 
	VersionAction.class})
@IocBy(type = JsonIocProvider.class, args = { "project.js" })
@SetupBy(MvcSetup.class)
@SessionBy(ShiroSessionProvider.class)
public class Entry {

}
