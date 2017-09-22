package com.jit.project.user.web;

import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.crypto.hash.Sha256Hash;
import org.nutz.dao.Cnd;
import org.nutz.dao.Dao;
import org.nutz.dao.QueryResult;
import org.nutz.dao.pager.Pager;
import org.nutz.integration.shiro.SimpleShiroToken;
import org.nutz.ioc.annotation.InjectName;
import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.lang.Strings;
import org.nutz.lang.util.NutMap;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.Attr;
import org.nutz.mvc.annotation.Fail;
import org.nutz.mvc.annotation.GET;
import org.nutz.mvc.annotation.Ok;
import org.nutz.mvc.annotation.POST;
import org.nutz.mvc.annotation.Param;

import com.jit.project.base.OperationResult;
import com.jit.project.dictionary.bean.Dictionary;
import com.jit.project.dictionary.service.IDicService;
import com.jit.project.org.bean.Org;
import com.jit.project.org.service.OrgServiceImple;
import com.jit.project.user.bean.User;
import com.jit.project.user.service.UserService;

@InjectName("userAction")
public class UserAction {
	Logger logger = LogManager.getLogger(UserAction.class);
	
	Dao dao;

	UserService userService;
	
	OrgServiceImple orgService;
	
	@Inject("dicService")
	private IDicService dicService;
	
	private String success = "SUCCESS";

	/**
	 * 跳转到登录页
	 * @return
	 */
	@GET
	@At("/user/login")
	@Ok("jsp:views.user.login")
	public OperationResult loginPage() {
		return new OperationResult(200, "");
	}

	/**
	 * 用户认证,用户名不能相同
	 * @param username
	 * @param password
	 * @param session
	 * @return
	 */
	@POST
	@At("/user/authenticate")
	@Ok("jsp:views.portal.portal")
	@Fail("jsp:views.user.login")
	public OperationResult authenticate(@Param("account") String username, @Param("password") String password,
			HttpSession session) {
		OperationResult map = new OperationResult();
		User user = userService.fetch(username);
		if (user == null) {
			throw new LockedAccountException("Account [" + username + "] 不存在.");
		} else {
			String _pass = new Sha256Hash(password, user.getSalt()).toHex();
			if (_pass.equalsIgnoreCase(user.getPassword())) {
				logger.info(user.getName() + " loged in successful!");
				session.setAttribute("me", user.getRealName());
				// 隐式依赖SimpleAuthorizingRealm
				SecurityUtils.getSubject().login(new SimpleShiroToken(user));
				return map.setStatus(200);
			} else {// 提示错误信息
				throw new LockedAccountException("Account [" + username + "] 密码错误.");
			}
		}
	}
	
	/**
	 * 新建用户
	 * @param session
	 */
	@At("/user/form")
	@Ok("jsp:views.user.form")
	public String form(@Param("orgID") Long orgID, HttpServletRequest request) {
		Org org = orgService.fetch(orgID);
		request.setAttribute("org", org);
		List<Dictionary> dicts = this.dicService.query(new com.jit.project.dictionary.bean.Query(1,255)).getList(Dictionary.class);
		request.setAttribute("dicts", dicts);
		//TODO org tree 4 select
		return success;
	}
	
	@At("/user/add")
	@Ok("redirect:/org/list")
	@Fail("http:500")
	@RequiresPermissions("user:add")
	public Object add(@Param("::user.") User user) { // 两个点号是按对象属性一一设置
		NutMap re = new NutMap();
		String msg = checkUser(user, true);
		if (msg != null) {
			return re.setv("ok", false).setv("msg", msg);
		}
		user = userService.add(user);
		return re.setv("ok", true).setv("data", user);
	}

	/**
	 * 注销会话
	 * @param session
	 */
	@At("/user/logout")
	@Ok(">>:/")
	// 跟其他方法不同,这个方法完成后就跳转首页了
	public void logout(HttpSession session) {
		session.invalidate();
	}

	@At("/user/update")
	@RequiresPermissions("user:update")
	public Object update(@Param("..") User user) {
		NutMap re = new NutMap();
		String msg = checkUser(user, false);
		if (msg != null) {
			return re.setv("ok", false).setv("msg", msg);
		}
		user.setName(null);// 不允许更新用户名
		user.setCreateTime(null);// 也不允许更新创建时间
		user.setUpdateTime(new Date(System.currentTimeMillis()));// 设置正确的更新时间
		dao.updateIgnoreNull(user);// 真正更新的其实只有password和salt
		return re.setv("ok", true);
	}

	@At("/user/update/password")
	public Object update(@Param("password") String password, @Attr("me") int me) {
		if (Strings.isBlank(password) || password.length() < 6)
			return new NutMap().setv("ok", false).setv("msg", "密码不符合要求");
		userService.updatePassword(me, password);
		return new NutMap().setv("ok", true);
	}

	@At("/user/delete")
	public Object delete(@Param("id") int id, @Attr("me") int me) {
		if (me == id) {
			return new NutMap().setv("ok", false).setv("msg", "不能删除当前用户!!");
		}
		dao.delete(User.class, id); // 再严谨一些的话,需要判断是否为>0
		return new NutMap().setv("ok", true);
	}

	@At("/user/query")
	public Object query(@Param("name") String name, @Param("..") Pager pager) {
		Cnd cnd = Strings.isBlank(name) ? null : Cnd.where("name", "like", "%"
				+ name + "%");
		QueryResult qr = new QueryResult();
		qr.setList(dao.query(User.class, cnd, pager));
		pager.setRecordCount(dao.count(User.class, cnd));
		qr.setPager(pager);
		return qr; // 默认分页是第1页,每页20条
	}

	@At("/user/list")
	@Ok("jsp:jsp.user.list")
	// 真实路径是 /WEB-INF/jsp/user/list.jsp
	public void index() {
	}

	protected String checkUser(User user, boolean create) {
		if (user == null) {
			return "空对象";
		}
		if (create) {
			if (Strings.isBlank(user.getName())
					|| Strings.isBlank(user.getPassword()))
				return "用户名/密码不能为空";
		} else {
			if (Strings.isBlank(user.getPassword()))
				return "密码不能为空";
		}
		String passwd = user.getPassword().trim();
		if (6 > passwd.length() || passwd.length() > 12) {
			return "密码长度错误";
		}
		user.setPassword(passwd);
		if (create) {
			int count = userService.count(Cnd.where("name", "=", user.getName()));
			if (count != 0) {
				return "用户名已经存在";
			}
		} else {
			if (user.getId() < 1) {
				return "用户Id非法";
			}
		}
		if (user.getName() != null)
			user.setName(user.getName().trim());
		return null;
	}

	public OrgServiceImple getOrgService() {
		return orgService;
	}

	public void setOrgService(OrgServiceImple orgService) {
		this.orgService = orgService;
	}

	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}
}
