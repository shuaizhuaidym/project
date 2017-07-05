package com.jit.project.product.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.nutz.dao.Cnd;
import org.nutz.dao.QueryResult;
import org.nutz.dao.pager.Pager;
import org.nutz.service.IdEntityService;

import com.jit.project.product.bean.Product;
import com.jit.project.product.bean.Query;

public class ProductService extends IdEntityService<Product> implements IProductService {

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

	/**
	 * 展现为下拉选字典
	 * @return
	 */
	public Map<String, String> asDic() {
		Map<String, String> products = new HashMap<String, String>();
		List<Product> lprd = this.query(null, null);
		for (Product p : lprd) {
			products.put(p.getProductName(), p.getProductName());
		}
		return products;
	}
	
	@Override
	public String loadTreeJson(String parentID, String type) {
		return null;
	}
}
