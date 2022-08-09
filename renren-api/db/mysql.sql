-- 用户表
CREATE TABLE tb_user (
  id bigint NOT NULL COMMENT 'id',
  username varchar(50) NOT NULL COMMENT '用户名',
  mobile varchar(20) NOT NULL COMMENT '手机号',
  password varchar(64) COMMENT '密码',
  create_date datetime COMMENT '创建时间',
  PRIMARY KEY (id),
  UNIQUE INDEX (username)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户';

-- 用户Token表
CREATE TABLE tb_token (
  id bigint NOT NULL COMMENT 'id',
  user_id bigint NOT NULL COMMENT '用户ID',
  token varchar(100) NOT NULL COMMENT 'token',
  expire_date datetime COMMENT '过期时间',
  update_date datetime COMMENT '更新时间',
  PRIMARY KEY (id),
  UNIQUE INDEX (user_id),
  UNIQUE INDEX (token)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户Token';

-- 账号：13612345678  密码：admin
INSERT INTO tb_user (id, username, mobile, password, create_date) VALUES (1067246875900000001, 'mark', '13612345678', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', now());
