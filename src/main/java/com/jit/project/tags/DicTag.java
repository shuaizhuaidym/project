package com.jit.project.tags;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

import com.jit.project.dictionary.bean.Dictionary;

public class DicTag extends TagSupport {
	private static final long serialVersionUID = -2198089900339214625L;

	private String id;

	private String name;
	// 总字典集合
	private List<Dictionary> items = new ArrayList<Dictionary>();
	// 是否生成一个空选项，默认有一个空选项
	private boolean withBlank = true;

	private String path;

	private String css;

	private String style;
	// 字典类型
	private String type;

	private String multiple;

	@Override
	public int doStartTag() throws JspException {
		return super.doStartTag();
	}

	@Override
	public int doEndTag() throws JspException {
		try {
			pageContext.getOut().println(createOptions());
		} catch (IOException e) {
			e.printStackTrace();
		}
		return super.doEndTag();
	}

	private String createOptions() {
		StringBuilder builder = new StringBuilder("<select name=\"").append(name).append("\"");
		if (id != null) {
			builder.append(" id=\"").append(id).append("\"");
		}
		if (multiple != null) {
			builder.append(" multiple=\"multiple\" size=\"1\"");
		}
		if (css != null) {
			builder.append(" class=\"").append(css).append("\"");
		}
		if (style != null) {
			builder.append(" style=\"").append(style).append("\"");
		}
		builder.append(">");
		if (items != null) {
			for (Dictionary nt : items) {
				System.out.println(nt.getDicType()+":"+nt.getDicName()+"---"+path);
				if (nt != null && type.equalsIgnoreCase(nt.getDicType())) {
					if (nt.getDicName().equalsIgnoreCase(path)) {
						builder.append("<option value=\"").append(nt.getDicName()).append("\"");
						builder.append("selected=\"selected\">").append(nt.getDicName()).append("</option>");
					} else {
						builder.append("<option value=\"").append(nt.getDicName()).append("\">")
								.append(nt.getDicName()).append("</option>");
					}
				}
			}
		}
		builder.append("</select>");
		return builder.toString();
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public String getCss() {
		return css;
	}

	public void setCss(String css) {
		this.css = css;
	}

	public String getStyle() {
		return style;
	}

	public void setStyle(String style) {
		this.style = style;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getMultiple() {
		return multiple;
	}

	public void setMultiple(String multiple) {
		this.multiple = multiple;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public boolean isWithBlank() {
		return withBlank;
	}

	public void setWithBlank(boolean withBlank) {
		this.withBlank = withBlank;
	}

	public List<Dictionary> getItems() {
		return items;
	}

	public void setItems(List<Dictionary> items) {
		this.items = items;
	}
}
