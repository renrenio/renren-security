-- 用户表
CREATE TABLE tb_user (
  user_id NUMBER(20, 0) NOT NULL,
  username varchar2(50) NOT NULL,
  mobile varchar2(20) NOT NULL,
  password varchar2(64),
  create_time timestamp,
  PRIMARY KEY (user_id)
);
CREATE UNIQUE INDEX index_username on tb_user(username);

-- 用户Token表
CREATE TABLE tb_token (
  user_id NUMBER(20, 0) NOT NULL,
  token varchar2(100) NOT NULL,
  expire_time timestamp,
  update_time timestamp,
  PRIMARY KEY (user_id)
);
CREATE UNIQUE INDEX index_token on tb_token(token);

-- 账号：13612345678  密码：admin
INSERT INTO tb_user (user_id, username, mobile, password, create_time) VALUES (1, 'mark', '13612345678', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', CURRENT_DATE);


