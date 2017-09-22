var ioc = {
	conf : {
		type : "org.nutz.ioc.impl.PropertiesProxy",
		fields : {
			paths : [ "mail/" ]
		}
	},
	// 数据源
	dataSource : {
		type : "org.apache.commons.dbcp.BasicDataSource",
		events : {
			depose : "close"
		},
		fields : {
			driverClassName : "com.mysql.jdbc.Driver",
			url : "jdbc:mysql://127.0.0.1:3306/project?useUnicode=true&characterEncoding=utf8&autoReconnect=true&failOverReadOnly=false",
			username : "root",
			password : "admin",
			initialSize : 10,
			maxActive : 100,
			testOnReturn : true,
			// validationQueryTimeout : 5,
			validationQuery : "select 1"
		}
	},
	prjAction : {
		type : "com.jit.project.project.web.PrjAction",
		fields : {
			prjService : {
				refer : 'prjService'
			},
			userService : {
				refer : 'userService'
			},
			dicService : {
				refer : 'dicService'
			},
			prdtService : {
				refer : 'prdtService'
			},
			dailyItemService : {
				refer : 'dailyItemService'
			}
		}
	},
	dao : {
		type : "org.nutz.dao.impl.NutDao",
		args : [ {
			refer : "dataSource"
		} ]
	},
	prjService : {
		type : "com.jit.project.project.service.PrjService",
		fields : {
			dao : {
				refer : 'dao'
			}
		}
	},
	chartService : {
		type : "com.jit.project.service.ChartService",
		fields : {
			dao : {
				refer : 'dao'
			}
		}
	},
	reportUtil : {
		type : "util.ReportUtil"
	},
	chartAction : {
		type : "com.jit.project.web.ChartAction",
		fields : {
			prjService : {
				refer : 'prjService'
			},
			chartService : {
				refer : "chartService"
			},
			reportUtil : {
				refer : 'reportUtil'
			}
		}
	},
	dicService : {
		type : 'com.jit.project.dictionary.service.DicService',
		fields : {
			dao : {
				refer : 'dao'
			}
		}
	},
	dicAction : {
		type : "com.jit.project.dictionary.web.DicAction",
		fields : {
			dicService : {
				refer : 'dicService'
			}
		}
	},
	authorityService : {
		type : 'com.jit.project.auth.service.AuthorityServiceImpl',
		fields : {
			dao : {
				refer : 'dao'
			}
		}
	},
	prdtAction : {
		type : "com.jit.project.product.web.ProductAction",
		fields : {
			prdtService : {
				refer : 'prdtService'
			}
		}
	},
	prdtService : {
		type : 'com.jit.project.product.service.ProductService',
		fields : {
			dao : {
				refer : 'dao'
			}
		}
	},
	orgAction : {
		type : "com.jit.project.org.web.OrgAction",
		fields : {
			orgService : {
				refer : 'orgService'
			},
			userService : {
				refer : 'userService'
			}
		}
	},
	orgService : {
		type : 'com.jit.project.org.service.OrgServiceImple',
		fields : {
			dao : {
				refer : 'dao'
			}
		}
	},
	missionAction : {
		type : "com.jit.project.mission.MissionAction",
		fields : {
			missionService : {
				refer : 'missionService'
			},
			dailyItemService : {
				refer : 'dailyItemService'
			},
			dicService : {
				refer : 'dicService'
			},
			userService : {
				refer : 'userService'
			},
			prdtService : {
				refer : 'prdtService'
			},
			prjService : {
				refer : 'prjService'
			},
			bugService : {
				refer : 'bugService'
			}
		}
	},
	missionService : {
		type : 'com.jit.project.mission.MissionServiceImpl',
		fields : {
			dao : {
				refer : 'dao'
			}
		}
	},
	dailyAction : {
		type : "com.jit.project.daily.web.DailyAction",
		fields : {
			dailyService : {
				refer : 'dailyService'
			},
			dailyItemService : {
				refer : 'dailyItemService'
			},
			dicService : {
				refer : 'dicService'
			},
			userService : {
				refer : 'userService'
			}
		}
	},
	dailyItemService : {
		type : 'com.jit.project.daily.service.DailyItemServiceImpl',
		fields : {
			dao : {
				refer : 'dao'
			}
		}
	},
	dailyService : {
		type : 'com.jit.project.daily.service.DailyServiceImpl',
		fields : {
			dao : {
				refer : 'dao'
			}
		}
	},
	portalAction : {
		type : "com.jit.project.portal.PortalAction",
		fields : {
			missionService : {
				refer : 'missionService'
			},
			bugService:{
				refer:'bugService'
			}
		}
	},
	bugService:{
		type : 'com.jit.project.bug.service.BugServiceImpl',
		fields : {
			dao : {
				refer : 'dao'
			}
		}
	},
	userAction : {
		type : "com.jit.project.user.web.UserAction",
		fields : {
			userService : {
				refer : 'userService'
			},
			orgService : {
				refer : 'orgService'
			},
			dicService : {
				refer : 'dicService'
			}
		}
	},
	userService : {
		type : 'com.jit.project.user.service.UserService',
		fields : {
			dao : {
				refer : 'dao'
			}
		}
	},
	bugAction : {
		type : "com.jit.project.bug.web.BugAction",
		fields : {
			bugService : {
				refer : 'bugService'
			}
		}
	},
	versionService : {
		type : 'com.jit.project.version.service.VersionService',
		fields : {
			dao : {
				refer : 'dao'
			}
		}
	},
	versionAction : {
		type : "com.jit.project.version.web.VersionAction",
		fields : {
			versionService : {
				refer : 'versionService'
			}
		}
	}
};