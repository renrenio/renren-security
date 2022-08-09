CREATE TABLE sys_user (
  id int8 NOT NULL,
  username varchar(50) NOT NULL,
  password varchar(100),
  real_name varchar(50),
  head_url varchar(200),
  gender  int,
  email varchar(100),
  mobile varchar(100),
  dept_id int8,
  super_admin  int,
  status  int,
  creator int8,
  create_date timestamp,
  updater int8,
  update_date timestamp,
  primary key (id)
);

CREATE UNIQUE INDEX uk_sys_user_username on sys_user(username);
CREATE INDEX idx_sys_user_create_date on sys_user(create_date);

COMMENT ON TABLE sys_user IS '用户管理';
COMMENT ON COLUMN sys_user.id IS 'id';
COMMENT ON COLUMN sys_user.username IS '用户名';
COMMENT ON COLUMN sys_user.password IS '密码';
COMMENT ON COLUMN sys_user.real_name IS '姓名';
COMMENT ON COLUMN sys_user.head_url IS '头像';
COMMENT ON COLUMN sys_user.gender IS '性别   0：男   1：女    2：保密';
COMMENT ON COLUMN sys_user.email IS '邮箱';
COMMENT ON COLUMN sys_user.mobile IS '手机号';
COMMENT ON COLUMN sys_user.dept_id IS '部门ID';
COMMENT ON COLUMN sys_user.super_admin IS '超级管理员   0：否   1：是';
COMMENT ON COLUMN sys_user.status IS '状态  0：停用    1：正常';
COMMENT ON COLUMN sys_user.creator IS '创建者';
COMMENT ON COLUMN sys_user.create_date IS '创建时间';
COMMENT ON COLUMN sys_user.updater IS '更新者';
COMMENT ON COLUMN sys_user.update_date IS '更新时间';


CREATE TABLE sys_dept (
  id int8 NOT NULL,
  pid int8,
  pids varchar(500),
  name varchar(50),
  sort  int,
  creator int8,
  create_date timestamp,
  updater int8,
  update_date timestamp,
  primary key (id)
);
CREATE INDEX idx_sys_dept_pid on sys_dept(pid);
CREATE INDEX idx_sys_dept_idx_sort on sys_dept(sort);

COMMENT ON TABLE sys_dept IS '部门管理';
COMMENT ON COLUMN sys_dept.id IS 'id';
COMMENT ON COLUMN sys_dept.pid IS '上级ID';
COMMENT ON COLUMN sys_dept.pids IS '所有上级ID，用逗号分开';
COMMENT ON COLUMN sys_dept.name IS '部门名称';
COMMENT ON COLUMN sys_dept.sort IS '排序';
COMMENT ON COLUMN sys_dept.creator IS '创建者';
COMMENT ON COLUMN sys_dept.create_date IS '创建时间';
COMMENT ON COLUMN sys_dept.updater IS '更新者';
COMMENT ON COLUMN sys_dept.update_date IS '更新时间';


create table sys_role
(
  id                   int8 NOT NULL,
  name                 varchar(50),
  remark               varchar(100),
  dept_id              int8,
  creator              int8,
  create_date          timestamp,
  updater              int8,
  update_date          timestamp,
  primary key (id)
);

CREATE INDEX idx_sys_role_dept_id on sys_role(dept_id);

COMMENT ON TABLE sys_role IS '角色管理';
COMMENT ON COLUMN sys_role.id IS 'id';
COMMENT ON COLUMN sys_role.name IS '角色名称';
COMMENT ON COLUMN sys_role.remark IS '备注';
COMMENT ON COLUMN sys_role.dept_id IS '部门ID';
COMMENT ON COLUMN sys_role.creator IS '创建者';
COMMENT ON COLUMN sys_role.create_date IS '创建时间';
COMMENT ON COLUMN sys_role.updater IS '更新者';
COMMENT ON COLUMN sys_role.update_date IS '更新时间';


create table sys_menu
(
  id                   int8 NOT NULL,
  pid                  int8,
  name                 varchar(200),
  url                  varchar(200),
  permissions          varchar(500),
  type                 int,
  icon                 varchar(50),
  sort                 int,
  creator              int8,
  create_date          timestamp,
  updater              int8,
  update_date          timestamp,
  primary key (id)
);

CREATE INDEX idx_sys_menu_pid on sys_menu(pid);
CREATE INDEX idx_sys_menu_sort on sys_menu(sort);

COMMENT ON TABLE sys_menu IS '菜单管理';
COMMENT ON COLUMN sys_menu.id IS 'id';
COMMENT ON COLUMN sys_menu.pid IS '上级ID，一级菜单为0';
COMMENT ON COLUMN sys_menu.name IS '名称';
COMMENT ON COLUMN sys_menu.url IS '菜单URL';
COMMENT ON COLUMN sys_menu.permissions IS '授权(多个用逗号分隔，如：sys:user:list,sys:user:save)';
COMMENT ON COLUMN sys_menu.type IS '类型   0：菜单   1：按钮';
COMMENT ON COLUMN sys_menu.icon IS '菜单图标';
COMMENT ON COLUMN sys_menu.sort IS '排序';
COMMENT ON COLUMN sys_menu.creator IS '创建者';
COMMENT ON COLUMN sys_menu.create_date IS '创建时间';
COMMENT ON COLUMN sys_menu.updater IS '更新者';
COMMENT ON COLUMN sys_menu.update_date IS '更新时间';


