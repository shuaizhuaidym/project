package com.jit.project.user.service;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.crypto.hash.Sha256Hash;
import org.nutz.dao.QueryResult;
import org.nutz.dao.pager.Pager;
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
		user.setCreateTime(new Date(System.currentTimeMillis()));
		user.setUpdateTime(new Date(System.currentTimeMillis()));
		return dao().insert(user);
	}

	public User add(User user) {
		if (StringUtils.isEmpty(user.getPassword())) {
			user.setPassword("123456");
		}
		user.setSalt(R.UU16());
		user.setPassword(new Sha256Hash(user.getPassword(), user.getSalt()).toHex());
		user.setCreateTime(new Date(System.currentTimeMillis()));
		user.setUpdateTime(new Date(System.currentTimeMillis()));
		return dao().insert(user);
	}

	public void updatePassword(int userId, String password) {
		User user = fetch(userId);
		if (user == null) {
			return;
		}
		user.setSalt(R.UU16());
		user.setPassword(new Sha256Hash(password, user.getSalt()).toHex());
		user.setUpdateTime(new Date(System.currentTimeMillis()));
		dao().update(user, "^(password|salt|updateTime)$");
	}

	/**
	 * 人不多，不用树，直接作为字典下拉选
	 * 
	 * @return
	 */
	public Map<String, String> asDic() {
		Map<String, String> users = new HashMap<String, String>();
		users.put("", "");
		List<User> lou = this.query(null, null);
		for (User u : lou) {
			users.put(u.getRealName(), u.getRealName());
		}
		return users;
	}

	/**
	 * 查询用户
	 * 
	 * @param vo
	 * @return
	 */
	public QueryResult search(com.jit.project.org.bean.Query vo) {
		Pager pager = this.dao().createPager(vo.getPageNumber(), vo.getPageSize());
		pager.setRecordCount(this.dao().count(User.class, vo));
		List<User> list = dao().query(User.class, vo, pager);
		return new QueryResult(list, pager);
	}

}
