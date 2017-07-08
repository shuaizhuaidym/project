package com.jit.project.auth.web;

import java.util.ArrayList;
import java.util.List;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.nutz.aop.interceptor.ioc.TransAop;
import org.nutz.ioc.aop.Aop;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.mvc.adaptor.JsonAdaptor;
import org.nutz.mvc.annotation.AdaptBy;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.Ok;
import org.nutz.mvc.annotation.POST;
import org.nutz.mvc.annotation.Param;

import com.jit.project.auth.bean.Permission;
import com.jit.project.auth.bean.Role;
import com.jit.project.base.web.BaseAction;
import com.jit.project.user.bean.User;

@At("/admin/authority")
@IocBean
@Ok("void")
// 避免误写导致敏感信息泄露到服务器外
public class AuthorityAction extends BaseAction {
	/**
	 * 更新用户所属角色/特许权限
	 */
	@POST
	@AdaptBy(type = JsonAdaptor.class)
	@RequiresPermissions("authority:user:update")
	@At("/user/update")
	@Aop(TransAop.READ_COMMITTED)
	public void updateUser(@Param("user") User user,
			@Param("roles") List<Long> roles,
			@Param("permissions") List<Long> permissions) {
		// 防御一下
		if (user == null)
			return;
		user = dao.fetch(User.class, user.getId());
		// 就在那么一瞬间,那个用户已经被其他用户删掉了呢
		if (user == null)
			return;
		if (roles != null) {
			List<Role> rs = new ArrayList<Role>(roles.size());
			for (long roleId : roles) {
				Role r = dao.fetch(Role.class, roleId);
				if (r != null) {
					rs.add(r);
				}
			}
			dao.fetchLinks(user, "roles");
			if (user.getRoles().size() > 0) {
				dao.clearLinks(user, "roles");
			}
			user.setRoles(rs);
			dao.insertRelation(user, "roles");
		}
		if (permissions != null) {
			List<Permission> ps = new ArrayList<Permission>();
			for (long permissionId : permissions) {
				Permission p = dao.fetch(Permission.class, permissionId);
				if (p != null)
					ps.add(p);
			}
			dao.fetchLinks(user, "permissions");
			if (user.getPermissions().size() > 0) {
				dao.clearLinks(user, "permissions");
			}
			user.setPermissions(ps);
			dao.insertRelation(user, "permissions");
		}
	}
}