create table sys_role_user
(
  id                   int8 NOT NULL,
  role_id              int8,
  user_id              int8,
  creator              int8,
  create_date          timestamp,
  primary key (id)
);

CREATE INDEX idx_sys_role_user_role_id on sys_role_user(role_id);
CREATE INDEX idx_sys_role_user_user_id on sys_role_user(user_id);

COMMENT ON TABLE sys_role_user IS '角色用户关系';
COMMENT ON COLUMN sys_role_user.role_id IS '角色ID';
COMMENT ON COLUMN sys_role_user.user_id IS '用户ID';
COMMENT ON COLUMN sys_role_user.creator IS '创建者';
COMMENT ON COLUMN sys_role_user.create_date IS '创建时间';


create table sys_role_menu
(
  id                   int8 NOT NULL,
  role_id              int8,
  menu_id              int8,
  creator              int8,
  create_date          timestamp,
  primary key (id)
);

CREATE INDEX idx_sys_role_menu_role_id on sys_role_menu(role_id);
CREATE INDEX idx_sys_role_menu_menu_id on sys_role_menu(menu_id);

COMMENT ON TABLE sys_role_menu IS '角色菜单关系';
COMMENT ON COLUMN sys_role_menu.role_id IS '角色ID';
COMMENT ON COLUMN sys_role_menu.menu_id IS '菜单ID';
COMMENT ON COLUMN sys_role_menu.creator IS '创建者';
COMMENT ON COLUMN sys_role_menu.create_date IS '创建时间';


create table sys_role_data_scope
(
  id                   int8 NOT NULL,
  role_id              int8,
  dept_id              int8,
  creator              int8,
  create_date          timestamp,
  primary key (id)
);
CREATE INDEX idx_data_scope_role_id on sys_role_data_scope(role_id);

COMMENT ON TABLE sys_role_data_scope IS '角色数据权限';
COMMENT ON COLUMN sys_role_data_scope.role_id IS '角色ID';
COMMENT ON COLUMN sys_role_data_scope.dept_id IS '部门ID';
COMMENT ON COLUMN sys_role_data_scope.creator IS '创建者';
COMMENT ON COLUMN sys_role_data_scope.create_date IS '创建时间';


create table sys_params
(
  id                   int8 NOT NULL,
  param_code           varchar(32),
  param_value          varchar(2000),
  param_type           int DEFAULT 1 NOT NULL,
  remark               varchar(200),
  creator              int8,
  create_date          timestamp,
  updater              int8,
  update_date          timestamp,
  primary key (id)
);
CREATE UNIQUE INDEX uk_sys_params_param_code on sys_params(param_code);
CREATE INDEX idx_sys_params_create_date on sys_params(create_date);

COMMENT ON TABLE sys_params IS '参数管理';
COMMENT ON COLUMN sys_params.param_code IS '参数编码';
COMMENT ON COLUMN sys_params.param_value IS '参数值';
COMMENT ON COLUMN sys_params.param_type IS '类型   0：系统参数   1：非系统参数';
COMMENT ON COLUMN sys_params.remark IS '备注';
COMMENT ON COLUMN sys_params.creator IS '创建者';
COMMENT ON COLUMN sys_params.create_date IS '创建时间';
COMMENT ON COLUMN sys_params.updater IS '更新者';
COMMENT ON COLUMN sys_params.update_date IS '更新时间';


create table sys_dict_type
(
    id                   int8 NOT NULL,
    dict_type            varchar(100),
    dict_name            varchar(255),
    remark               varchar(255),
    sort                 int,
    creator              int8,
    create_date          timestamp,
    updater              int8,
    update_date          timestamp,
    primary key (id)
);
CREATE UNIQUE INDEX uk_sys_dict_type_dict_type on sys_dict_type(dict_type);

COMMENT ON TABLE sys_dict_type IS '字典类型';
COMMENT ON COLUMN sys_dict_type.id IS 'id';
COMMENT ON COLUMN sys_dict_type.dict_type IS '字典类型';
COMMENT ON COLUMN sys_dict_type.dict_name IS '字典名称';
COMMENT ON COLUMN sys_dict_type.remark IS '备注';
COMMENT ON COLUMN sys_dict_type.sort IS '排序';
COMMENT ON COLUMN sys_dict_type.creator IS '创建者';
COMMENT ON COLUMN sys_dict_type.create_date IS '创建时间';
COMMENT ON COLUMN sys_dict_type.updater IS '更新者';
COMMENT ON COLUMN sys_dict_type.update_date IS '更新时间';

create table sys_dict_data
(
    id                   int8 NOT NULL,
    dict_type_id         int8 NOT NULL,
    dict_label           varchar(255),
    dict_value           varchar(255),
    remark               varchar(255),
    sort                 int,
    creator              int8,
    create_date          timestamp,
    updater              int8,
    update_date          timestamp,
    primary key (id)
);
CREATE INDEX idx_sys_dict_data_sort on sys_dict_data(sort);
CREATE UNIQUE INDEX uk_dict_type_value on sys_dict_data(dict_type_id, dict_value);

