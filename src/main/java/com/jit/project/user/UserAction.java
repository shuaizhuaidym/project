package com.jit.project.user;

import javax.servlet.http.HttpSession;

import org.nutz.lang.Strings;
import org.nutz.lang.util.NutMap;
import org.nutz.mvc.Scope;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.Attr;
import org.nutz.mvc.annotation.Filters;
import org.nutz.mvc.annotation.POST;
import org.nutz.mvc.annotation.Param;

import com.jit.project.auth.Toolkit;
import com.jit.project.auth.User;

public class UserAction {
	UserService userService;
	
	@At
	@Filters
	// 覆盖UserModule类的@Filter设置,因为登陆可不能要求是个已经登陆的Session
	@POST
	public Object login(@Param("username") String username, @Param("password") String password,
			@Param("captcha") String captcha,
			@Attr(scope = Scope.SESSION, value = "nutz_captcha") String _captcha, HttpSession session) {
		NutMap re = new NutMap();
		if (!Toolkit.checkCaptcha(_captcha, captcha)) {
			return re.setv("ok", false).setv("msg", "验证码错误");
		}
		int userId = userService.fetch(username, password);
		if (userId < 0) {
			return re.setv("ok", false).setv("msg", "用户名或密码错误");
		} else {
			session.setAttribute("me", userId);
			// 完成nutdao_realm后启用.
			// SecurityUtils.getSubject().login(new SimpleShiroToken(userId));
			return re.setv("ok", true);
		}
	}

	@At
	public Object add(@Param("..") User user) { // 两个点号是按对象属性一一设置
		NutMap re = new NutMap();
		String msg = checkUser(user, true);
		if (msg != null) {
			return re.setv("ok", false).setv("msg", msg);
		}
		user = userService.add(user.getName(), user.getPassword());
		return re.setv("ok", true).setv("data", user);
	}

	@At
	public Object update(@Param("password") String password, @Attr("me") int me) {
		if (Strings.isBlank(password) || password.length() < 6)
			return new NutMap().setv("ok", false).setv("msg", "密码不符合要求");
		userService.updatePassword(me, password);
		return new NutMap().setv("ok", true);
	}
}
