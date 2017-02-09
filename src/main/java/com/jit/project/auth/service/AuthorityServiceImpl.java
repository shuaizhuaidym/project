package com.jit.project.auth.service;

import java.util.List;

import org.nutz.dao.Chain;
import org.nutz.dao.Cnd;
import org.nutz.dao.entity.Record;

import com.jit.project.auth.Permission;
import com.jit.project.auth.Role;
import com.jit.project.auth.User;

public class AuthorityServiceImpl implements AuthorityService {

	public void initFormPackage(String pkg) {
		// TODO Auto-generated method stub

	}

	public void checkBasicRoles(User admin) {
		// 检查一下admin的权限
		Role adminRole = dao.fetch(Role.class, "admin");
		if (adminRole == null) {
			adminRole = addRole("admin");
		}
		// admin账号必须存在与admin组
		if (0 == dao.count("t_user_role",
				Cnd.where("u_id", "=", admin.getId()).and("role_id", "=", adminRole.getId()))) {
			dao.insert("t_user_role", Chain.make("u_id", admin.getId()).add("role_id", adminRole.getId()));
		}
		// admin组必须有authority:* 也就是权限管理相关的权限
		List<Record> res = dao.query("t_role_permission", Cnd.where("role_id", "=", adminRole.getId()));
		OUT: for (Permission permission : dao.query(Permission.class,
				Cnd.where("name", "like", "authority:%").or("name", "like", "user:%"), null)) {
			for (Record re : res) {
				if (re.getInt("permission_id") == permission.getId())
					continue OUT;
			}
			dao.insert("t_role_permission",
					Chain.make("role_id", adminRole.getId()).add("permission_id", permission.getId()));
		}
		;
	}

	public void addPermission(String permission) {
		// TODO Auto-generated method stub

	}

	public Role addRole(String role) {
		// TODO Auto-generated method stub
		return null;
	}

}