COMMENT ON TABLE sys_dict_data IS '字典数据';
COMMENT ON COLUMN sys_dict_data.id IS 'id';
COMMENT ON COLUMN sys_dict_data.dict_type_id IS '字典类型ID';
COMMENT ON COLUMN sys_dict_data.dict_label IS '字典标签';
COMMENT ON COLUMN sys_dict_data.dict_value IS '字典值';
COMMENT ON COLUMN sys_dict_data.remark IS '备注';
COMMENT ON COLUMN sys_dict_data.sort IS '排序';
COMMENT ON COLUMN sys_dict_data.creator IS '创建者';
COMMENT ON COLUMN sys_dict_data.create_date IS '创建时间';
COMMENT ON COLUMN sys_dict_data.updater IS '更新者';
COMMENT ON COLUMN sys_dict_data.update_date IS '更新时间';


create table sys_log_login
(
  id                   int8 NOT NULL,
  operation            int,
  status               int,
  user_agent           varchar(500),
  ip                   varchar(32),
  creator_name         varchar(50),
  creator              int8,
  create_date          timestamp,
  primary key (id)
);
CREATE INDEX idx_login_status on sys_log_login(status);
CREATE INDEX idx_login_create_date on sys_log_login(create_date);

COMMENT ON TABLE sys_log_login IS '登录日志';
COMMENT ON COLUMN sys_log_login.id IS 'id';
COMMENT ON COLUMN sys_log_login.operation IS '用户操作   0：用户登录   1：用户退出';
COMMENT ON COLUMN sys_log_login.status IS '状态  0：失败    1：成功    2：账号已锁定';
COMMENT ON COLUMN sys_log_login.user_agent IS '用户代理';
COMMENT ON COLUMN sys_log_login.ip IS '操作IP';
COMMENT ON COLUMN sys_log_login.creator_name IS '用户名';
COMMENT ON COLUMN sys_log_login.creator IS '创建者';
COMMENT ON COLUMN sys_log_login.create_date IS '创建时间';


create table sys_log_operation
(
  id                   int8 NOT NULL,
  operation            varchar(50),
  request_uri          varchar(200),
  request_method       varchar(20),
  request_params       text,
  request_time          int,
  user_agent           varchar(500),
  ip                   varchar(32),
  status                int,
  creator_name         varchar(50),
  creator              int8,
  create_date          timestamp,
  primary key (id)
);
CREATE INDEX idx_operation_create_date on sys_log_operation(create_date);

COMMENT ON TABLE sys_log_operation IS '操作日志';
COMMENT ON COLUMN sys_log_operation.id IS 'id';
COMMENT ON COLUMN sys_log_operation.operation IS '用户操作';
COMMENT ON COLUMN sys_log_operation.request_uri IS '请求URI';
COMMENT ON COLUMN sys_log_operation.request_method IS '请求方式';
COMMENT ON COLUMN sys_log_operation.request_params IS '请求参数';
COMMENT ON COLUMN sys_log_operation.request_time IS '请求时长(毫秒)';
COMMENT ON COLUMN sys_log_operation.user_agent IS '用户代理';
COMMENT ON COLUMN sys_log_operation.ip IS '操作IP';
COMMENT ON COLUMN sys_log_operation.status IS '状态  0：失败   1：成功';
COMMENT ON COLUMN sys_log_operation.creator_name IS '用户名';
COMMENT ON COLUMN sys_log_operation.creator IS '创建者';
COMMENT ON COLUMN sys_log_operation.create_date IS '创建时间';


create table sys_log_error
(
  id                   int8 NOT NULL,
  request_uri          varchar(200),
  request_method       varchar(20),
  request_params       text,
  user_agent           varchar(500),
  ip                   varchar(32),
  error_info           text,
  creator              int8,
  create_date          timestamp,
  primary key (id)
);
CREATE INDEX idx_error_create_date on sys_log_error(create_date);

COMMENT ON TABLE sys_log_error IS '异常日志';
COMMENT ON COLUMN sys_log_error.id IS 'id';
COMMENT ON COLUMN sys_log_error.request_uri IS '请求URI';
COMMENT ON COLUMN sys_log_error.request_method IS '请求方式';
COMMENT ON COLUMN sys_log_error.request_params IS '请求参数';
COMMENT ON COLUMN sys_log_error.user_agent IS '用户代理';
COMMENT ON COLUMN sys_log_error.ip IS '操作IP';
COMMENT ON COLUMN sys_log_error.error_info IS '异常信息';
COMMENT ON COLUMN sys_log_error.creator IS '创建者';
COMMENT ON COLUMN sys_log_error.create_date IS '创建时间';



CREATE TABLE sys_oss (
  id int8 NOT NULL,
  url varchar(200),
  creator int8,
  create_date timestamp,
  PRIMARY KEY (id)
);
CREATE INDEX idx_sys_oss_create_date on sys_oss(create_date);

