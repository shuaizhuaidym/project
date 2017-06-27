package com.jit.project.user.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	/**
	 * 人不多，不用树，直接作为字典下拉选
	 * @return
	 */
	public Map<String, String> asDic() {
		Map<String, String> users = new HashMap<String, String>();
		List<User> lou = this.query(null, null);
		for (User u : lou) {
			users.put(u.getName(), u.getName());
		}
		return users;
	}
}
