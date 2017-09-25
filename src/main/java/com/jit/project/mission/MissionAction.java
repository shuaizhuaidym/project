package com.jit.project.mission;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.nutz.dao.Condition;
import org.nutz.dao.QueryResult;
import org.nutz.dao.entity.Entity;
import org.nutz.dao.pager.Pager;
import org.nutz.ioc.annotation.InjectName;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.Encoding;
import org.nutz.mvc.annotation.Ok;
import org.nutz.mvc.annotation.Param;

import com.jit.project.bug.service.BugServiceImpl;
import com.jit.project.daily.service.DailyItemServiceImpl;
import com.jit.project.dictionary.service.IDicService;
import com.jit.project.product.service.ProductService;
import com.jit.project.project.service.PrjService;
import com.jit.project.user.service.UserService;

@InjectName("missionAction")
public class MissionAction {

	Logger log = Logger.getLogger(MissionAction.class);
	
	private String SUCCESS = "SUCCESS";

	private MissionServiceImpl missionService;
	private DailyItemServiceImpl dailyItemService;

	private IDicService dicService;
	private UserService userService;
	
	private ProductService prdtService; 
	
	private PrjService prjService;
	
	private BugServiceImpl bugService;

	Map<String, String> types = new HashMap<String, String>();
	Map<String, String> status = new HashMap<String, String>();
	Map<String, String> classes = new HashMap<String, String>();
	Map<String, String> users = new HashMap<String, String>();
	Map<String, String> products = new HashMap<String, String>();
	
	Map<String, String> industry = new HashMap<String, String>();

	private void prepareDic(HttpServletRequest request) {
		if (types.isEmpty()) {
			types = this.dicService.service(IDicService.type_mission_type);
			status = this.dicService.service(IDicService.type_mission_status);
			classes = this.dicService.service(IDicService.type_mission_class);
			users = this.userService.asDic();
			industry=this.dicService.service(IDicService.type_industry);
		}
		request.setAttribute("users", users);
		request.setAttribute("types", types);
		request.setAttribute("status", status);
		request.setAttribute("classes", classes);
		request.setAttribute("industry", this.dicService.service(IDicService.type_industry));
		request.setAttribute("products", this.prdtService.asDic(true));
		request.setAttribute("modules", this.prdtService.asDic(false));
	}

	/**
	 * 任务列表
	 * 
	 * @return
	 */
	@At("/mission/list")
	@Ok("jsp:views.jsp.mission.list")
	public QueryResult list(HttpServletRequest request) {
		QueryResult result = new QueryResult(new ArrayList<Mission>(), new Pager());
		request.setAttribute("query", new Query());
		return result;
	}

	/**
	 * 新增任务跳转
	 * 
	 * @return
	 */
	@At("/mission/form")
	@Ok("jsp:views.mission.form")
	public Mission add(HttpServletRequest request) {
		prepareDic(request);
		Mission mission=new Mission();
		return mission;
	}

	/**
	 * 新建任务
	 * 
	 * @param mission
	 * @return
	 */
	@At("/mission/create")
	@Ok("redirect:/mission/query")
	public String create(@Param("::mission.") Mission mission) {
		mission.setCreateTime(new Date(System.currentTimeMillis()));
		mission.setUpdateTime(new Date(System.currentTimeMillis()));
		missionService.dao().insert(mission);
		return SUCCESS;
	}

	/**
	 * 查询所有任务JSP
	 * 
	 * @return
	 */
	@At("/mission/query")
	@Ok("jsp:views.mission.list")
	@Encoding(input = "UTF-8", output = "UTF-8")
	public QueryResult queryPage(HttpServletRequest request,
			@Param("::query.") com.jit.project.mission.Query query) {
		if (query == null) {
			query = new com.jit.project.mission.Query();
		}
		if (types.isEmpty()) {
			status = this.dicService.service(IDicService.type_mission_status);
			users=this.userService.asDic();
		}
		request.setAttribute("status", status);
		request.setAttribute("query", query);
		request.setAttribute("users", users);
		
		QueryResult result = this.missionService.query(query);
		return result;
	}

	/**
	 * 查询所有任务JSON
	 * 
	 * @return
	 */
	@At("/mission/query/json")
	@Ok("json:full")
	public List<Mission> queryJsonPage() {
		Condition cnd = null;
		Pager pgr = null;
		List<Mission> missions = new ArrayList<Mission>();
		this.missionService.query(cnd, pgr);
		// 结果将转换为JSON
		return missions;
	}

	/**
	 * 加载要分配的任务
	 * 
	 * @return
	 */
	@At("/mission/loadForAssignAsync")
	@Ok("jsp:views.mission.assign")
	public Mission loadForAssignAsync(@Param("mission_id") final String missionID,
			HttpServletRequest request) {
		prepareDic(request);
		Mission mission = this.missionService.fetch(missionID);
		return mission;
	}

