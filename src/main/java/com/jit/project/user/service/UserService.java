package com.jit.project.user.service;

import java.util.Date;

import org.apache.shiro.crypto.hash.Sha256Hash;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.lang.random.R;
import org.nutz.service.IdNameEntityService;

import com.jit.project.user.bean.User;

@IocBean(fields = "dao")
public class UserService extends IdNameEntityService<User> {

	public User add(String name, String password) {
		User user = new User();
		user.setName(name.trim());
		user.setSalt(R.UU16());
		user.setPassword(new Sha256Hash(password, user.getSalt()).toHex());
		user.setCreateTime(new Date());
		user.setUpdateTime(new Date());
		return dao().insert(user);
	}

	public void updatePassword(int userId, String password) {
		User user = fetch(userId);
		if (user == null) {
			return;
		}
		user.setSalt(R.UU16());
		user.setPassword(new Sha256Hash(password, user.getSalt()).toHex());
		user.setUpdateTime(new Date());
		dao().update(user, "^(password|salt|updateTime)$");
	}
}
