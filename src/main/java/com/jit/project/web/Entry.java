package com.jit.project.web;

import org.nutz.mvc.annotation.IocBy;
import org.nutz.mvc.annotation.Modules;
import org.nutz.mvc.annotation.SetupBy;
import org.nutz.mvc.ioc.provider.JsonIocProvider;

import com.jit.project.dictionary.web.DicAction;
import com.jit.project.mission.MissionAction;
import com.jit.project.org.web.OrgAction;
import com.jit.project.product.web.ProductAction;

@Modules({ PrjAction.class, DicAction.class, ChartAction.class, ProductAction.class, OrgAction.class,
		MissionAction.class })
@IocBy(type = JsonIocProvider.class, args = { "project.js" })
@SetupBy(MvcSetup.class)
public class Entry {

}