	/**
	 * 指派任务
	 * 
	 * @return
	 */
	@At("/mission/assign")
	@Ok("redirect:/mission/query")
	public Mission assign(@Param("::mission.") final Mission mission) {
		if (mission == null || mission.getMissionID() == null) {
			return null;
		}
		Condition cnd = new Condition() {
			private static final long serialVersionUID = 2506662999560543656L;

			@Override
			public String toSql(Entity<?> entity) {
				String sql = "where mission_id = " + mission.getMissionID();
				return sql;
			}
		};
		Mission msn = this.missionService.fetch(cnd);
		msn.setAssignTo(mission.getAssignTo());// TODO other fields
		msn.setTotalHours(mission.getTotalHours());
		msn.setComments(mission.getComments());
		this.missionService.dao().updateIgnoreNull(msn);
		return mission;
	}

	/**
	 * 编辑任务
	 * 
	 * @return
	 */
	@At("/mission/edit")
	@Ok("jsp:views.mission.edit")
	public Mission edit(@Param("mission_id") final String mission_id, HttpServletRequest request) {
		prepareDic(request);
		if (mission_id == null) {
			return null;
		}
		Condition cnd = new Condition() {
			private static final long serialVersionUID = 835931499208726402L;

			@Override
			public String toSql(Entity<?> entity) {
				String sql = "where mission_id = " + mission_id;
				return sql;
			}
		};
		Mission msn = this.missionService.fetch(cnd);
		return msn;
	}

	/**
	 * 更新任务
	 * 
	 * @return
	 */
	@At("/mission/update")
	@Ok("redirect:/mission/query")
	public Mission update(@Param("::mission.") final Mission mission) {
		if (mission == null || mission.getMissionID() == null) {
			return null;
		}
		this.missionService.dao().updateIgnoreNull(mission);
		return mission;
	}

	/**
	 * 查看任务执行历史(日报条目)
	 * 
	 * @return
	 */
	@At("/mission/history")
	@Ok("jsp:views.mission.history")
	public List<History> history(@Param("mission_id") final String missionID, HttpServletRequest request) {
		Mission mission=this.missionService.fetch(missionID);
		List<History> history = this.dailyItemService.queryByMissionID(missionID);
		request.setAttribute("mission", mission);
		return history;
	}

	/**
	 * 日报引用关联任务
	 * 
	 * @return
	 */
	@At("/mission/refer")
	@Ok("jsp:views.mission.refer")
	public QueryResult refer(HttpServletRequest request, @Param("::query.") Query query) {
		String user = (String) request.getSession(true).getAttribute("me");
		log.info(user);
		if (query == null) {
			query = new com.jit.project.mission.Query(user);
		}
		request.setAttribute("query", query);
		QueryResult result = this.missionService.query(query);
		// request.setAttribute("mission_index", request.getParameter("mission_index"));
		QueryResult projects = this.prjService.query(new com.jit.project.bean.Query());
		request.setAttribute("projects", projects);
		
		QueryResult bugs = this.bugService.query(new com.jit.project.bug.bean.Query(user));
		request.setAttribute("bugs", bugs);
		return result;
	}

	/**
	 * 统计任务工作量
	 * @param mission_id
	 * @return
	 */
	@At("/mission/count_hours")
	@Ok("raw:html")
	public String countHours(@Param("mission_id") Integer mission_id){
		Integer hrs = missionService.countHourse(mission_id);
		return hrs.toString();
	}
	
	/**
	 * 删除任务，无外键约束需要谨慎
	 * @param missionID
	 */
	@At("/mission/remove")
	@Ok("redirect:/mission/query")
	public void remove(@Param("mission_id") String missionID) {
		Mission min = this.missionService.fetch(missionID);
		if (min != null) {
			this.missionService._delete(min);
		}
	}
	
	public MissionServiceImpl getMissionService() {
		return missionService;
	}

	public void setMissionService(MissionServiceImpl missionService) {
		this.missionService = missionService;
	}

	public DailyItemServiceImpl getDailyItemService() {
		return dailyItemService;
	}

	public void setDailyItemService(DailyItemServiceImpl dailyItemService) {
		this.dailyItemService = dailyItemService;
	}

	public IDicService getDicService() {
		return dicService;
	}

	public void setDicService(IDicService dicService) {
		this.dicService = dicService;
	}

	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public ProductService getPrdtService() {
		return prdtService;
	}

	public void setPrdtService(ProductService prdtService) {
		this.prdtService = prdtService;
	}

	public PrjService getPrjService() {
		return prjService;
	}

	public void setPrjService(PrjService prjService) {
		this.prjService = prjService;
	}

	public BugServiceImpl getBugService() {
		return bugService;
	}

	public void setBugService(BugServiceImpl bugService) {
		this.bugService = bugService;
	}

}
