package com.jit.project.web;

import org.nutz.mvc.annotation.IocBy;
import org.nutz.mvc.annotation.Modules;
import org.nutz.mvc.annotation.SetupBy;
import org.nutz.mvc.ioc.provider.JsonIocProvider;

import com.jit.project.dictionary.web.DicAction;

@Modules({ PrjAction.class, DicAction.class, ChartAction.class })
@IocBy(type = JsonIocProvider.class, args = { "project.js" })
@SetupBy(MvcSetup.class)
public class Entry {

}
