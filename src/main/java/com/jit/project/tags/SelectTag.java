package com.jit.project.tags;

import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

public class SelectTag extends TagSupport {

	private static final long serialVersionUID = -1441103689447651975L;
	
	private String id;

	private String name;

	private Map<String, String> items = new LinkedHashMap<String, String>();

	private String path;
	
	private String css;
	
	private String style;
	
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
	
	private String createOptions(){
		StringBuilder builder=new StringBuilder("<select name=\"").append(name).append("\"");
		if(id!=null){
			builder.append(" id=\"").append(id).append("\"");
		}
		if(multiple!=null){
			builder.append(" multiple=\"multiple\" size=\"1\"");
		}
		if(css!=null){
			builder.append(" class=\"").append(css).append("\"");
		}
		if(style!=null){
			builder.append(" style=\"").append(style).append("\"");
		}
		builder.append(">");
		if (items != null) {
			for (Entry<String, String> nt : items.entrySet()) {
				String key = nt.getKey();
				String val = nt.getValue();
				if (val.equalsIgnoreCase(path)) {
					builder.append("<option value=\"").append(key).append("\"");
					builder.append("selected=\"selected\">").append(val)
							.append("</option>");
				} else {
					builder.append("<option value=\"").append(key).append("\">")
							.append(val).append("</option>");
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

	public Map<String, String> getItems() {
		return items;
	}

	public void setItems(Map<String, String> items) {
		this.items = items;
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
	
}
