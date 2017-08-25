/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50527
Source Host           : localhost:3306
Source Database       : project

Target Server Type    : MYSQL
Target Server Version : 50527
File Encoding         : 65001

Date: 2017-08-25 18:03:28
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_bug
-- ----------------------------
DROP TABLE IF EXISTS `t_bug`;
CREATE TABLE `t_bug` (
  `BG_BUG_ID` int(16) DEFAULT NULL,
  `BG_STATUS` varchar(70) DEFAULT NULL,
  `BG_RESPONSIBLE` varchar(60) DEFAULT NULL,
  `BG_PROJECT` varchar(70) DEFAULT NULL,
  `BG_SUBJECT` varchar(255) DEFAULT NULL,
  `BG_SUMMARY` varchar(255) DEFAULT NULL,
  `BG_DESCRIPTION` text,
  `BG_DEV_COMMENTS` text,
  `BG_REPRODUCIBLE` varchar(1) DEFAULT NULL,
  `BG_SEVERITY` varchar(70) DEFAULT NULL,
  `BG_PRIORITY` varchar(70) DEFAULT NULL,
  `BG_DETECTED_BY` varchar(70) DEFAULT NULL,
  `BG_DETECTION_DATE` datetime DEFAULT NULL,
  `BG_DETECTION_VERSION` varchar(70) DEFAULT NULL,
  `BG_PRODUCT` varchar(70) DEFAULT NULL,
  `BG_MODULE` varchar(70) DEFAULT NULL,
  `BG_LAST_MODIFY` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_bug
-- ----------------------------
INSERT INTO `t_bug` VALUES ('3823', '新建', '王毅', 'TECH', 'DEV', '在工具包管理页面，按文件大小排序，排序顺序不正确', '<html><body>操作步骤：<br>1.登录网关服务端，选择【系统维护】【工具包管理】<br>2.在工具列表，按文件大小排序<br><br>预期结果：<br>工具列表显示会按照工具文件由小到大排序<br><br>实际结果：<br>如工具列表有工具A(1M)、工具B(5M)、工具C(12M),从小到大排序后显示为<br>工具A(1M)<br>工具C(12M)<br>工具B(5M)</body></html>', 'dev-commonts', '1', 'serity', 'priority', '霍成义', '2017-08-02 00:00:00', '3.0.34.9', 'Phoenix', 'Client', '2017-08-02 09:45:41');
INSERT INTO `t_bug` VALUES ('3824', '新建', '王毅', 'TECH', 'DEV', '在工具包管理页面，选择4G左右工具包，提示信息不准确', '<html><body>预置条件：<br>准备一个4G左右的zip包，zip包中没有文件夹目录<br><br>操作步骤：<br>1.在工具包管理页面，点击&quot;浏览&quot;<br>2.选择4G左右工具包<br><br>预期结果：<br>弹出提示框，提示&quot;文件大小不能超过2048 MB&quot;<br><br>实际结果：<br>弹出提示框，提示&quot;文件不能为空&quot;<br><br>备注：<br>选择3.8G工具，提示&quot;文件大小不能超过2048 MB&quot;</body></html>', 'dev-commonts', '1', 'serity', 'priority', '霍成义', '2017-08-02 00:00:00', '3.0.34.9', 'Phoenix', 'Client', '2017-08-07 09:56:09');
INSERT INTO `t_bug` VALUES ('3825', '打开', '丁为厂', 'TECH', 'DEV', 'IP地址修改IP时，修改已有的IP时不提示IP冲突，修改后导致已经存在的IP无法访问。', '<html><body>操作步骤：<br>1、使用系统管理员访问网关管理页面<br>2、点击【系统设置-网络设置-IP地址】进入IP地址页面<br>3、选择9网段IP进行修改，修改成已经存在的IP，如将：192.168.9.98修改为192.168.9.130（IP已经存在）<br>预期结果;<br>在保存时提示用户IP冲突无法修改<br>实际结果：<br>1、可以正常保存，并且保存成功后可以通过9.130IP访问网关，发现此时的9.130是之前的9.98<br>2、将IP修改为原始IP，此时发现原9.130设备无法访问。</body></html>', 'dev-commonts', '1', 'serity', 'priority', '于凯', '2017-08-02 00:00:00', '3.0.34.9', 'Phoenix', 'Client', '2017-08-08 13:13:46');
INSERT INTO `t_bug` VALUES ('3826', '新建', '王毅', 'TECH', 'DEV', '导出大于1万条日志，添加后台任务成功的提示内容不够直观明了', '<html><body>预置条件：<br>1.业务日志已超过1万条<br>操作步骤：<br>1.登录网关服务端，选择【审计日志】【业务日志查询】<br>2.查询出所有日志，点击&quot;导出&quot;--选择&quot;导出全部查询结果&quot;--选择&quot;使用EXCEL格式&quot;或&quot;使用ACCESS格式&quot;<br>3.弹出添加后台任务提示框，点击&quot;确定&quot;<br><br>预期结果：<br>弹出提示框，提示&quot;添加后台任务[业务日志导出_20170821153956_ACCESS]成功,请到系统维护-任务管理模块下查看&quot;<br><br>实际结果：<br>弹出提示框，提示添加后台任务[tb_option_log导出_20170821153956_ACCESS]成功,请到系统维护-任务管理模块下查看<br><br>备注：<br>1.导出大于1万条管理日志、错误日志、客户端环境检查日志、流量日志和系统日志也有上述问题</body></html>', 'dev-commonts', '1', 'serity', 'priority', '霍成义', '2017-08-03 05:59:01', '3.0.34.9', 'Phoenix', 'Client', '2017-08-25 16:06:36');
INSERT INTO `t_bug` VALUES ('3829', '新建', '王毅', 'TECH', 'DEV', '网关在会话配置页面，每会话最大连接数输入栏经常出现无法输入内容的情况，该问题非必现但复现几率较大', '<html><body>操作步骤：<br>1、使用系统管理员访问网关管理页面<br>2、点击【系统设置-会话配置】进入会话配置页面<br>3、在会话配置进行操作，包括输入错误的信息，使页面保存等操作<br>4、在选择每会话最大连接数时输入内容<br>预期结果：<br>可以正常输入<br>实际结果：<br>无法正常输入，将光标切换到其他栏可以正常输入，在切换到每会话最大连接数依然无法输入<br>备注：<br>1、该问题复现给世宇看过<br>2、经过多次测试复现几次其中复现几率较大的方法就是在页面输入内容时使其报错后在进行输入每会话最大连接数</body></html>', 'dev-commonts', '1', 'serity', 'priority', '于凯', '2017-08-09 00:00:00', '3.0.34.9', 'Phoenix', 'Client', '2017-08-09 10:14:01');
INSERT INTO `t_bug` VALUES ('3830', '打开', '吴畏', 'TECH', 'DEV', '报文应用认证，使用网关不信任的证书进行认证，可以正常认证通过。', '<html><body>前提条件：<br>PC中安装有两张主题相同颁发者不同的证书A，如JIT CA和DemoCa，且网关可信CA中只上传了JIT CA的根证<br>网关中已经添加报文应用<br>操作步骤：<br>1、访问报文应用--先使用网关信任的证书A进行认证--可以正常认证<br>2、再次访问报文应用--使用网关不信任的证书A进行认证--查看是否可以认证通过<br>预期结果：<br>无法认证用过，提示&quot;没有上传可信CA证书&quot;<br>实际结果：<br>使用不受信任的证书A进行报文认证，仍然可以认证通过。<br>备注：<br>如果先使用不信任的证书A进行报文认证，是无法认证的，会提示没有上传可信CA。<br>如果先使用信任的证书A认证通过，再使用不信任的证书A进行认证，仍然可以认证通过。</body></html>', 'dev-commonts', '1', 'serity', 'priority', '张敬兵', '2017-08-09 00:00:00', '3.0.34.10', 'Phoenix', 'Client', '2017-08-10 16:04:48');
INSERT INTO `t_bug` VALUES ('3831', '新建', '王毅', 'TECH', 'DEV', '网关配置透明代理免路由模式可以正常使用，重启客户端PC机后，透明代理不能正常使用', '<html><body>操作步骤：<br>1.在【应用管理】配置透明代理应用（服务器地址段：192.168.12.230）<br>2.在【透明代理配置】开启透明代理--免路由模式--设备网关eht1--虚拟IP192.168.12.10-192.168.12.20<br>3.客户端登录网关，可以正常ping 192.168.12.230<br>4.重启电脑，等待客户端自动登录后，再ping 192.168.12.230<br><br>预期结果：<br>可以正常ping通<br><br>实际结果：<br>ping不通<br><br>相关排查：<br>1.刷新客户端，ping不通<br>2.客户端重新登录网关，ping不通</body></html>', 'dev-commonts', '1', 'serity', 'priority', '霍成义', '2017-08-09 00:00:00', '3.0.34.10', 'Phoenix', 'Client', '2017-08-09 16:50:48');
INSERT INTO `t_bug` VALUES ('3832', '新建', '王毅', 'TECH', 'DEV', '做完网关镜像初始化完成后，登录网关查看调试日志存在垃圾日志', '<html><body>操作步骤：<br>1.重做网关镜像<br>2.初始化网关后，登录网关服务端<br>3.在【系统维护】【辅助工具】【调试日志下载】，查询所有调试日志<br><br>预期结果：<br>只能查询到做镜像以后时间的调试日志<br><br>实际结果：<br>查询到做镜像之前时间的调试日志</body></html>', 'dev-commonts', '1', 'serity', 'priority', '霍成义', '2017-08-10 00:00:00', '3.0.34.10', 'Phoenix', 'Client', '2017-08-11 14:56:03');
INSERT INTO `t_bug` VALUES ('3833', '新建', '王毅', 'TECH', 'DEV', '管理员管理在上传证书时未校验证书生效时间，导致在上传完成后证书无法访问网关管理页', '<html><body>操作步骤：<br>1、使用管理员访问网关管理页面<br>2、点击管理员管理页面上传管理员证书<br>3、上传一个有效期在当前网关时间以后生效的证书，如当前网关时间2013-08-10 上传一个证书有效期为2017-08-10到2018-08-10的证书<br>预期结果：<br>提示用户当前证书未生效，是否继续任命管理员<br>实际结果：<br>没有任何提示信息，在上传完成后无法访问网关管理页面</body></html>', 'dev-commonts', '1', 'serity', 'priority', '于凯', '2017-08-10 00:00:00', '3.0.34.10', 'Phoenix', 'Client', '2017-08-11 15:28:05');
INSERT INTO `t_bug` VALUES ('3834', '新建', '王毅', 'TECH', 'DEV', '网关已加入GMS集中管控，添加agent应用，agent查询方式为“密文”，添加完成后GMS进行手动审核，无法审核。', '<html><body>前提条件：<br>网关已经加入GMS集中管控<br>操作步骤：<br>1.应用管理中添加agent应用--填写基本配置信息--高级配置<br>2.agent查询方式选择&quot;密文&quot;--保存<br>3.应用添加成功后到GMS控制台页面进行应用审核--选择应用--点击&quot;通过&quot;<br>4.查看是否可以审核通过<br>预期结果：<br>可以正常的审核通过<br>实际结果：<br>无法审核通过，点击&quot;通过&quot;后，GMS报错。</body></html>', 'dev-commonts', '1', 'serity', 'priority', '张敬兵', '2017-08-15 00:00:00', '3.0.34.10', 'Phoenix', 'Client', '2017-08-15 13:20:58');
INSERT INTO `t_bug` VALUES ('3835', '新建', '王毅', 'TECH', 'DEV', '使用证书访问透明代理自动登录应用，业务日志记录应用端口为0', '<html><body>操作步骤：<br>1.登录网关服务端<br>2.在【应用管理】添加透明代理自登录应用（应用端口为8080）<br>3.在【透明代理配置】开启透明代理免路由模式<br>4.使用证书用户登录客户端<br>5.在浏览器输入应用那个地址，可以正常访问<br>6.查看业务日志<br><br>预期结果：<br>在【审计日志】【业务日志查询】记录一条行为审计日志<br><br>实际结果：<br>行为审计日志中应用端口为0<br><br>备注：<br>使用口令用户认证，按照上述操作，查看业务日志中行为审计日志应用端口正确（见附件截图）</body></html>', 'dev-commonts', '1', 'serity', 'priority', '霍成义', '2017-08-16 00:00:00', '3.0.34.10', 'Phoenix', 'Client', '2017-08-16 15:23:00');
INSERT INTO `t_bug` VALUES ('3836', '新建', '王毅', 'TECH', 'DEV', '边界网关添加网段应用后在导入主旁公用license后，未做限制，在修改应用时页面无法选择接入类型，如附件', '<html><body>操作步骤：<br>1、在边界网关中添加网段应用<br>2、将边界网关导入主旁公用license<br>预期结果：<br>提示网关存在网段应用无法导入主旁公用license<br>实际结果：<br>没有任何提示，可以导入，但导入之后的网关在修改网段应用时页面显示存在问题</body></html>', 'dev-commonts', '1', 'serity', 'priority', '于凯', '2017-08-23 00:00:00', '3.0.34.10', 'Phoenix', 'Client', '2017-08-23 13:46:17');
INSERT INTO `t_bug` VALUES ('3837', '新建', '王毅', 'TECH', 'DEV', '网关配置site to site时，在配置本地保护子网时未做校验，服务器和客户端配置相同地址时在启动客户端时页面保存。如附件', '<html><body>操作步骤：<br>1、网关84创建site to site服务器，本地保护子网192.168.9.0-192.168.9.254<br>2、网关87创建site to site客户端，本地保护子网192.168.9.0-192.168.9.254<br>预期结果：<br>进行校验，提示填写内容冲突无法保存<br>实际结果：<br>未做校验，可以正常保存，但在启动客户端服务时保存，如附件</body></html>', 'dev-commonts', '1', 'serity', 'priority', '于凯', '2017-08-23 00:00:00', '3.0.34.10', 'Phoenix', 'Client', '2017-08-23 13:50:33');
INSERT INTO `t_bug` VALUES ('3837', '新建', '王毅', 'TECH', 'DEV', '网关配置site to site时，在配置本地保护子网时未做校验，服务器和客户端配置相同地址时在启动客户端时页面保存。如附件', '<html><body>操作步骤：<br>1、网关84创建site to site服务器，本地保护子网192.168.9.0-192.168.9.254<br>2、网关87创建site to site客户端，本地保护子网192.168.9.0-192.168.9.254<br>预期结果：<br>进行校验，提示填写内容冲突无法保存<br>实际结果：<br>未做校验，可以正常保存，但在启动客户端服务时保存，如附件</body></html>', 'dev-commonts', '1', 'serity', 'priority', '于凯', '2017-08-23 00:00:00', '3.0.34.10', 'Phoenix', 'Client', '2017-08-23 13:51:52');

-- ----------------------------
-- Table structure for t_daily
-- ----------------------------
DROP TABLE IF EXISTS `t_daily`;
CREATE TABLE `t_daily` (
  `daily_id` int(11) NOT NULL AUTO_INCREMENT,
  `create_date` datetime DEFAULT NULL,
  `owner_id` varchar(64) DEFAULT NULL,
  `owner_name` varchar(64) DEFAULT NULL,
  `mail_to` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `item_links` text,
  PRIMARY KEY (`daily_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_daily
-- ----------------------------
INSERT INTO `t_daily` VALUES ('21', '2017-08-19 11:27:37', '0', null, '0', '<a 0>2222222222</a>|');
INSERT INTO `t_daily` VALUES ('22', '2017-08-19 11:35:35', '0', '代艳明', '0', '<a 0>1708:河南财政多CA体系共存项目 方案验证。</a>|');
INSERT INTO `t_daily` VALUES ('23', '2017-08-19 11:39:33', '0', '代艳明', '0', '<a 0>今天增加的工作量</a>|<a 0>今天工作</a>|');
INSERT INTO `t_daily` VALUES ('25', '2017-08-19 12:28:35', '0', '代艳明', '0', '<a 0>111</a>|');
INSERT INTO `t_daily` VALUES ('26', '2017-08-19 12:32:47', '0', '代艳明', '0', '<a 0>222222222222222222</a>|');
INSERT INTO `t_daily` VALUES ('27', '2017-08-19 12:33:17', '0', '代艳明', '0', '<a 0>222222222222222222</a>|');
INSERT INTO `t_daily` VALUES ('28', '2017-08-19 12:37:36', '0', '代艳明', '0', '<a 0>fff</a>|');
INSERT INTO `t_daily` VALUES ('29', '2017-08-19 12:42:35', '0', null, '0', '<a 0>1</a>|');
INSERT INTO `t_daily` VALUES ('30', '2017-08-19 12:46:18', '0', '代艳明', '0', '<a 0>5555555555555</a>|');
INSERT INTO `t_daily` VALUES ('31', '2017-08-22 15:01:43', '0', '代艳明', '0', '<a 0>标准Agent扩展，支持从HTTP HEADER中获取属性。</a>|');
INSERT INTO `t_daily` VALUES ('32', '2017-08-22 15:05:08', '0', '代艳明', '0', '<a 0>公安部辅警项目定制Agent改进，通过配置项兼容I网关</a>|');
INSERT INTO `t_daily` VALUES ('33', '2017-08-22 15:14:43', '0', '代艳明', '0', '<a 0>提供最新版本3.0.34.10升级包，满足测试要求。</a>|');
INSERT INTO `t_daily` VALUES ('34', '2017-08-22 15:18:26', '0', '代艳明', '0', '<a 0>1、在项目管理平台中搜索历史记录，3.0.27X版本问题是因为数据库字段过短，发现通过shell有解决办法。\r\n2、shell提供给工程验证。</a>|');
INSERT INTO `t_daily` VALUES ('35', '2017-08-23 10:58:23', '0', '代艳明', '0', '<a 0>配合现场测试</a>|<a 0>指导应用开发。</a>|');
INSERT INTO `t_daily` VALUES ('36', '2017-08-25 11:23:45', '0', '代艳明', '0', '<a 0>1、验证问题\r\n2、走查代码</a>|<a 0>1、制造数据\r\n2、手动提交请求测试</a>|');

-- ----------------------------
-- Table structure for t_daily_item
-- ----------------------------
DROP TABLE IF EXISTS `t_daily_item`;
CREATE TABLE `t_daily_item` (
  `item_id` int(11) NOT NULL AUTO_INCREMENT,
  `daily_id` int(11) DEFAULT NULL,
  `mission_id` int(11) DEFAULT NULL,
  `mission_name` varchar(1024) DEFAULT NULL,
  `mission_summary` varchar(255) DEFAULT NULL,
  `hours` int(11) DEFAULT NULL,
  `percentage` int(11) DEFAULT NULL,
  `progress_detail` text,
  `problerm` varchar(254) DEFAULT NULL,
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_daily_item
-- ----------------------------
INSERT INTO `t_daily_item` VALUES ('19', '25', '1708', '河南财政多CA体系共存项目', '河南财政多CA体系共存项目', '2', '90', '111', '1');
INSERT INTO `t_daily_item` VALUES ('21', '27', '30', '琐琐碎碎s', '琐琐碎碎s', '2', '2', '222222222222222222', 'o');
INSERT INTO `t_daily_item` VALUES ('22', '28', '30', '琐琐碎碎s', '琐琐碎碎s', '1', '1', 'fff', '111');
INSERT INTO `t_daily_item` VALUES ('23', '29', '29', '测试主键1', null, '1', '1', '1', '1');
INSERT INTO `t_daily_item` VALUES ('24', '30', '1708', '河南财政多CA体系共存项目', null, '4', '5', '5555555555555', '6666666');
INSERT INTO `t_daily_item` VALUES ('25', '31', '31', '标准Agent扩展', null, '5', '100', '标准Agent扩展，支持从HTTP HEADER中获取属性。', '无');
INSERT INTO `t_daily_item` VALUES ('26', '32', '32', '公安部辅警项目定制Agent改进', null, '4', '100', '公安部辅警项目定制Agent改进，通过配置项兼容I网关', '无');
INSERT INTO `t_daily_item` VALUES ('27', '33', '1710', '甘肃公安I网关集群扩容', null, '3', '60', '提供最新版本3.0.34.10升级包，满足测试要求。', '无');
INSERT INTO `t_daily_item` VALUES ('28', '34', '1711', '航天科工三院301所网关采购项目', null, '3', '80', '1、在项目管理平台中搜索历史记录，3.0.27X版本问题是因为数据库字段过短，发现通过shell有解决办法。\r\n2、shell提供给工程验证。', '无');
INSERT INTO `t_daily_item` VALUES ('29', '35', '1711', '航天科工三院301所网关采购项目', null, '5', '90', '配合现场测试', '');
INSERT INTO `t_daily_item` VALUES ('30', '35', '31', '标准Agent扩展', null, '3', '59', '指导应用开发。', 'no');
INSERT INTO `t_daily_item` VALUES ('31', '36', '3683', '属性传递性能优先在服务器缓存为0时口令用户访问属性传递应用不先进行查询数据库的步骤而是直接查询UMS。', null, '3', '99', '1、验证问题\r\n2、走查代码', '无');
INSERT INTO `t_daily_item` VALUES ('32', '36', '3785', '客户端使用attach签名，服务端用detach验签失败。原理上应该是成功的', null, '5', '100', '1、制造数据\r\n2、手动提交请求测试', '无');

-- ----------------------------
-- Table structure for t_dictionary
-- ----------------------------
DROP TABLE IF EXISTS `t_dictionary`;
CREATE TABLE `t_dictionary` (
  `dic_id` int(32) NOT NULL AUTO_INCREMENT,
  `dic_type` varchar(128) NOT NULL,
  `dic_name` varchar(255) NOT NULL,
  `comments` varchar(1024) DEFAULT NULL,
  `available` varchar(16) DEFAULT NULL,
  `display_number` int(11) DEFAULT NULL,
  `dic_code` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`dic_id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_dictionary
-- ----------------------------
INSERT INTO `t_dictionary` VALUES ('13', '负责人', '刘宗恺', '研发负责人', '1', null, null);
INSERT INTO `t_dictionary` VALUES ('14', '任务状态', '未启动', '', '1', '1', null);
INSERT INTO `t_dictionary` VALUES ('15', '任务状态', '进行中-需求分析中', '', '1', '2', null);
INSERT INTO `t_dictionary` VALUES ('16', '任务状态', '进行中-设计中', '', '1', '3', null);
INSERT INTO `t_dictionary` VALUES ('17', '任务状态', '进行中-开发中', '', '1', '5', null);
INSERT INTO `t_dictionary` VALUES ('18', '任务状态', '进行中-测试中', '', '1', '6', null);
INSERT INTO `t_dictionary` VALUES ('19', '任务状态', '延期-开发中', '', '1', '7', null);
INSERT INTO `t_dictionary` VALUES ('20', '任务状态', '延期-测试中', '', '1', '8', null);
INSERT INTO `t_dictionary` VALUES ('21', '任务状态', '已完成', '', '1', '9', '');
INSERT INTO `t_dictionary` VALUES ('22', '任务状态', '暂停', '', '1', '10', null);
INSERT INTO `t_dictionary` VALUES ('23', '任务类型', '科研项目', '科研项目', '1', '0', '科研项目');
INSERT INTO `t_dictionary` VALUES ('24', '任务类型', '售前技术支持', '售前技术支持', '1', '0', '售前技术支持');
INSERT INTO `t_dictionary` VALUES ('25', '任务类型', '售后技术支持', '售后技术支持', '1', '0', '售后技术支持');
INSERT INTO `t_dictionary` VALUES ('26', '任务类型', '持续改进', '持续改进', '1', '0', '持续改进');
INSERT INTO `t_dictionary` VALUES ('27', '任务类型', '售后需求开发', '售后需求开发', '1', '0', '售后需求开发');
INSERT INTO `t_dictionary` VALUES ('28', '任务类型', '售前需求开发', '售前需求开发', '1', '0', '售前需求开发');
INSERT INTO `t_dictionary` VALUES ('29', '任务类型', '售前定制开发', '售前定制开发', '1', '0', '售前定制开发');
INSERT INTO `t_dictionary` VALUES ('30', '任务类型', '售后定制开发', '售后定制开发', '1', '0', '售后定制开发');
INSERT INTO `t_dictionary` VALUES ('31', '任务类别', '新功能', '', '1', '0', '新功能');
INSERT INTO `t_dictionary` VALUES ('32', '任务类别', '缺陷修复', '', '1', '9', '缺陷修复');
INSERT INTO `t_dictionary` VALUES ('33', '任务类别', '产品改进', '', '1', '8', '产品改进');
INSERT INTO `t_dictionary` VALUES ('34', '所属行业', '财政', '', '1', '1', '财政');
INSERT INTO `t_dictionary` VALUES ('35', '所属行业', '公安', '', '1', null, '公安 2');
INSERT INTO `t_dictionary` VALUES ('36', '所属行业', '军工', '', '1', '3', '军工');
INSERT INTO `t_dictionary` VALUES ('37', '任务状态', '进行中-设计评审中', '', '1', '4', '进行中-设计评审中');
INSERT INTO `t_dictionary` VALUES ('38', '所属行业', '政府/渠道', '', '1', '5', '政府/渠道');

-- ----------------------------
-- Table structure for t_mission
-- ----------------------------
DROP TABLE IF EXISTS `t_mission`;
CREATE TABLE `t_mission` (
  `mission_id` int(11) NOT NULL AUTO_INCREMENT,
  `mission_name` varchar(254) DEFAULT NULL,
  `type` varchar(32) DEFAULT NULL,
  `content` text,
  `summary` varchar(1024) DEFAULT NULL,
  `deadline` datetime DEFAULT NULL,
  `status` varchar(64) DEFAULT NULL,
  `progress` int(11) DEFAULT NULL,
  `task_class` varchar(128) DEFAULT NULL,
  `parent_id` varchar(254) DEFAULT NULL,
  `product_version` varchar(254) DEFAULT NULL,
  `plan_start` datetime DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `plan_end` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `product_sub_type` int(11) DEFAULT NULL,
  `product_base_version` varchar(32) DEFAULT NULL,
  `publish_version` varchar(32) DEFAULT NULL,
  `project_id` int(32) DEFAULT NULL,
  `project_name` varchar(255) DEFAULT NULL,
  `project_manager` varchar(64) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `product_name` varchar(254) DEFAULT NULL,
  `module` varchar(64) DEFAULT NULL,
  `progress_detail` text,
  `assign_to` varchar(64) DEFAULT NULL,
  `total_hours` char(16) DEFAULT NULL,
  `team_id` int(11) DEFAULT NULL,
  `comments` text,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `industry_id` varchar(64) DEFAULT NULL,
  `industry_name` varchar(255) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`mission_id`),
  UNIQUE KEY `dx_mission_id` (`mission_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COMMENT='task_class:任务类别，产品研发，缺陷，改进\r\ntask_type:任务类型，科研项目，售前技术支持，';

-- ----------------------------
-- Records of t_mission
-- ----------------------------
INSERT INTO `t_mission` VALUES ('29', '测试主键1', '科研项目', '测试主键', '测试主键dddddddd', '2017-08-19 00:00:00', '进行中-需求分析中', '1', '新功能', '', '1.0', null, null, null, null, '0', '', '', '0', '0', null, '0', 'IOS版本MCTK', 'IOS版本MCTK', '', '杜俊杰', '', '0', '', '2017-08-19 00:00:00', '2017-08-19 12:43:36', null, '财政', null);
INSERT INTO `t_mission` VALUES ('30', '琐琐碎碎s', '科研项目', 'ss', 'ss', '2017-08-04 00:00:00', '进行中-开发中', '1', '新功能', '', '1.0', null, null, null, null, '0', '', '', '0', '0', null, '0', 'IOS版本MCTK', 'IOS版本MCTK', '', '何金龙', '', '0', '', '2017-08-19 00:00:00', '2017-08-01 00:00:00', null, '财政', null);
INSERT INTO `t_mission` VALUES ('31', '标准Agent扩展', '售前定制开发', '标准Agent扩展', '标准Agent扩展', '2017-08-23 00:00:00', '进行中-测试中', '0', '新功能', '', '2.3.0', null, '2017-08-21 00:00:00', '2017-08-23 11:24:57', '2017-08-22 00:00:00', '0', '', '', '0', '0', null, '0', 'IOS版本MCTK', 'IOS版本MCTK', '', '代艳明', '', '0', '', '2017-08-22 00:00:00', '2017-08-23 10:58:23', null, '公安', null);
INSERT INTO `t_mission` VALUES ('32', '公安部辅警项目定制Agent改进', '售后定制开发', '公安部辅警项目定制Agent改进', '公安部辅警项目定制Agent改进', '2017-08-22 00:00:00', '已完成', '100', '新功能', '', '3.0.34.9', null, '2017-08-21 00:00:00', null, '2017-08-22 00:00:00', '0', '', '', '0', '0', null, '0', '身份认证网关E系列', 'gateway服务', '', '代艳明', '12', '0', '', '2017-08-22 00:00:00', '2017-08-22 15:05:08', null, '公安', null);

-- ----------------------------
-- Table structure for t_org
-- ----------------------------
DROP TABLE IF EXISTS `t_org`;
CREATE TABLE `t_org` (
  `org_id` int(32) NOT NULL AUTO_INCREMENT,
  `org_name` varchar(50) NOT NULL,
  `alias` varchar(50) DEFAULT NULL,
  `parent_id` int(32) DEFAULT NULL,
  `path` varchar(50) DEFAULT NULL,
  `introduction` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`org_id`),
  UNIQUE KEY `org_name` (`org_name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_org
-- ----------------------------
INSERT INTO `t_org` VALUES ('1', '研究院', 'R&D', '0', '/jit', '。。。');
INSERT INTO `t_org` VALUES ('2', '长春公司', 'cc', '0', '/jit', '。。。');
INSERT INTO `t_org` VALUES ('3', '东北公司', 'db', '0', '/jit', '。。。');
INSERT INTO `t_org` VALUES ('4', 'IPC产品部', 'ipc', '1', '/jit/ipc', '...');
INSERT INTO `t_org` VALUES ('5', '签名产品部', 'sign', '1', '/jit/ipc', '.。。');
INSERT INTO `t_org` VALUES ('6', '吉大正元', 'jit', '-1', '/', '。。。');

-- ----------------------------
-- Table structure for t_permission
-- ----------------------------
DROP TABLE IF EXISTS `t_permission`;
CREATE TABLE `t_permission` (
  `permission_id` int(32) NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_permission
-- ----------------------------
INSERT INTO `t_permission` VALUES ('1', 'user:add', null, null);

-- ----------------------------
-- Table structure for t_product
-- ----------------------------
DROP TABLE IF EXISTS `t_product`;
CREATE TABLE `t_product` (
  `product_id` int(16) NOT NULL AUTO_INCREMENT,
  `name` varchar(254) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `release_version` varchar(254) DEFAULT NULL,
  `release_date` date DEFAULT NULL,
  `product_mgr` varchar(32) DEFAULT NULL,
  `test_mgr` varchar(32) DEFAULT NULL,
  `dev_mgr` varchar(32) DEFAULT NULL,
  `intruduction` text,
  `parent_id` int(11) DEFAULT NULL,
  `parent_name` varchar(64) DEFAULT NULL,
  `inner_version` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_product
-- ----------------------------
INSERT INTO `t_product` VALUES ('3', '保密局一体化认证设备', 'COMBINE', '2.0.16', '2015-01-01', '索瑞军', '冯彩英', '朱虹宇', '<p>\r\n	保密局一体化认证设备，网关，磐石\r\n</p>\r\n<p>\r\n	客户端\r\n</p>', '0', null, null);
INSERT INTO `t_product` VALUES ('4', 'IOS版本MCTK', 'IMCTK', '2.0.1', '2015-01-01', '李志伟', '边贸强', '张海龙', '移动化失常份额<br />', '25', null, null);
INSERT INTO `t_product` VALUES ('5', 'Android版本MCTK', 'AMCTK', '2.0.1', '2015-01-01', '谢娜', '李玖', '章节', '开源失常占用', '25', null, null);
INSERT INTO `t_product` VALUES ('13', '身份认证网关E系列', 'phoenix', '3.0.34.8', '2017-06-25', '索瑞军', '冯彩英', '王毅', '公司最新PKI产品。', '0', null, null);
INSERT INTO `t_product` VALUES ('16', '网关客户端', 'ECLIENT', '3.0.33.120', '2015-01-01', '索瑞军', '冯彩英', '王毅', 'windows身份认证网关客户端。', '13', null, null);
INSERT INTO `t_product` VALUES ('17', '磐石安全产品', 'STONE', '10.3.65', '2015-01-01', '索瑞军', '冯彩英', '王毅', '磐石安全产品', '0', null, null);
INSERT INTO `t_product` VALUES ('18', 'apache代理模块', '', '3.0.34', null, '', '', '', 'æ&nbsp;¸å¿å¥å£æ¨¡åï¼ç«¯å£443', '16', 'Eç³»åèº«ä»½è®¤è¯ç½å³å®¢æ·ç«¯', '3.0.34.9');
INSERT INTO `t_product` VALUES ('19', 'socks5正向代理模块', '', '2.0.6', null, '', '', '', 'æ&nbsp;¸å¿å¥å£æ¨¡åï¼ç«¯å£80', '13', 'èº«ä»½è®¤è¯ç½å³Eç³»å', '20.6');
INSERT INTO `t_product` VALUES ('21', 'Nginx代理模块', null, '2.0', null, null, null, null, 'Nginx代理模块', '13', '身份认证网关E系列', '2.1');
INSERT INTO `t_product` VALUES ('22', 'RSA算法实现', null, '0.2.1', null, null, null, null, '标准RSA算法功能模块', '21', 'Nginx代理模块', '0.2.2');
INSERT INTO `t_product` VALUES ('23', 'gateway服务', null, '3.0.33.6', null, null, null, null, 'gateway服务，java实现，集成调度。', '13', '身份认证网关E系列', '3.0.34.9');
INSERT INTO `t_product` VALUES ('24', 'windows客户端', null, '3.0.0', null, null, null, null, 'SM2算法升级', '17', '磐石安全产品', '3.0.1');
INSERT INTO `t_product` VALUES ('25', '密码运算控件', 'MCTK_S', '1.121.2', '2015-01-01', '王强', '关鹏', '陈哲', '', '0', null, null);
INSERT INTO `t_product` VALUES ('27', '身份认证网关I系列', 'cinas', '24.7beta1', '2015-01-01', '杨红英', '马亚辉', '刘飞宇', '旁路网关', '0', null, null);
INSERT INTO `t_product` VALUES ('28', '签名服务器', 'SIGN', '3.0.21.4', '2015-01-01', '刘飞宇', '韩雪梅', '徐龙', 'PKI产品', '0', null, null);
INSERT INTO `t_product` VALUES ('31', '全部产品', 'root', '0.1.1', '2017-06-26', 'Tomcat', 'Jetty', 'Jetty', 'Jetty', '-1', null, null);

-- ----------------------------
-- Table structure for t_project
-- ----------------------------
DROP TABLE IF EXISTS `t_project`;
CREATE TABLE `t_project` (
  `prj_id` int(32) NOT NULL AUTO_INCREMENT,
  `prj_name` varchar(64) NOT NULL,
  `industry` varchar(50) DEFAULT NULL,
  `project_type` varchar(255) DEFAULT NULL,
  `product_id` varchar(255) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `product_version` varchar(128) DEFAULT NULL,
  `issue_type` varchar(50) DEFAULT NULL,
  `describtion` varchar(4096) DEFAULT NULL,
  `submit_date` datetime DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `engineer` varchar(50) DEFAULT NULL,
  `engineer_tel` varchar(50) DEFAULT NULL,
  `finish_date` datetime DEFAULT NULL,
  `labor_costs` float DEFAULT NULL,
  `reporter` varchar(50) DEFAULT NULL,
  `contact` varchar(50) DEFAULT NULL,
  `process` varchar(4096) DEFAULT NULL,
  `improvement` varchar(2048) DEFAULT NULL,
  `comments` varchar(4096) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `version` int(32) DEFAULT NULL,
  `operator_ip` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`prj_id`),
  KEY `prj_name` (`prj_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1713 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_project
-- ----------------------------
INSERT INTO `t_project` VALUES ('1708', '河南财政多CA体系共存项目', '财政', '售前需求开发', '0', null, '3.0.25.1', '网关_服务器', '河南财政多CA体系共存项目.', '2017-08-19 00:00:00', '进行中', '何金龙', null, '2017-08-19 00:00:00', '0', '刘渊', '13590870989', '河南财政多CA体系共存项目.\r\n技术预研.', '无', 'NO', null, '2017-08-19 12:46:23', null, null);
INSERT INTO `t_project` VALUES ('1709', '四川公安多CA体系共存项目', '公安', '科研项目', '0', null, '3.0.25.1', '网关_客户端', '四川公安多CA体系共存项目', '2017-08-19 00:00:00', '已完成', '刘志钢', null, '2017-08-03 00:00:00', '9', '刘渊', '13590870989', '四川公安多CA体系共存项目', '无', 'NO', null, '2017-08-19 00:00:00', null, null);
INSERT INTO `t_project` VALUES ('1710', '甘肃公安I网关集群扩容', '公安', '售后技术支持', '0', null, '3.0.32.12', '网关_服务器', '甘肃公安I网关集群扩容，I、E网关共存。', '2017-08-18 00:00:00', '进行中', '代艳明', null, null, '3', '高军波', '13632124589', '甘肃公安I网关集群扩容，I、E网关共存。\r\n2017-08-22 15:12:16\r\n提供最新版本3.0.34.10升级包，满足测试要求。', '', '', null, '2017-08-22 15:14:43', null, null);
INSERT INTO `t_project` VALUES ('1711', '航天科工三院301所网关采购项目', '军工', '售后技术支持', '0', null, '3.0.32.10', '网关_服务器', '网关服务器从26.9升级为版本28.5，服务器端业务日志中无记录用户使用记录.', '2017-08-18 00:00:00', '已完成', '代艳明', null, '2017-08-22 00:00:00', '0.2', '林章水', '13632124589', '1、在项目管理平台中搜索历史记录，3.0.27X版本问题是因为数据库字段过短，发现通过shell有解决办法。\r\n2、shell提供给工程验证。', '无', '无', '2017-08-16 10:13:25', '2017-08-23 10:58:23', null, null);
INSERT INTO `t_project` VALUES ('1712', '江苏淮安辅警项目', '公安', '售后技术支持', '0', null, '3.0.32.10', '网关_旁路_Agent', '认证时提示404，找不到error.jsp', '2017-08-24 00:00:00', '进行中', '代艳明', null, '2017-08-22 00:00:00', '0.2', '王艺', '13632124589', '校正网关时间。', '无', '无', null, '2017-08-24 00:00:00', null, null);

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `role_id` int(32) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES ('1', 'admin', 'admin', 'kkk', '2017-02-12 16:48:48', '2017-02-16 16:48:56');

-- ----------------------------
-- Table structure for t_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `t_role_permission`;
CREATE TABLE `t_role_permission` (
  `id` int(32) NOT NULL DEFAULT '0',
  `permission_id` int(32) DEFAULT NULL,
  `role_id` int(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role_permission
-- ----------------------------
INSERT INTO `t_role_permission` VALUES ('0', '1', '1');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `passwd` varchar(255) DEFAULT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `locked` int(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `real_name` varchar(32) DEFAULT NULL,
  `org_id` int(11) DEFAULT NULL,
  `org_name` varchar(255) DEFAULT NULL,
  `version` int(32) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', 'admin', '3ba6b0567d04bd9ac0679ca9a3ea026b09608a63c58df426d40c78d1ad268bd4', '001', '0', '2017-06-24 21:08:49', '2017-06-24 21:08:57', '系统管理员', '4', null, null);
INSERT INTO `t_user` VALUES ('2', 'yanming_dai', '3ba6b0567d04bd9ac0679ca9a3ea026b09608a63c58df426d40c78d1ad268bd4', '001', '0', '2017-06-24 21:08:36', '2017-06-24 21:08:54', '代艳明', '4', null, null);
INSERT INTO `t_user` VALUES ('3', 'ruiwen_yang', 'ba1514ca5c56dee64e4aa399c97a2983dbe6f171272482b0a965e1f5c47fc116', 'f9190b5074244f39be80be02432a3c17', '0', '2017-06-30 11:05:01', '2017-06-30 11:05:01', '杨瑞文', '4', '', null);
INSERT INTO `t_user` VALUES ('4', 'weichang_ding', '809448c66edb48db7aa6c8e351c0e40698b794fe20ae6459e03797f817b73b08', '4365950c5df54d759b8352fd1087aafd', '0', '2017-06-30 11:09:12', '2017-06-30 11:09:12', '丁为厂', '4', '', null);
INSERT INTO `t_user` VALUES ('5', 'zhiwei_shi', '435216985b99cd2efb676ec0f26d059c7431567c47e3d9c45b4aa3f833c40274', '1331d205d9704156b700a333423060f8', '0', '2017-06-30 11:10:42', '2017-06-30 11:10:42', '史志伟', '4', 'IPC产品部', null);
INSERT INTO `t_user` VALUES ('6', 'wenlong_guo', '3d8ba528e0a2f37e05285c3051f53a2b14d3d9378874abbdf78392dc97095516', 'aab11c2fce634e4d8f626273e0ae2689', '0', '2017-06-30 12:37:14', '2017-06-30 12:37:14', '郭文龙', '5', '签名产品部', null);
INSERT INTO `t_user` VALUES ('7', 'zhigang_liu', '1c0a3536949483197924635256ce5a2c31e8709358173e5f4c6301f099ba89d2', '362bd19fe8ef425bb16dae3d4a4e8e67', '0', '2017-06-30 12:44:37', '2017-06-30 12:44:37', '刘志钢', '4', 'IPC产品部', null);
INSERT INTO `t_user` VALUES ('8', 'pengzhao_qiao', '53addcfc7a70923a30c77ff7642c62a736226ae80ff182ec5bbeb606aba67d0e', '2d21c0e411e94b62907340411dcf2ad0', '0', '2017-06-30 12:45:42', '2017-06-30 12:45:42', '乔鹏兆', '4', 'IPC产品部', null);
INSERT INTO `t_user` VALUES ('9', 'shiyu_xing', '3e0f26e3738f329800c528d62137468ca5bcf3bbafe301c53178b6ca3ce3d4f7', 'f28cd1aad7a949a1b7781d60921adb77', '0', '2017-06-30 12:46:18', '2017-06-30 12:46:18', '邢世宇', '4', 'IPC产品部', null);
INSERT INTO `t_user` VALUES ('10', 'kai_yu', '5f21e30dbd0a0391069e2f3168c7d298e858c7c12be95ccc0dd7d8eb766e6bd5', '6b52fdb8c74740fcb126126df11d6fee', '0', '2017-06-30 12:46:40', '2017-06-30 12:46:40', '于凯', '4', 'IPC产品部', null);
INSERT INTO `t_user` VALUES ('11', 'junjie_du', 'eea4f988023ecec73403e97d826b4a4c5ab0138827449cee83566a0857782ae0', '0fc02df0822d45fcb57eedce0c70c74b', '0', '2017-06-30 12:47:03', '2017-06-30 12:47:03', '杜俊杰', '4', 'IPC产品部', null);
INSERT INTO `t_user` VALUES ('12', 'lirong_ding', 'df53e1abc291fa4de4a286696b531fbada4bb2dd6f4fa32a58fc2e6e5e9c4fd5', '0b144e2db2f041e0a8d854bc94d322d2', '0', '2017-06-30 12:54:52', '2017-06-30 12:54:52', '丁利荣', '4', 'IPC产品部', null);
INSERT INTO `t_user` VALUES ('13', 'hongyi_li', 'c75bded13dce29d86b809f47d84ea2a101359ddb727396deb7148c682dbb397c', '306632480d8c4effbcc144928cc5f4e4', '0', '2017-06-30 12:55:22', '2017-06-30 12:55:22', '李红义', '4', 'IPC产品部', null);
INSERT INTO `t_user` VALUES ('14', 'jingbing_zhang', '26df006f82149e9e0f5a4c3b5a7e45bcaf895d0d2478a1a298dc089d34fa13a5', 'a54becda5e1a4f1dac5a3b1522f2eb79', '0', '2017-06-30 12:55:53', '2017-06-30 12:55:53', '张敬兵', '4', 'IPC产品部', null);
INSERT INTO `t_user` VALUES ('15', 'chengyi_huo', '48179466354615ec0ee15c76073ce3a1bee0f1dc7dac91ff099743f865f3d5d5', '0681c091eda04a05a59f74151567f490', '0', '2017-06-30 13:01:19', '2017-06-30 13:01:19', '霍成义', '4', 'IPC产品部', null);
INSERT INTO `t_user` VALUES ('16', 'hongyu_zhu', '5a97671b4023bc6a2bfe78ad5e3523c617e63cc86c9e410132da25cf763bdd37', '6a50f9e5b6094c8c8c9360f86edd02f0', '0', '2017-06-30 13:01:48', '2017-06-30 13:01:48', '朱虹宇', '4', 'IPC产品部', null);
INSERT INTO `t_user` VALUES ('17', 'zhe_cong', 'ae071ebedb1078fad19d0ac4664215d6b9712ff0f009092017fcf40047c7e942', '355dacc54d66440ab4d5133837a20b24', '0', '2017-06-30 13:02:09', '2017-06-30 13:02:09', '丛哲', '4', 'IPC产品部', null);
INSERT INTO `t_user` VALUES ('18', 'wei_wu', '062cf1d548daa22904cc9d5963cc2c3ec6d42f2350ff7e71fd66997c5fed42ae', '28404af7dad44d59b4d3f894928fb8f8', '0', '2017-06-30 13:02:28', '2017-06-30 13:02:28', '吴畏', '4', 'IPC产品部', null);
INSERT INTO `t_user` VALUES ('19', 'chuangchuang_hu', '2cded99c073952cfe246f58bdb516b1f324c6b43c3239b7c2d3fe7307ee02b05', '5d81dbba9cf34a64b1b0d5f701b7e99d', '0', '2017-06-30 13:02:49', '2017-06-30 13:02:49', '胡闯闯', '4', 'IPC产品部', null);
INSERT INTO `t_user` VALUES ('20', 'jinlong_he', '10976fc228aadaeb2676743e22c229835a73fe1a7723607a5ed243261ccc964d', 'aaa564833a9c43e9aefe5ae6c9f48c58', '0', '2017-06-30 13:03:27', '2017-06-30 13:03:27', '何金龙', '4', 'IPC产品部', null);
INSERT INTO `t_user` VALUES ('21', 'jiewen_zhang', '31b86fd37393e7fc4bcf177ceda68c6afd6677fbcca69de501a6b7e6123a2431', 'f22bd2a597ef41938b86cd16d9310cff', '0', '2017-06-30 13:03:47', '2017-06-30 13:03:47', '张杰文', '4', 'IPC产品部', null);
INSERT INTO `t_user` VALUES ('32', 'ruijun_suo', 'a2d43dd58938aeae5ca25b3a57351f9d6ff18a7439d04dedd729c0aa37fdbf4e', 'df3d9e2b11a64fc589d81e6cfda074f3', '0', '2017-08-25 00:00:00', '2017-08-25 00:00:00', '索瑞军', '4', 'IPC产品部', null);

-- ----------------------------
-- Table structure for t_user_permission
-- ----------------------------
DROP TABLE IF EXISTS `t_user_permission`;
CREATE TABLE `t_user_permission` (
  `permission_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user_permission
-- ----------------------------
INSERT INTO `t_user_permission` VALUES ('1', '2');

-- ----------------------------
-- Table structure for t_user_profile
-- ----------------------------
DROP TABLE IF EXISTS `t_user_profile`;
CREATE TABLE `t_user_profile` (
  `uid` int(32) NOT NULL DEFAULT '0',
  `nickname` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `email_checked` tinyint(1) DEFAULT NULL,
  `avatar` mediumblob,
  `gender` varchar(50) DEFAULT NULL,
  `dt` varchar(50) DEFAULT NULL,
  `loc` varchar(50) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user_profile
-- ----------------------------

-- ----------------------------
-- Table structure for t_user_role
-- ----------------------------
DROP TABLE IF EXISTS `t_user_role`;
CREATE TABLE `t_user_role` (
  `id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user_role
-- ----------------------------
INSERT INTO `t_user_role` VALUES (null, '1', '1');

-- ----------------------------
-- Table structure for t_version
-- ----------------------------
DROP TABLE IF EXISTS `t_version`;
CREATE TABLE `t_version` (
  `version_id` int(11) NOT NULL,
  `version` varchar(16) DEFAULT NULL,
  `alias` varchar(32) DEFAULT NULL,
  `product` varchar(32) DEFAULT NULL,
  `parent_version` varchar(32) DEFAULT NULL,
  `publish_date` date DEFAULT NULL,
  `type` varchar(16) DEFAULT NULL,
  `is_leaf` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`version_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_version
-- ----------------------------

-- ----------------------------
-- View structure for v_daily_list
-- ----------------------------
DROP VIEW IF EXISTS `v_daily_list`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER  VIEW `v_daily_list` AS SELECT
	dly.daily_id,
	dly.create_date AS report_date,
	dly.owner_name AS reporter,
	itm.mission_name,
	itm.hours,
	itm.percentage,
	itm.progress_detail,
	itm.problerm,
	msn.plan_start AS plan_start,
	msn.start_date AS start_date,
	msn.plan_end AS plan_end,
	msn.end_date AS end_date,
	msn.state AS state
FROM
	t_daily_item itm
JOIN t_daily dly ON itm.daily_id = dly.daily_id
LEFT JOIN v_mission msn ON itm.mission_id = msn.mission_id ;

-- ----------------------------
-- View structure for v_labor_count
-- ----------------------------
DROP VIEW IF EXISTS `v_labor_count`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER  VIEW `v_labor_count` AS SELECT
	`p`.`prj_name` AS `work_name`,
	`p`.`industry` AS `industry`,
	`p`.`issue_type` AS `module`,
	`p`.`project_type` AS `work_type`,
	`p`.`describtion` AS `work_content`,
	`p`.`reporter` AS `manager`,
	`p`.`engineer` AS `engineer`,
	`p`.`status` AS `state`,
	`p`.`process` AS `process`,
	`p`.`labor_costs` AS `hours`,
	`p`.`finish_date` AS `finish_date`,
	`p`.`update_time` AS `update_time`,
	`p`.`product_name` AS `product`,
	'-' AS `baseVersion`,
	'-' AS `publishVersion`,
	'-' AS `function`,
	'-' AS `planStartDate`,
	`p`.`submit_date` AS `startDate`,
	'-' AS `planEndDate`,
	`p`.`finish_date` AS `endDate`,
	'-' AS `arrangedInvestment`,
	`p`.`labor_costs` AS `labor_costs`,
	sum(`itm`.`hours`) AS `investment`
FROM
	(
		`t_project` `p`
		LEFT JOIN `t_daily_item` `itm` ON (
			(
				(
					`p`.`prj_id` = `itm`.`mission_id`
				)
				AND (
					`p`.`prj_name` = `itm`.`mission_name`
				)
			)
		)
	)
GROUP BY
	`p`.`prj_name`
UNION
	SELECT
		`m`.`mission_name` AS `work_name`,
		`m`.`industry_name` AS `industry`,
		`m`.`module` AS `module`,
		`m`.`type` AS `work_type`,
		`m`.`content` AS `work_content`,
		`m`.`project_manager` AS `manager`,
		`m`.`assign_to` AS `engineer`,
		`m`.`status` AS `state`,
		`m`.`progress_detail` AS `process`,
		`m`.`total_hours` AS `hours`,
		`m`.`end_date` AS `finish_date`,
		`m`.`update_time` AS `update_time`,
		`m`.`product_name` AS `product`,
		'-' AS `baseVersion`,
		'-' AS `publishVersion`,
		'-' AS `function`,
		'-' AS `planStartDate`,
		`m`.`start_date` AS `startDate`,
		'-' AS `planEndDate`,
		`m`.`end_date` AS `endDate`,
		'-' AS `arrangedInvestment`,
		`m`.`total_hours` AS `total_hours`,
		sum(`itm`.`hours`) AS `investment`
	FROM
		(
			`t_mission` `m`
			LEFT JOIN `t_daily_item` `itm` ON (
				(
					(
						`m`.`mission_id` = `itm`.`mission_id`
					)
					AND (
						`m`.`mission_name` = `itm`.`mission_name`
					)
				)
			)
		)
	GROUP BY
		`m`.`mission_name` ;

-- ----------------------------
-- View structure for v_mission
-- ----------------------------
DROP VIEW IF EXISTS `v_mission`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER  VIEW `v_mission` AS SELECT
	p.prj_id AS mission_id,
	p.prj_name AS mission_name,
	p.create_time AS plan_start,
	p.create_time AS start_date,
	'' AS plan_end,
	p.finish_date AS end_date,
	p.`status` AS state,
	p.industry AS industry,
	p.project_type AS mission_type
FROM
	t_project p
UNION
	SELECT
		m.mission_id AS mission_id,
		m.mission_name AS mission_name,
		m.plan_start AS plan_start,
		m.start_date AS start_date,
		m.plan_end AS plan_end,
		m.end_date AS end_date,
		m.`status` AS state,
		m.industry_name AS industry,
		m.type AS mission_type
	FROM
		t_mission m
	UNION
		SELECT
			bg.BG_BUG_ID AS mission_id,
			bg.BG_SUMMARY AS mission_name,
			bg.BG_DETECTION_DATE AS plan_start,
			bg.BG_DETECTION_DATE AS start_date,
			'' AS plan_end,
			'' AS end_date,
			'' AS industry,
			'进行中' AS state,
			'持续改进' AS mission_type
		FROM
			t_bug bg ;

-- ----------------------------
-- View structure for v_mission_detail
-- ----------------------------
DROP VIEW IF EXISTS `v_mission_detail`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER  VIEW `v_mission_detail` AS /*任务详情：用于部门周统计报表，包括任务类型、行业、工作时间*/
SELECT
	msn.mission_type,
	msn.industry,
	msn.mission_name,
	itm.hours,
	dly.create_date
FROM
	v_mission msn
LEFT JOIN t_daily_item itm ON msn.mission_id = itm.mission_id
LEFT JOIN t_daily dly ON itm.daily_id = dly.daily_id ;

-- ----------------------------
-- View structure for v_product_tree
-- ----------------------------
DROP VIEW IF EXISTS `v_product_tree`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER  VIEW `v_product_tree` AS SELECT
	`t_product`.`product_id` AS `tree_id`,
	`t_product`.`name` AS `name`,
	`t_product`.`parent_id` AS `parent_id`,
	`t_product`.`parent_name` AS `parent_name`
FROM
	`t_product`
UNION ALL
	SELECT
		`t_version`.`version_id` AS `tree_id`,
		`t_version`.`version` AS `version`,
		`t_version`.`product` AS `product`,
		`t_version`.`parent_version` AS `parent_version`
	FROM
		`t_version` ;
DROP TRIGGER IF EXISTS `tgr_mission_udtt`;
DELIMITER ;;
CREATE TRIGGER `tgr_mission_udtt` AFTER INSERT ON `t_daily_item` FOR EACH ROW begin

	update t_project set update_time = now() where prj_id = new.mission_id and prj_name=new.mission_name;
	update t_mission set update_time = now() where mission_id = new.mission_id and mission_name=new.mission_name;

end
;;
DELIMITER ;
