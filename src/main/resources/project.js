var ioc = {
	// 数据源
	dataSource : {
		type : "org.apache.commons.dbcp.BasicDataSource",
		events : {
			depose : "close"
		},
		fields : {
			driverClassName : "com.mysql.jdbc.Driver",
			url : "jdbc:mysql://127.0.0.1:3306/test",
			username : "root",
			password : "admin",
			initialSize : 10,
			maxActive : 100,
			testOnReturn : true,
			// validationQueryTimeout : 5,
			validationQuery : "select 1"
		}
	},
	dao : {
		type : "org.nutz.dao.impl.NutDao",
		args : [ {
			refer : "dataSource"
		} ]
	},
	prjService : {
		type : "com.jit.project.service.PrjService",
		fields : {
			dao : {
				refer : 'dao'
			}
		}
	},
	prjAction : {
		type : "com.jit.project.web.PrjAction",
		fields : {
			prjService : {
				refer : 'prjService'
			}
		}
	},
	dicService : {
		type : 'com.jit.project.service.DicService',
		fields : {
			dao : {
				refer : 'dao'
			}
		}
	},
	dicAction : {
		type : "com.jit.project.web.DicAction",
		fields : {
			dicService : {
				refer : 'dicService'
			}
		}
	},
	reportAction:{
		type : "com.jit.project.web.ReportAction",
		fields : {
			prjService : {
				refer : 'prjService'
			}
		}
	}
};