-- 用户表
CREATE TABLE tb_user (
  user_id bigint NOT NULL IDENTITY(1,1),
  username varchar(50) NOT NULL,
  mobile varchar(20) NOT NULL,
  password varchar(64),
  create_time datetime,
  PRIMARY KEY (user_id),
  UNIQUE (username)
);


-- 用户Token表
CREATE TABLE tb_token (
  user_id bigint NOT NULL,
  token varchar(100) NOT NULL,
  expire_time datetime,
  update_time datetime,
  PRIMARY KEY (user_id),
  UNIQUE (token)
);

-- 账号：13612345678  密码：admin
INSERT INTO tb_user (username, mobile, password, create_time) VALUES ('mark', '13612345678', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', '2017-03-23 22:37:41');


