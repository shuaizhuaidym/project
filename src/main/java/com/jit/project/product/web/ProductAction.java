package com.jit.project.product.web;

import org.nutz.ioc.annotation.InjectName;
import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.Ok;

import com.jit.project.product.service.ProductService;

@InjectName("prdtAction")
public class ProductAction {

	@Inject("prdtService")
	ProductService prdtService;

	@At("/product")
	@Ok("jsp:views.product.list")
	public String index() {
		return "SUCCESS";
	}

	public ProductService getPrdtService() {
		return prdtService;
	}

	public void setPrdtService(ProductService prdtService) {
		this.prdtService = prdtService;
	}

}
