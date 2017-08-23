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
	 * @param top 是否是产品，如果是产品，统计parent_id=0（全部产品的子节点）
	 * @return
	 */
	public Map<String, String> asDic(boolean top) {
		Map<String, String> products = new HashMap<String, String>();
		List<Product> lprd;
		if(top){
			lprd = this.query(Cnd.where("parent_id", "=", 0), null);
		}else{
			lprd = this.query(Cnd.where("parent_id", "!=", 0).and("parent_id", "!=", -1), null);
		}
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
