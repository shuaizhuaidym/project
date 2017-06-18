package com.jit.project.product.service;

import org.nutz.dao.QueryResult;

import com.jit.project.product.bean.Product;
import com.jit.project.product.bean.Query;

public interface IProductService {
	/**
	 * 新增产品
	 * @param p
	 */
	public void create(Product p);
	/**
	 * 分页检索
	 * @param vo
	 * @return
	 */
	public QueryResult query(Query vo);

	/**
	 * 加载节点
	 * @param parentID
	 * @param type
	 * @return
	 */
	public String loadTreeJson(String parentID, String type);
}
