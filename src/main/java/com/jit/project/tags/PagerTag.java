package com.jit.project.tags;

import java.io.Serializable;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

public class PagerTag extends TagSupport {
	private static final long serialVersionUID = 5859719548673083942L;

	private String url;
	private int pageNo = -1;
	private int pageSize = 3;
	private int totalCount = 0;
	private int totalPage = 0;
	private int prev = -1;
	private int next = -1;
	private boolean show = false;
	private int btnNum = 5;
	private String disableClass = "disabled";
	private String currentClass = "active";
	private String id = "pageFormId";
	private String name;
	private int cutBtnNum;
	private int rest;

	@Override
	public int doStartTag() throws JspException {
		if (pageSize <= 0) {
			throw new JspException("pageSize must be more than 0 !");
		}
		if (btnNum < 3) {
			throw new JspException("btnNum must be more than 3!");
		}
		if (totalCount > 0) {
			show = true;
			totalPage = totalCount / pageSize + ((totalCount % pageSize) == 0 ? 0 : 1);
			pageNo = Math.max(pageNo, 1);
			pageNo = Math.min(pageNo, totalPage);
			prev = pageNo > 1 ? pageNo - 1 : -1;
			next = pageNo < totalPage ? pageNo + 1 : -1;
			url = url != null ? url : ((HttpServletRequest) this.pageContext.getRequest()).getContextPath()+"/query";
			cutBtnNum = btnNum - 2;
			rest = cutBtnNum % 2;
		}
		return SKIP_BODY;
	}

	@Override
	public int doEndTag() throws JspException {
		if (show == false) {
			return super.doEndTag();
		}
		String html = createHtml();
		// 输出显示分页的代码
		try {
			// 输出分页创建的form
			pageContext.getOut().println(html);
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 表示按照正常的流程继续执行JSP网页
		return EVAL_PAGE;
	}

	private String createHtml() {
		StringBuffer html = new StringBuffer();
//		html.append("<form");
//		if (id != null) {
//			html.append(attr("id", id));
//		}
//		if (name != null) {
//			html.append(attr("name", name));
//		}
//		html.append(" method=\"post\"").append(attr("action", url)).append(">");

		html.append("<div class=\"pagination pagination-right\">");
		html.append("<ul>");
		
		// 首页
		if (pageNo > 1) {
			html.append("<li>" + wrapGoLink(1, "首页") + "</li>");
		} else {
			html.append("<li class=\"" + disableClass + "\"><a>首页</a></li>");
		}
		// 上一页按钮
		if (prev > 0) {
			html.append("<li>" + wrapGoLink(prev, "上一页") + "</li>");
		} else {
			html.append("<li class=\"" + disableClass + "\"><a>上一页</a></li>");
		}
		// 总页数小于最大按钮数
		if (totalPage <= cutBtnNum) {
			for (int i = 1; i <= totalPage; i++) {
				if (pageNo == i) {
					html.append("<li class=\"active\"><a>" + i + "</a></li>");
				} else {
					html.append("<li>" + wrapGoLink(i, i) + "</li>");
				}
			}
		} else {
			// 中间有省略
			// 第一页
			if (pageNo == 1) {
				html.append("<li class=\"active\"><a>1</a></li>");
			} else {
				html.append("<li>" + wrapGoLink(1, 1) + "</li>");
			}
			int harf = cutBtnNum / 2;
			// 中间
			if (pageNo > harf + cutBtnNum % 2 + 1) {
				html.append("<li><a>...</a></li>");
			}
			int start = pageNo - harf;
			int end = pageNo + harf;
			if (pageNo - harf < 2) {
				start = 2;
				end = start + cutBtnNum - rest;
			}
			if (pageNo + harf > totalPage - 1) {
				end = totalPage - 1;
				start = end - cutBtnNum + rest;
			}
			for (int i = start; i <= end; i++) {
				if (pageNo == i) {
					html.append("<li class=\"" + currentClass + "\"><a>" + i + "</a></li>");
				} else {
					html.append("<li>" + wrapGoLink(i, i) + "</li>");
				}
			}
			if (pageNo < totalPage - harf - cutBtnNum % 2) {
				html.append("<li><a>...</a></li>");
			}
			// 最后一页
			if (pageNo == totalPage) {
				html.append("<li class=\"" + currentClass + "\"><a>" + totalPage + "</a></li>");
			} else {
				html.append("<li>" + wrapGoLink(totalPage, totalPage) + "</li>");
			}
		}
		// 下一页按钮
		if (next > 0) {
			html.append("<li>" + wrapGoLink(next, "下一页") + "</li>");
		} else {
			html.append("<li class=\"" + disableClass + "\"><a>下一页</a></li>");
		}
		// 末页
		if (pageNo < totalPage) {
			html.append("<li>" + wrapGoLink(totalPage, "尾页") + "</li>");
		} else {
			html.append("<li class=\"" + disableClass + "\"><a>尾页</a></li>");
		}
		
		html.append("<span>共"+totalPage+"页，");
		html.append("到第</span>");
		html.append("<input type=\"mumber\" id=\"pageNoInput\" name=\"query.pageNumber\" value=\"" + pageNo + "\" class=\"input\"/>");
		html.append("</input><span>页</span><input type=\"button\" onclick=\"goPage()\" value=\"确定\" class=\"btn-jump\"></input>");
		html.append("</ul>");
		html.append("</div>");
		html.append("<input type=\"hidden\" name=\"pageSize\" value=\"" + pageSize + "\"></input>");
//		html.append("</form>");

		// 创建JavaScript代码
		html.append("\r\n<script type='text/javascript'>\n");
		html.append("function goPage(pageNo){\n");
		html.append("\tvar pageNoInput = document.getElementById(\"pageNoInput\");\n");
		html.append("\tif(pageNo == undefined){\n");
		html.append("\t\tpageNo = pageNoInput.value;\n");
		html.append("}\n");
		html.append("\tif(isNaN(pageNo)||pageNo<1){\n");
		html.append("\tpageNo = 1;\n");
		html.append("}\n");
		html.append("\tvar form = document.getElementById(\"queryForm\");\n");
		html.append("\tif(!form){alert('queryForm not found');return false;}\n");
//		html.append("form.action=\"").append(url).append("\";\n");
		html.append("$('#pageNoInput').val(pageNo);\n");
		html.append("\tform.submit();\n");
		html.append("}\n");
		html.append("</script>");
		return html.toString();
	}

	private String wrapGoLink(int pageNo, Serializable text) {
		return new StringBuilder().append(
				"<a href=\"javascript:void(0);\" onclick=\"goPage(" + pageNo + ")\">" + text + "</a>").toString();
	}

//	private String attr(String attrName, Object value) {
//		return new StringBuilder(" ").append(attrName).append("=\"").append(value).append("\"")
//				.toString();
//	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getBtnNum() {
		return btnNum;
	}

	public void setBtnNum(int btnNum) {
		this.btnNum = btnNum;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCurrentClass() {
		return currentClass;
	}

	public void setCurrentClass(String currentClass) {
		this.currentClass = currentClass;
	}

	public String getDisableClass() {
		return disableClass;
	}

	public void setDisableClass(String disableClass) {
		this.disableClass = disableClass;
	}

	public int getCutBtnNum() {
		return cutBtnNum;
	}

	public void setCutBtnNum(int cutBtnNum) {
		this.cutBtnNum = cutBtnNum;
	}

}