COMMENT ON TABLE sys_oss IS '文件上传';
COMMENT ON COLUMN sys_oss.id IS 'id';
COMMENT ON COLUMN sys_oss.url IS 'URL地址';
COMMENT ON COLUMN sys_oss.creator IS '创建者';
COMMENT ON COLUMN sys_oss.create_date IS '创建时间';


CREATE TABLE schedule_job (
  id int8 NOT NULL,
  bean_name varchar(200),
  params varchar(2000),
  cron_expression varchar(100),
  status  int,
  remark varchar(255),
  creator int8,
  create_date timestamp,
  updater int8,
  update_date timestamp,
  PRIMARY KEY (id)
);

CREATE INDEX idx_schedule_job_create_date on schedule_job(create_date);

COMMENT ON TABLE schedule_job IS '定时任务';
COMMENT ON COLUMN schedule_job.id IS 'id';
COMMENT ON COLUMN schedule_job.bean_name IS 'spring bean名称';
COMMENT ON COLUMN schedule_job.params IS '参数';
COMMENT ON COLUMN schedule_job.cron_expression IS 'cron表达式';
COMMENT ON COLUMN schedule_job.status IS '任务状态  0：暂停  1：正常';
COMMENT ON COLUMN schedule_job.remark IS '备注';
COMMENT ON COLUMN schedule_job.creator IS '创建者';
COMMENT ON COLUMN schedule_job.create_date IS '创建时间';
COMMENT ON COLUMN schedule_job.updater IS '更新者';
COMMENT ON COLUMN schedule_job.update_date IS '更新时间';


CREATE TABLE schedule_job_log (
  id int8 NOT NULL,
  job_id int8 NOT NULL,
  bean_name varchar(200),
  params varchar(2000),
  status  int,
  error varchar(2000),
  times  int,
  create_date timestamp,
  PRIMARY KEY (id)
);

CREATE INDEX idx_job_log_job_id on schedule_job_log(job_id);
CREATE INDEX idx_job_log_create_date on schedule_job_log(create_date);

COMMENT ON TABLE schedule_job_log IS '定时任务日志';
COMMENT ON COLUMN schedule_job_log.id IS 'id';
COMMENT ON COLUMN schedule_job_log.bean_name IS 'spring bean名称';
COMMENT ON COLUMN schedule_job_log.params IS '参数';
COMMENT ON COLUMN schedule_job_log.status IS '任务状态  0：失败    1：成功';
COMMENT ON COLUMN schedule_job_log.error IS '失败信息';
COMMENT ON COLUMN schedule_job_log.times IS '耗时(单位：毫秒)';
COMMENT ON COLUMN schedule_job.create_date IS '创建时间';


CREATE TABLE sys_user_token (
  id int8 NOT NULL,
  user_id int8,
  token varchar(100),
  expire_date timestamp,
  update_date timestamp,
  create_date timestamp,
  PRIMARY KEY (id)
);

CREATE UNIQUE INDEX uk_sys_user_token_user_id on sys_user_token(user_id);
CREATE UNIQUE INDEX uk_sys_user_token on sys_user_token(token);

COMMENT ON TABLE sys_user_token IS '系统用户Token';
COMMENT ON COLUMN sys_user_token.id IS 'id';
COMMENT ON COLUMN sys_user_token.user_id IS '用户id';
COMMENT ON COLUMN sys_user_token.token IS '用户token';
COMMENT ON COLUMN sys_user_token.expire_date IS '过期时间';
COMMENT ON COLUMN sys_user_token.update_date IS '更新时间';
COMMENT ON COLUMN sys_user_token.create_date IS '创建时间';



-- 初始数据
INSERT INTO sys_user(id, username, password, real_name, gender, email, mobile, status, dept_id, super_admin, creator, create_date, updater, update_date) VALUES (1067246875800000001, 'admin', '$2a$10$012Kx2ba5jzqr9gLlG4MX.bnQJTD9UWqF57XDo2N3.fPtLne02u/m', '管理员', 0, 'root@renren.io', '13612345678', 1, null, 1, 1067246875800000001, now(), 1067246875800000001, now());

