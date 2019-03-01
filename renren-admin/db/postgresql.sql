-- 菜单
CREATE TABLE sys_menu (
  menu_id bigserial,
  parent_id int8,
  name varchar(50),
  url varchar(200),
  perms varchar(500),
  type int,
  icon varchar(50),
  order_num int,
  PRIMARY KEY (menu_id)
);

-- 部门
CREATE TABLE sys_dept (
  dept_id bigserial,
  parent_id int8,
  name varchar(50),
  order_num int,
  del_flag int DEFAULT 0,
  PRIMARY KEY (dept_id)
);

-- 系统用户
CREATE TABLE sys_user (
  user_id bigserial,
  username varchar(50) NOT NULL,
  password varchar(100),
  salt varchar(20),
  email varchar(100),
  mobile varchar(100),
  status int,
  dept_id int8,
  create_time timestamp,
  PRIMARY KEY (user_id),
  UNIQUE (username)
);

-- 角色
CREATE TABLE sys_role (
  role_id bigserial,
  role_name varchar(100),
  remark varchar(100),
  dept_id int8,
  create_time timestamp,
  PRIMARY KEY (role_id)
);

-- 用户与角色对应关系
CREATE TABLE sys_user_role (
  id bigserial,
  user_id int8,
  role_id int8,
  PRIMARY KEY (id)
);

-- 角色与菜单对应关系
CREATE TABLE sys_role_menu (
  id bigserial,
  role_id int8,
  menu_id int8,
  PRIMARY KEY (id)
);

-- 角色与部门对应关系
CREATE TABLE sys_role_dept (
  id bigserial,
  role_id int8,
  dept_id int8,
  PRIMARY KEY (id)
);

-- 系统配置信息
CREATE TABLE sys_config (
  id bigserial,
  param_key varchar(50),
  param_value varchar(2000),
  status int DEFAULT 1,
  remark varchar(500),
  PRIMARY KEY (id),
  UNIQUE (param_key)
);

-- 数据字典
CREATE TABLE sys_dict (
  id bigserial,
  name varchar(100) NOT NULL,
  type varchar(100) NOT NULL,
  code varchar(100) NOT NULL,
  value varchar(1000) NOT NULL,
  order_num int DEFAULT 0,
  remark varchar(255),
  del_flag int DEFAULT 0,
  PRIMARY KEY (id),
  UNIQUE (type,code)
);

-- 系统日志
CREATE TABLE sys_log (
  id bigserial,
  username varchar(50),
  operation varchar(50),
  method varchar(200),
  params varchar(5000),
  time int8 NOT NULL,
  ip varchar(64),
  create_date timestamp,
  PRIMARY KEY (id)
);

-- 文件上传
CREATE TABLE sys_oss (
  id bigserial,
  url varchar(200),
  create_date timestamp,
  PRIMARY KEY (id)
);

-- 定时任务
CREATE TABLE schedule_job (
  job_id bigserial,
  bean_name varchar(200),
  params varchar(2000),
  cron_expression varchar(100),
  status int,
  remark varchar(255),
  create_time timestamp,
  PRIMARY KEY (job_id)
);

-- 定时任务日志
CREATE TABLE schedule_job_log (
  log_id bigserial,
  job_id int8 NOT NULL,
  bean_name varchar(200),
  params varchar(2000),
  status int NOT NULL,
  error varchar(2000),
  times int NOT NULL,
  create_time timestamp,
  PRIMARY KEY (log_id)
);
CREATE INDEX index_job_id on schedule_job_log(job_id);


