package com.jit.project.product.web;

import org.nutz.dao.Condition;
import org.nutz.dao.QueryResult;
import org.nutz.dao.entity.Entity;
import org.nutz.ioc.annotation.InjectName;
import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.Ok;
import org.nutz.mvc.annotation.Param;

import com.jit.project.product.bean.Product;
import com.jit.project.product.bean.Query;
import com.jit.project.product.service.ProductService;

@InjectName("prdtAction")
public class ProductAction {

	@Inject("prdtService")
	ProductService prdtService;

	Integer pageNumber = 1;
	Integer pageSize = 10;

	/**
	 * 显示产品列表
	 * 
	 * @return
	 */
	@At("/product/list")
	@Ok("jsp:views.product.list")
	public QueryResult query(@Param("::query.") Query cnd) {
		if(cnd==null){
			cnd=new Query();
		}
		QueryResult products = this.prdtService.query(cnd);

		return products;
	}

	/**
	 * 新增产品
	 * 
	 * @return
	 */
	@At("/product/add")
	@Ok("jsp:views.product.form")
	public String add() {
		return "SUCCESS";
	}

	/**
	 * 保存产品
	 * 
	 * @return
	 */
	@At("/product/create")
	@Ok("redirect:/product/list")
	public String create(@Param("::product.") Product product) {
		this.prdtService.create(product);

		return "SUCCESS";
	}

	/**
	 * 编辑产品
	 * 
	 * @return
	 */
	@At("/product/edit")
	@Ok("jsp:views.product.edit")
	public Product edit(@Param("product_id") final String productID) {

		Product p = this.prdtService.fetch(new Condition() {
			@Override
			public String toSql(Entity<?> entity) {
				return "where product_id=" + productID;
			}
		});
		return p;
	}

	/**
	 * 更新产品
	 * 
	 * @return
	 */
	@At("/product/update")
	@Ok("redirect:/product/list")
	public String update() {
		return "SUCCESS";
	}

	public ProductService getPrdtService() {
		return prdtService;
	}

	public void setPrdtService(ProductService prdtService) {
		this.prdtService = prdtService;
	}

}