INSERT INTO sys_menu (id, pid, name, url, permissions, type, icon, sort, creator, create_date, updater, update_date) VALUES (1067246875800000002, 0, '权限管理', NULL, NULL, 0, 'icon-safetycertificate', 0, 1067246875800000001, now(), 1067246875800000001, now());
INSERT INTO sys_menu (id, pid, name, url, permissions, type, icon, sort, creator, create_date, updater, update_date) VALUES (1067246875800000003, 1067246875800000055, '新增', NULL, 'sys:user:save,sys:dept:list,sys:role:list', 1, NULL, 1, 1067246875800000001, now(), 1067246875800000001, now());
INSERT INTO sys_menu (id, pid, name, url, permissions, type, icon, sort, creator, create_date, updater, update_date) VALUES (1067246875800000004, 1067246875800000055, '修改', NULL, 'sys:user:update,sys:dept:list,sys:role:list', 1, NULL, 2, 1067246875800000001, now(), 1067246875800000001, now());
INSERT INTO sys_menu (id, pid, name, url, permissions, type, icon, sort, creator, create_date, updater, update_date) VALUES (1067246875800000005, 1067246875800000055, '删除', NULL, 'sys:user:delete', 1, NULL, 3, 1067246875800000001, now(), 1067246875800000001, now());
INSERT INTO sys_menu (id, pid, name, url, permissions, type, icon, sort, creator, create_date, updater, update_date) VALUES (1067246875800000006, 1067246875800000055, '导出', NULL, 'sys:user:export', 1, NULL, 4, 1067246875800000001, now(), 1067246875800000001, now());
INSERT INTO sys_menu (id, pid, name, url, permissions, type, icon, sort, creator, create_date, updater, update_date) VALUES (1067246875800000007, 1067246875800000002, '角色管理', 'sys/role', NULL, 0, 'icon-team', 2, 1067246875800000001, now(), 1067246875800000001, now());
INSERT INTO sys_menu (id, pid, name, url, permissions, type, icon, sort, creator, create_date, updater, update_date) VALUES (1067246875800000008, 1067246875800000007, '查看', NULL, 'sys:role:page,sys:role:info', 1, NULL, 0, 1067246875800000001, now(), 1067246875800000001, now());
INSERT INTO sys_menu (id, pid, name, url, permissions, type, icon, sort, creator, create_date, updater, update_date) VALUES (1067246875800000009, 1067246875800000007, '新增', NULL, 'sys:role:save,sys:menu:select,sys:dept:list', 1, NULL, 1, 1067246875800000001, now(), 1067246875800000001, now());
INSERT INTO sys_menu (id, pid, name, url, permissions, type, icon, sort, creator, create_date, updater, update_date) VALUES (1067246875800000010, 1067246875800000007, '修改', NULL, 'sys:role:update,sys:menu:select,sys:dept:list', 1, NULL, 2, 1067246875800000001, now(), 1067246875800000001, now());
INSERT INTO sys_menu (id, pid, name, url, permissions, type, icon, sort, creator, create_date, updater, update_date) VALUES (1067246875800000011, 1067246875800000007, '删除', NULL, 'sys:role:delete', 1, NULL, 3, 1067246875800000001, now(), 1067246875800000001, now());
INSERT INTO sys_menu (id, pid, name, url, permissions, type, icon, sort, creator, create_date, updater, update_date) VALUES (1067246875800000012, 1067246875800000002, '部门管理', 'sys/dept', NULL, 0, 'icon-apartment', 1, 1067246875800000001, now(), 1067246875800000001, now());
INSERT INTO sys_menu (id, pid, name, url, permissions, type, icon, sort, creator, create_date, updater, update_date) VALUES (1067246875800000014, 1067246875800000012, '查看', NULL, 'sys:dept:list,sys:dept:info', 1, NULL, 0, 1067246875800000001, now(), 1067246875800000001, now());
INSERT INTO sys_menu (id, pid, name, url, permissions, type, icon, sort, creator, create_date, updater, update_date) VALUES (1067246875800000015, 1067246875800000012, '新增', NULL, 'sys:dept:save', 1, NULL, 1, 1067246875800000001, now(), 1067246875800000001, now());
INSERT INTO sys_menu (id, pid, name, url, permissions, type, icon, sort, creator, create_date, updater, update_date) VALUES (1067246875800000016, 1067246875800000012, '修改', NULL, 'sys:dept:update', 1, NULL, 2, 1067246875800000001, now(), 1067246875800000001, now());
INSERT INTO sys_menu (id, pid, name, url, permissions, type, icon, sort, creator, create_date, updater, update_date) VALUES (1067246875800000017, 1067246875800000012, '删除', NULL, 'sys:dept:delete', 1, NULL, 3, 1067246875800000001, now(), 1067246875800000001, now());
INSERT INTO sys_menu (id, pid, name, url, permissions, type, icon, sort, creator, create_date, updater, update_date) VALUES (1067246875800000025, 1067246875800000035, '菜单管理', 'sys/menu', NULL, 0, 'icon-unorderedlist', 0, 1067246875800000001, now(), 1067246875800000001, now());
INSERT INTO sys_menu (id, pid, name, url, permissions, type, icon, sort, creator, create_date, updater, update_date) VALUES (1067246875800000026, 1067246875800000025, '查看', NULL, 'sys:menu:list,sys:menu:info', 1, NULL, 0, 1067246875800000001, now(), 1067246875800000001, now());
INSERT INTO sys_menu (id, pid, name, url, permissions, type, icon, sort, creator, create_date, updater, update_date) VALUES (1067246875800000027, 1067246875800000025, '新增', NULL, 'sys:menu:save', 1, NULL, 1, 1067246875800000001, now(), 1067246875800000001, now());
INSERT INTO sys_menu (id, pid, name, url, permissions, type, icon, sort, creator, create_date, updater, update_date) VALUES (1067246875800000028, 1067246875800000025, '修改', NULL, 'sys:menu:update', 1, NULL, 2, 1067246875800000001, now(), 1067246875800000001, now());
INSERT INTO sys_menu (id, pid, name, url, permissions, type, icon, sort, creator, create_date, updater, update_date) VALUES (1067246875800000029, 1067246875800000025, '删除', NULL, 'sys:menu:delete', 1, NULL, 3, 1067246875800000001, now(), 1067246875800000001, now());
INSERT INTO sys_menu (id, pid, name, url, permissions, type, icon, sort, creator, create_date, updater, update_date) VALUES (1067246875800000030, 1067246875800000035, '定时任务', 'job/schedule', NULL, 0, 'icon-dashboard', 3, 1067246875800000001, now(), 1067246875800000001, now());
INSERT INTO sys_menu (id, pid, name, url, permissions, type, icon, sort, creator, create_date, updater, update_date) VALUES (1067246875800000031, 1067246875800000030, '查看', NULL, 'sys:schedule:page,sys:schedule:info', 1, NULL, 0, 1067246875800000001, now(), 1067246875800000001, now());
INSERT INTO sys_menu (id, pid, name, url, permissions, type, icon, sort, creator, create_date, updater, update_date) VALUES (1067246875800000032, 1067246875800000030, '新增', NULL, 'sys:schedule:save', 1, NULL, 1, 1067246875800000001, now(), 1067246875800000001, now());
INSERT INTO sys_menu (id, pid, name, url, permissions, type, icon, sort, creator, create_date, updater, update_date) VALUES (1067246875800000033, 1067246875800000030, '修改', NULL, 'sys:schedule:update', 1, NULL, 2, 1067246875800000001, now(), 1067246875800000001, now());
INSERT INTO sys_menu (id, pid, name, url, permissions, type, icon, sort, creator, create_date, updater, update_date) VALUES (1067246875800000034, 1067246875800000030, '删除', NULL, 'sys:schedule:delete', 1, NULL, 3, 1067246875800000001, now(), 1067246875800000001, now());
INSERT INTO sys_menu (id, pid, name, url, permissions, type, icon, sort, creator, create_date, updater, update_date) VALUES (1067246875800000035, 0, '系统设置', NULL, NULL, 0, 'icon-setting', 1, 1067246875800000001, now(), 1067246875800000001, now());
INSERT INTO sys_menu (id, pid, name, url, permissions, type, icon, sort, creator, create_date, updater, update_date) VALUES (1067246875800000036, 1067246875800000030, '暂停', NULL, 'sys:schedule:pause', 1, NULL, 4, 1067246875800000001, now(), 1067246875800000001, now());
INSERT INTO sys_menu (id, pid, name, url, permissions, type, icon, sort, creator, create_date, updater, update_date) VALUES (1067246875800000037, 1067246875800000030, '恢复', NULL, 'sys:schedule:resume', 1, NULL, 5, 1067246875800000001, now(), 1067246875800000001, now());
INSERT INTO sys_menu (id, pid, name, url, permissions, type, icon, sort, creator, create_date, updater, update_date) VALUES (1067246875800000038, 1067246875800000030, '立即执行', NULL, 'sys:schedule:run', 1, NULL, 6, 1067246875800000001, now(), 1067246875800000001, now());
INSERT INTO sys_menu (id, pid, name, url, permissions, type, icon, sort, creator, create_date, updater, update_date) VALUES (1067246875800000039, 1067246875800000030, '日志列表', NULL, 'sys:schedule:log', 1, NULL, 7, 1067246875800000001, now(), 1067246875800000001, now());
INSERT INTO sys_menu (id, pid, name, url, permissions, type, icon, sort, creator, create_date, updater, update_date) VALUES (1067246875800000040, 1067246875800000035, '参数管理', 'sys/params', '', 0, 'icon-fileprotect', 1, 1067246875800000001, now(), 1067246875800000001, now());
INSERT INTO sys_menu (id, pid, name, url, permissions, type, icon, sort, creator, create_date, updater, update_date) VALUES (1067246875800000041, 1067246875800000035, '字典管理', 'sys/dict-type', NULL, 0, 'icon-golden-fill', 2, 1067246875800000001, now(), 1067246875800000001, now());
INSERT INTO sys_menu (id, pid, name, url, permissions, type, icon, sort, creator, create_date, updater, update_date) VALUES (1067246875800000042, 1067246875800000041, '查看', NULL, 'sys:dict:page,sys:dict:info', 1, NULL, 0, 1067246875800000001, now(), 1067246875800000001, now());
INSERT INTO sys_menu (id, pid, name, url, permissions, type, icon, sort, creator, create_date, updater, update_date) VALUES (1067246875800000043, 1067246875800000041, '新增', NULL, 'sys:dict:save', 1, NULL, 1, 1067246875800000001, now(), 1067246875800000001, now());
INSERT INTO sys_menu (id, pid, name, url, permissions, type, icon, sort, creator, create_date, updater, update_date) VALUES (1067246875800000044, 1067246875800000041, '修改', NULL, 'sys:dict:update', 1, NULL, 2, 1067246875800000001, now(), 1067246875800000001, now());
INSERT INTO sys_menu (id, pid, name, url, permissions, type, icon, sort, creator, create_date, updater, update_date) VALUES (1067246875800000045, 1067246875800000041, '删除', NULL, 'sys:dict:delete', 1, NULL, 3, 1067246875800000001, now(), 1067246875800000001, now());
INSERT INTO sys_menu (id, pid, name, url, permissions, type, icon, sort, creator, create_date, updater, update_date) VALUES (1067246875800000046, 0, '日志管理', NULL, NULL, 0, 'icon-container', 2, 1067246875800000001, now(), 1067246875800000001, now());
INSERT INTO sys_menu (id, pid, name, url, permissions, type, icon, sort, creator, create_date, updater, update_date) VALUES (1067246875800000047, 1067246875800000035, '文件上传', 'oss/oss', 'sys:oss:all', 0, 'icon-upload', 4, 1067246875800000001, now(), 1067246875800000001, now());
INSERT INTO sys_menu (id, pid, name, url, permissions, type, icon, sort, creator, create_date, updater, update_date) VALUES (1067246875800000048, 1067246875800000046, '登录日志', 'sys/log-login', 'sys:log:login', 0, 'icon-filedone', 0, 1067246875800000001, now(), 1067246875800000001, now());
INSERT INTO sys_menu (id, pid, name, url, permissions, type, icon, sort, creator, create_date, updater, update_date) VALUES (1067246875800000049, 1067246875800000046, '操作日志', 'sys/log-operation', 'sys:log:operation', 0, 'icon-solution', 1, 1067246875800000001, now(), 1067246875800000001, now());
INSERT INTO sys_menu (id, pid, name, url, permissions, type, icon, sort, creator, create_date, updater, update_date) VALUES (1067246875800000050, 1067246875800000046, '异常日志', 'sys/log-error', 'sys:log:error', 0, 'icon-file-exception', 2, 1067246875800000001, now(), 1067246875800000001, now());
INSERT INTO sys_menu (id, pid, name, url, permissions, type, icon, sort, creator, create_date, updater, update_date) VALUES (1067246875800000051, 1067246875800000053, 'SQL监控', '{{ window.SITE_CONFIG["apiURL"] }}/druid/sql.html', NULL, 0, 'icon-database', 0, 1067246875800000001, now(), 1067246875800000001, now());
INSERT INTO sys_menu (id, pid, name, url, permissions, type, icon, sort, creator, create_date, updater, update_date) VALUES (1067246875800000053, 0, '系统监控', NULL, NULL, 0, 'icon-desktop', 3, 1067246875800000001, now(), 1067246875800000001, now());
INSERT INTO sys_menu (id, pid, name, url, permissions, type, icon, sort, creator, create_date, updater, update_date) VALUES (1067246875800000055, 1067246875800000002, '用户管理', 'sys/user', NULL, 0, 'icon-user', 0, 1067246875800000001, now(), 1067246875800000001, now());
INSERT INTO sys_menu (id, pid, name, url, permissions, type, icon, sort, creator, create_date, updater, update_date) VALUES (1067246875800000056, 1067246875800000055, '查看', NULL, 'sys:user:page,sys:user:info', 1, NULL, 0, 1067246875800000001, now(), 1067246875800000001, now());
INSERT INTO sys_menu (id, pid, name, url, permissions, type, icon, sort, creator, create_date, updater, update_date) VALUES (1067246875800000057, 1067246875800000040, '新增', NULL, 'sys:params:save', 1, NULL, 1, 1067246875800000001, now(), 1067246875800000001, now());
INSERT INTO sys_menu (id, pid, name, url, permissions, type, icon, sort, creator, create_date, updater, update_date) VALUES (1067246875800000058, 1067246875800000040, '导出', NULL, 'sys:params:export', 1, NULL, 4, 1067246875800000001, now(), 1067246875800000001, now());
INSERT INTO sys_menu (id, pid, name, url, permissions, type, icon, sort, creator, create_date, updater, update_date) VALUES (1067246875800000059, 1067246875800000040, '查看', '', 'sys:params:page,sys:params:info', 1, NULL, 0, 1067246875800000001, now(), 1067246875800000001, now());
INSERT INTO sys_menu (id, pid, name, url, permissions, type, icon, sort, creator, create_date, updater, update_date) VALUES (1067246875800000060, 1067246875800000040, '修改', NULL, 'sys:params:update', 1, NULL, 2, 1067246875800000001, now(), 1067246875800000001, now());
INSERT INTO sys_menu (id, pid, name, url, permissions, type, icon, sort, creator, create_date, updater, update_date) VALUES (1067246875800000061, 1067246875800000040, '删除', '', 'sys:params:delete', 1, '', 3, 1067246875800000001, now(), 1067246875800000001, now());
INSERT INTO sys_menu (id, pid, name, url, permissions, type, icon, sort, creator, create_date, updater, update_date) VALUES (1156748733921165314, 1067246875800000053, '接口文档', '{{ window.SITE_CONFIG["apiURL"] }}/doc.html', '', 0, 'icon-file-word', 1, 1067246875800000001, now(), 1067246875800000001, now());