INSERT INTO sys_user (user_id, username, password, salt, email, mobile, status, dept_id, create_time) VALUES ('1', 'admin', 'e1153123d7d180ceeb820d577ff119876678732a68eef4e6ffc0b1f06a01f91b', 'YzcmCZNvbXocrsz9dm8e', 'root@renren.io', '13612345678', '1', '1', '2016-11-11 11:11:11');
INSERT INTO sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num) VALUES ('1', '0', '系统管理', NULL, NULL, '0', 'fa fa-cog', '0');
INSERT INTO sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num) VALUES ('2', '1', '管理员管理', 'modules/sys/user.html', NULL, '1', 'fa fa-user', '1');
INSERT INTO sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num) VALUES ('3', '1', '角色管理', 'modules/sys/role.html', NULL, '1', 'fa fa-user-secret', '2');
INSERT INTO sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num) VALUES ('4', '1', '菜单管理', 'modules/sys/menu.html', NULL, '1', 'fa fa-th-list', '3');
INSERT INTO sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num) VALUES ('5', '1', 'SQL监控', 'druid/sql.html', NULL, '1', 'fa fa-bug', '4');
INSERT INTO sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num) VALUES ('6', '1', '定时任务', 'modules/job/schedule.html', NULL, '1', 'fa fa-tasks', '5');
INSERT INTO sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num) VALUES ('7', '6', '查看', NULL, 'sys:schedule:list,sys:schedule:info', '2', NULL, '0');
INSERT INTO sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num) VALUES ('8', '6', '新增', NULL, 'sys:schedule:save', '2', NULL, '0');
INSERT INTO sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num) VALUES ('9', '6', '修改', NULL, 'sys:schedule:update', '2', NULL, '0');
INSERT INTO sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num) VALUES ('10', '6', '删除', NULL, 'sys:schedule:delete', '2', NULL, '0');
INSERT INTO sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num) VALUES ('11', '6', '暂停', NULL, 'sys:schedule:pause', '2', NULL, '0');
INSERT INTO sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num) VALUES ('12', '6', '恢复', NULL, 'sys:schedule:resume', '2', NULL, '0');
INSERT INTO sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num) VALUES ('13', '6', '立即执行', NULL, 'sys:schedule:run', '2', NULL, '0');
INSERT INTO sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num) VALUES ('14', '6', '日志列表', NULL, 'sys:schedule:log', '2', NULL, '0');
INSERT INTO sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num) VALUES ('15', '2', '查看', NULL, 'sys:user:list,sys:user:info', '2', NULL, '0');
INSERT INTO sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num) VALUES ('16', '2', '新增', NULL, 'sys:user:save,sys:role:select', '2', NULL, '0');
INSERT INTO sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num) VALUES ('17', '2', '修改', NULL, 'sys:user:update,sys:role:select', '2', NULL, '0');
INSERT INTO sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num) VALUES ('18', '2', '删除', NULL, 'sys:user:delete', '2', NULL, '0');
INSERT INTO sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num) VALUES ('19', '3', '查看', NULL, 'sys:role:list,sys:role:info', '2', NULL, '0');
INSERT INTO sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num) VALUES ('20', '3', '新增', NULL, 'sys:role:save,sys:menu:perms', '2', NULL, '0');
INSERT INTO sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num) VALUES ('21', '3', '修改', NULL, 'sys:role:update,sys:menu:perms', '2', NULL, '0');
INSERT INTO sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num) VALUES ('22', '3', '删除', NULL, 'sys:role:delete', '2', NULL, '0');
INSERT INTO sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num) VALUES ('23', '4', '查看', NULL, 'sys:menu:list,sys:menu:info', '2', NULL, '0');
INSERT INTO sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num) VALUES ('24', '4', '新增', NULL, 'sys:menu:save,sys:menu:select', '2', NULL, '0');
INSERT INTO sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num) VALUES ('25', '4', '修改', NULL, 'sys:menu:update,sys:menu:select', '2', NULL, '0');
INSERT INTO sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num) VALUES ('26', '4', '删除', NULL, 'sys:menu:delete', '2', NULL, '0');
INSERT INTO sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num) VALUES ('27', '1', '参数管理', 'modules/sys/config.html', 'sys:config:list,sys:config:info,sys:config:save,sys:config:update,sys:config:delete', '1', 'fa fa-sun-o', '6');
INSERT INTO sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num) VALUES ('29', '1', '系统日志', 'modules/sys/log.html', 'sys:log:list', '1', 'fa fa-file-text-o', '7');
INSERT INTO sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num) VALUES ('30', '1', '文件上传', 'modules/oss/oss.html', 'sys:oss:all', '1', 'fa fa-file-image-o', '6');
INSERT INTO sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num) VALUES ('31', '1', '部门管理', 'modules/sys/dept.html', NULL, '1', 'fa fa-file-code-o', '1');
INSERT INTO sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num) VALUES ('32', '31', '查看', NULL, 'sys:dept:list,sys:dept:info', '2', NULL, '0');
INSERT INTO sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num) VALUES ('33', '31', '新增', NULL, 'sys:dept:save,sys:dept:select', '2', NULL, '0');
INSERT INTO sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num) VALUES ('34', '31', '修改', NULL, 'sys:dept:update,sys:dept:select', '2', NULL, '0');
INSERT INTO sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num) VALUES ('35', '31', '删除', NULL, 'sys:dept:delete', '2', NULL, '0');
INSERT INTO sys_menu(menu_id, parent_id, name, url, perms, type, icon, order_num) VALUES (36, 1, '字典管理', 'modules/sys/dict.html', NULL, 1, 'fa fa-bookmark-o', 6);
INSERT INTO sys_menu(menu_id, parent_id, name, url, perms, type, icon, order_num) VALUES (37, 36, '查看', NULL, 'sys:dict:list,sys:dict:info', 2, NULL, 6);
INSERT INTO sys_menu(menu_id, parent_id, name, url, perms, type, icon, order_num) VALUES (38, 36, '新增', NULL, 'sys:dict:save', 2, NULL, 6);
INSERT INTO sys_menu(menu_id, parent_id, name, url, perms, type, icon, order_num) VALUES (39, 36, '修改', NULL, 'sys:dict:update', 2, NULL, 6);
INSERT INTO sys_menu(menu_id, parent_id, name, url, perms, type, icon, order_num) VALUES (40, 36, '删除', NULL, 'sys:dict:delete', 2, NULL, 6);


