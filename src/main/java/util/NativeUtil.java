package util;

import java.io.Serializable;

/**
 * utility implement by Native Library
 * 
 * @author daiyma
 */
public class NativeUtil {
	static {
		System.out.print(System.getProperty("java.library.path"));
		System.loadLibrary("NativeUtil");
		System.out.println(" load ok");
	}

	public static void main(String[] args) {
		hello();
		String html = NativeUtil.buildPaginationHtml();
		System.out.println(html);
		System.exit(0);
	}
	/**
	 * test
	 */
	public static native void hello();
	/**
	 * 生成分页标签
	 * 
	 * @return
	 */
	public native static String buildPaginationHtml();

	/**
	 * 生成分页标签
	 * 
	 * @return
	 */
	public native static String buildPaginationHtml(int pageNo, int pageSize, int totalCount, int totalPage, int prev,
			int next, int cutBtnNum, int rest, String currentClass, String disableClass);

	/**
	 * 原生方法
	 * 
	 * @param pageNo
	 * @param text
	 * @return
	 */
	private String wrapGoLink(int pageNo, Serializable text) {
		StringBuilder builder = new StringBuilder().append("<a href=\"javascript:void(0);\" onclick=\"goPage(");
		builder.append(pageNo).append(")\">");
		builder.append(text).append("</a>");
		return builder.toString();
	}

	/**
	 * 原生方法
	 * 
	 * @param pageNo
	 * @return
	 */
	private String build(int pageNo, int pageSize, int totalCount, int totalPage, int prev, int next, int cutBtnNum,
			int rest, String currentClass, String disableClass) {

		StringBuffer html = new StringBuffer();
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

		html.append("<input type=\"button\" onclick=\"goPage()\" value=\"跳转\"></input>到第");
		html.append("<input type=\"text\" id=\"pageNoInput\" name=\"query.pageNumber\" value=\"" + pageNo
				+ "\" style=\"width:20px\"/></input>页|");
		html.append("</ul>");
		html.append("共" + totalCount + "条记录|每页" + pageSize + "条|当前" + pageNo + "/" + totalPage + "页");
		html.append("</div>");
		html.append("<input type=\"hidden\" name=\"pageSize\" value=\"" + pageSize + "\"></input>");
		// html.append("</form>");

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
		html.append("$('#pageNoInput').val(pageNo);\n");
		html.append("\tform.submit();\n");
		html.append("}\n");
		html.append("</script>");
		return html.toString();

	}
}