INSERT INTO sys_dept(id, pid, pids, name, sort, creator, create_date, updater, update_date) VALUES (1067246875800000062, 1067246875800000063, '1067246875800000066,1067246875800000063', '技术部', 2, 1067246875800000001, now(), 1067246875800000001, now());
INSERT INTO sys_dept(id, pid, pids, name, sort, creator, create_date, updater, update_date) VALUES (1067246875800000063, 1067246875800000066, '1067246875800000066', '长沙分公司', 1, 1067246875800000001, now(), 1067246875800000001, now());
INSERT INTO sys_dept(id, pid, pids, name, sort, creator, create_date, updater, update_date) VALUES (1067246875800000064, 1067246875800000066, '1067246875800000066', '上海分公司', 0, 1067246875800000001, now(), 1067246875800000001, now());
INSERT INTO sys_dept(id, pid, pids, name, sort, creator, create_date, updater, update_date) VALUES (1067246875800000065, 1067246875800000064, '1067246875800000066,1067246875800000064', '市场部', 0, 1067246875800000001, now(), 1067246875800000001, now());
INSERT INTO sys_dept(id, pid, pids, name, sort, creator, create_date, updater, update_date) VALUES (1067246875800000066, 0, '0', '人人开源集团', 0, 1067246875800000001, now(), 1067246875800000001, now());
INSERT INTO sys_dept(id, pid, pids, name, sort, creator, create_date, updater, update_date) VALUES (1067246875800000067, 1067246875800000064, '1067246875800000066,1067246875800000064', '销售部', 0, 1067246875800000001, now(), 1067246875800000001, now());
INSERT INTO sys_dept(id, pid, pids, name, sort, creator, create_date, updater, update_date) VALUES (1067246875800000068, 1067246875800000063, '1067246875800000066,1067246875800000063', '产品部', 1, 1067246875800000001, now(), 1067246875800000001, now());