INSERT INTO sys_dept (dept_id, parent_id, name, order_num, del_flag) VALUES ('1', '0', '人人开源集团', '0', '0');
INSERT INTO sys_dept (dept_id, parent_id, name, order_num, del_flag) VALUES ('2', '1', '长沙分公司', '1', '0');
INSERT INTO sys_dept (dept_id, parent_id, name, order_num, del_flag) VALUES ('3', '1', '上海分公司', '2', '0');
INSERT INTO sys_dept (dept_id, parent_id, name, order_num, del_flag) VALUES ('4', '3', '技术部', '0', '0');
INSERT INTO sys_dept (dept_id, parent_id, name, order_num, del_flag) VALUES ('5', '3', '销售部', '1', '0');

INSERT INTO sys_dict(id, name, type, code, value, order_num, remark, del_flag) VALUES (1, '性别', 'sex', '0', '女', 0, NULL, 0);
INSERT INTO sys_dict(id, name, type, code, value, order_num, remark, del_flag) VALUES (2, '性别', 'sex', '1', '男', 1, NULL, 0);
INSERT INTO sys_dict(id, name, type, code, value, order_num, remark, del_flag) VALUES (3, '性别', 'sex', '2', '未知', 3, NULL, 0);

INSERT INTO sys_config (param_key, param_value, status, remark) VALUES ('CLOUD_STORAGE_CONFIG_KEY',  '{"aliyunAccessKeyId":"","aliyunAccessKeySecret":"","aliyunBucketName":"","aliyunDomain":"","aliyunEndPoint":"","aliyunPrefix":"","qcloudBucketName":"","qcloudDomain":"","qcloudPrefix":"","qcloudSecretId":"","qcloudSecretKey":"","qiniuAccessKey":"NrgMfABZxWLo5B-YYSjoE8-AZ1EISdi1Z3ubLOeZ","qiniuBucketName":"ios-app","qiniuDomain":"http://7xlij2.com1.z0.glb.clouddn.com","qiniuPrefix":"upload","qiniuSecretKey":"uIwJHevMRWU0VLxFvgy0tAcOdGqasdtVlJkdy6vV","type":1}', '0', '云存储配置信息');

INSERT INTO schedule_job (bean_name, params, cron_expression, status, remark, create_time) VALUES ('testTask',  'renren', '0 0/30 * * * ?', '0', '参数测试', '2016-12-01 23:16:46');


alter sequence sys_menu_menu_id_seq restart with 41;
alter sequence sys_dept_dept_id_seq restart with 6;
alter sequence sys_dict_id_seq restart with 4;
alter sequence sys_user_user_id_seq restart with 2;


--  quartz自带表结构
CREATE TABLE qrtz_job_details
(
  SCHED_NAME VARCHAR(120) NOT NULL,
  JOB_NAME  VARCHAR(200) NOT NULL,
  JOB_GROUP VARCHAR(200) NOT NULL,
  DESCRIPTION VARCHAR(250) NULL,
  JOB_CLASS_NAME   VARCHAR(250) NOT NULL,
  IS_DURABLE BOOL NOT NULL,
  IS_NONCONCURRENT BOOL NOT NULL,
  IS_UPDATE_DATA BOOL NOT NULL,
  REQUESTS_RECOVERY BOOL NOT NULL,
  JOB_DATA BYTEA NULL,
  PRIMARY KEY (SCHED_NAME,JOB_NAME,JOB_GROUP)
);

