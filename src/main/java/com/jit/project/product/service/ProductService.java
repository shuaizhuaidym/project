package com.jit.project.product.service;

import java.util.List;

import org.nutz.dao.Cnd;
import org.nutz.dao.QueryResult;
import org.nutz.dao.pager.Pager;
import org.nutz.service.NameEntityService;

import com.jit.project.product.bean.Product;
import com.jit.project.product.bean.Query;

public class ProductService extends NameEntityService<Product> implements IProductService {

	public void create(Product p) {
		dao().insert(p);
	}

	public QueryResult query(Query vo) {

		Pager pager = this.dao().createPager(vo.getPageNumber(), vo.getPageSize());
		List<Product> list = dao().query(Product.class, vo, pager);
		pager.setRecordCount(dao().count(Product.class, vo));
		return new QueryResult(list, pager);
	}

	public List<Product> tree(String parentID, String type) {
		return this.dao().query(Product.class, Cnd.where("parent_id", "=", parentID));
	}

	@Override
	public String loadTreeJson(String parentID, String type) {
		// TODO Auto-generated method stub
		return null;
	}
}
