package com.jit.project.persist;

import java.util.List;

import org.nutz.dao.Dao;
import org.nutz.dao.QueryResult;
import org.nutz.dao.impl.NutDao;
import org.nutz.dao.pager.Pager;
import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.trans.Atom;
import org.nutz.trans.Trans;

import com.jit.project.bean.Project;
@IocBean
public class PrjDao {
	@Inject
	private NutDao dao;
	
	public void create(Project prj){
		
	}
	public void delete(){
		
	}
	public void update(){
		
	}
	public void load(){
		
	}
	/**
	 * 分页查询
	 * @param dao
	 * @param pageNumber
	 * @param pageSize
	 * @return
	 */
	public QueryResult getProjectList(Dao dao, int pageNumber, int pageSize){
	    Pager pager = dao.createPager(pageNumber, pageSize);
	    List<Project> list = dao.query(Project.class, null, pager);
	    pager.setRecordCount(dao.count(Project.class));
	    return new QueryResult(list, pager);
	}
	//事务操作
	public void batchUpdate(){
		// Begin transaction		
		Trans.exec(new Atom(){
		    public void run() {
		        //TODO
		    }
		});
		// End transaction
	}
	protected NutDao getDao() {
		return dao;
	}
	protected void setDao(NutDao dao) {
		this.dao = dao;
	}

}