CREATE TABLE qrtz_triggers
(
  SCHED_NAME VARCHAR(120) NOT NULL,
  TRIGGER_NAME VARCHAR(200) NOT NULL,
  TRIGGER_GROUP VARCHAR(200) NOT NULL,
  JOB_NAME  VARCHAR(200) NOT NULL,
  JOB_GROUP VARCHAR(200) NOT NULL,
  DESCRIPTION VARCHAR(250) NULL,
  NEXT_FIRE_TIME BIGINT NULL,
  PREV_FIRE_TIME BIGINT NULL,
  PRIORITY INTEGER NULL,
  TRIGGER_STATE VARCHAR(16) NOT NULL,
  TRIGGER_TYPE VARCHAR(8) NOT NULL,
  START_TIME BIGINT NOT NULL,
  END_TIME BIGINT NULL,
  CALENDAR_NAME VARCHAR(200) NULL,
  MISFIRE_INSTR SMALLINT NULL,
  JOB_DATA BYTEA NULL,
  PRIMARY KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP),
  FOREIGN KEY (SCHED_NAME,JOB_NAME,JOB_GROUP)
  REFERENCES QRTZ_JOB_DETAILS(SCHED_NAME,JOB_NAME,JOB_GROUP)
);

CREATE TABLE qrtz_simple_triggers
(
  SCHED_NAME VARCHAR(120) NOT NULL,
  TRIGGER_NAME VARCHAR(200) NOT NULL,
  TRIGGER_GROUP VARCHAR(200) NOT NULL,
  REPEAT_COUNT BIGINT NOT NULL,
  REPEAT_INTERVAL BIGINT NOT NULL,
  TIMES_TRIGGERED BIGINT NOT NULL,
  PRIMARY KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP),
  FOREIGN KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP)
  REFERENCES QRTZ_TRIGGERS(SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP)
);

CREATE TABLE qrtz_cron_triggers
(
  SCHED_NAME VARCHAR(120) NOT NULL,
  TRIGGER_NAME VARCHAR(200) NOT NULL,
  TRIGGER_GROUP VARCHAR(200) NOT NULL,
  CRON_EXPRESSION VARCHAR(120) NOT NULL,
  TIME_ZONE_ID VARCHAR(80),
  PRIMARY KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP),
  FOREIGN KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP)
  REFERENCES QRTZ_TRIGGERS(SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP)
);

CREATE TABLE qrtz_simprop_triggers
(
  SCHED_NAME VARCHAR(120) NOT NULL,
  TRIGGER_NAME VARCHAR(200) NOT NULL,
  TRIGGER_GROUP VARCHAR(200) NOT NULL,
  STR_PROP_1 VARCHAR(512) NULL,
  STR_PROP_2 VARCHAR(512) NULL,
  STR_PROP_3 VARCHAR(512) NULL,
  INT_PROP_1 INT NULL,
  INT_PROP_2 INT NULL,
  LONG_PROP_1 BIGINT NULL,
  LONG_PROP_2 BIGINT NULL,
  DEC_PROP_1 NUMERIC(13,4) NULL,
  DEC_PROP_2 NUMERIC(13,4) NULL,
  BOOL_PROP_1 BOOL NULL,
  BOOL_PROP_2 BOOL NULL,
  PRIMARY KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP),
  FOREIGN KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP)
  REFERENCES QRTZ_TRIGGERS(SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP)
);

CREATE TABLE qrtz_blob_triggers
(
  SCHED_NAME VARCHAR(120) NOT NULL,
  TRIGGER_NAME VARCHAR(200) NOT NULL,
  TRIGGER_GROUP VARCHAR(200) NOT NULL,
  BLOB_DATA BYTEA NULL,
  PRIMARY KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP),
  FOREIGN KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP)
  REFERENCES QRTZ_TRIGGERS(SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP)
);

CREATE TABLE qrtz_calendars
(
  SCHED_NAME VARCHAR(120) NOT NULL,
  CALENDAR_NAME  VARCHAR(200) NOT NULL,
  CALENDAR BYTEA NOT NULL,
  PRIMARY KEY (SCHED_NAME,CALENDAR_NAME)
);


CREATE TABLE qrtz_paused_trigger_grps
(
  SCHED_NAME VARCHAR(120) NOT NULL,
  TRIGGER_GROUP  VARCHAR(200) NOT NULL,
  PRIMARY KEY (SCHED_NAME,TRIGGER_GROUP)
);