INSERT INTO sys_dict_type(id, dict_type, dict_name, remark, sort, creator, create_date, updater, update_date) VALUES (1160061077912858625, 'gender', '性别', '', 0, 1067246875800000001, now(), 1067246875800000001, now());
INSERT INTO sys_dict_data(id, dict_type_id, dict_label, dict_value, remark, sort, creator, create_date, updater, update_date) VALUES (1160061112075464705, 1160061077912858625, '男', '0', '', 0, 1067246875800000001, now(), 1067246875800000001, now());
INSERT INTO sys_dict_data(id, dict_type_id, dict_label, dict_value, remark, sort, creator, create_date, updater, update_date) VALUES (1160061146967879681, 1160061077912858625, '女', '1', '', 1, 1067246875800000001, now(), 1067246875800000001, now());
INSERT INTO sys_dict_data(id, dict_type_id, dict_label, dict_value, remark, sort, creator, create_date, updater, update_date) VALUES (1160061190127267841, 1160061077912858625, '保密', '2', '', 2, 1067246875800000001, now(), 1067246875800000001, now());
INSERT INTO sys_dict_type(id, dict_type, dict_name, remark, sort, creator, create_date, updater, update_date) VALUES (1225813644059140097, 'notice_type', '站内通知-类型', '', 1, 1067246875800000001, now(), 1067246875800000001, now());
INSERT INTO sys_dict_data(id, dict_type_id, dict_label, dict_value, remark, sort, creator, create_date, updater, update_date) VALUES (1225814069634195457, 1225813644059140097, '公告', '0', '', 0, 1067246875800000001, now(), 1067246875800000001, now());
INSERT INTO sys_dict_data(id, dict_type_id, dict_label, dict_value, remark, sort, creator, create_date, updater, update_date) VALUES (1225814107559092225, 1225813644059140097, '会议', '1', '', 1, 1067246875800000001, now(), 1067246875800000001, now());
INSERT INTO sys_dict_data(id, dict_type_id, dict_label, dict_value, remark, sort, creator, create_date, updater, update_date) VALUES (1225814271879340034, 1225813644059140097, '其他', '2', '', 2, 1067246875800000001, now(), 1067246875800000001, now());

