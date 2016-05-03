package com.jit.project.web;

import org.nutz.mvc.annotation.IocBy;
import org.nutz.mvc.annotation.Modules;
import org.nutz.mvc.annotation.SetupBy;
import org.nutz.mvc.ioc.provider.JsonIocProvider;

@Modules({ PrjAction.class, DicAction.class, ReportAction.class })
@IocBy(type = JsonIocProvider.class, args = { "project.js" })
@SetupBy(MvcSetup.class)
public class Entry {

}