CREATE TABLE qrtz_fired_triggers
(
  SCHED_NAME VARCHAR(120) NOT NULL,
  ENTRY_ID VARCHAR(95) NOT NULL,
  TRIGGER_NAME VARCHAR(200) NOT NULL,
  TRIGGER_GROUP VARCHAR(200) NOT NULL,
  INSTANCE_NAME VARCHAR(200) NOT NULL,
  FIRED_TIME BIGINT NOT NULL,
  SCHED_TIME BIGINT NOT NULL,
  PRIORITY INTEGER NOT NULL,
  STATE VARCHAR(16) NOT NULL,
  JOB_NAME VARCHAR(200) NULL,
  JOB_GROUP VARCHAR(200) NULL,
  IS_NONCONCURRENT BOOL NULL,
  REQUESTS_RECOVERY BOOL NULL,
  PRIMARY KEY (SCHED_NAME,ENTRY_ID)
);

CREATE TABLE qrtz_scheduler_state
(
  SCHED_NAME VARCHAR(120) NOT NULL,
  INSTANCE_NAME VARCHAR(200) NOT NULL,
  LAST_CHECKIN_TIME BIGINT NOT NULL,
  CHECKIN_INTERVAL BIGINT NOT NULL,
  PRIMARY KEY (SCHED_NAME,INSTANCE_NAME)
);

CREATE TABLE qrtz_locks
(
  SCHED_NAME VARCHAR(120) NOT NULL,
  LOCK_NAME  VARCHAR(40) NOT NULL,
  PRIMARY KEY (SCHED_NAME,LOCK_NAME)
);

create index idx_qrtz_j_req_recovery on qrtz_job_details(SCHED_NAME,REQUESTS_RECOVERY);
create index idx_qrtz_j_grp on qrtz_job_details(SCHED_NAME,JOB_GROUP);

create index idx_qrtz_t_j on qrtz_triggers(SCHED_NAME,JOB_NAME,JOB_GROUP);
create index idx_qrtz_t_jg on qrtz_triggers(SCHED_NAME,JOB_GROUP);
create index idx_qrtz_t_c on qrtz_triggers(SCHED_NAME,CALENDAR_NAME);
create index idx_qrtz_t_g on qrtz_triggers(SCHED_NAME,TRIGGER_GROUP);
create index idx_qrtz_t_state on qrtz_triggers(SCHED_NAME,TRIGGER_STATE);
create index idx_qrtz_t_n_state on qrtz_triggers(SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP,TRIGGER_STATE);
create index idx_qrtz_t_n_g_state on qrtz_triggers(SCHED_NAME,TRIGGER_GROUP,TRIGGER_STATE);
create index idx_qrtz_t_next_fire_time on qrtz_triggers(SCHED_NAME,NEXT_FIRE_TIME);
create index idx_qrtz_t_nft_st on qrtz_triggers(SCHED_NAME,TRIGGER_STATE,NEXT_FIRE_TIME);
create index idx_qrtz_t_nft_misfire on qrtz_triggers(SCHED_NAME,MISFIRE_INSTR,NEXT_FIRE_TIME);
create index idx_qrtz_t_nft_st_misfire on qrtz_triggers(SCHED_NAME,MISFIRE_INSTR,NEXT_FIRE_TIME,TRIGGER_STATE);
create index idx_qrtz_t_nft_st_misfire_grp on qrtz_triggers(SCHED_NAME,MISFIRE_INSTR,NEXT_FIRE_TIME,TRIGGER_GROUP,TRIGGER_STATE);

create index idx_qrtz_ft_trig_inst_name on qrtz_fired_triggers(SCHED_NAME,INSTANCE_NAME);
create index idx_qrtz_ft_inst_job_req_rcvry on qrtz_fired_triggers(SCHED_NAME,INSTANCE_NAME,REQUESTS_RECOVERY);
create index idx_qrtz_ft_j_g on qrtz_fired_triggers(SCHED_NAME,JOB_NAME,JOB_GROUP);
create index idx_qrtz_ft_jg on qrtz_fired_triggers(SCHED_NAME,JOB_GROUP);
create index idx_qrtz_ft_t_g on qrtz_fired_triggers(SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP);
create index idx_qrtz_ft_tg on qrtz_fired_triggers(SCHED_NAME,TRIGGER_GROUP);


commit;