INSERT INTO sys_params(id, param_code, param_value, param_type, remark, creator, create_date, updater, update_date) VALUES (1067246875800000073, 'CLOUD_STORAGE_CONFIG_KEY', '{"type":1,"qiniuDomain":"http://test.oss.renren.io","qiniuPrefix":"upload","qiniuAccessKey":"NrgMfABZxWLo5B-YYSjoE8-AZ1EISdi1Z3ubLOeZ","qiniuSecretKey":"uIwJHevMRWU0VLxFvgy0tAcOdGqasdtVlJkdy6vV","qiniuBucketName":"renren-oss","aliyunDomain":"","aliyunPrefix":"","aliyunEndPoint":"","aliyunAccessKeyId":"","aliyunAccessKeySecret":"","aliyunBucketName":"","qcloudDomain":"","qcloudPrefix":"","qcloudSecretId":"","qcloudSecretKey":"","qcloudBucketName":""}', '0', '云存储配置信息', 1067246875800000001, now(), 1067246875800000001, now());

INSERT INTO schedule_job (id, bean_name, params, cron_expression, status, remark, creator, create_date, updater, update_date) VALUES (1067246875800000076, 'testTask', 'renren', '0 0/30 * * * ?', 0, '有参测试，多个参数使用json', 1067246875800000001, now(), 1067246875800000001, now());



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
