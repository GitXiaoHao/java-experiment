create database experiment;
use experiment;
create table user_account(
    id int auto_increment primary key comment '主键',
    username varchar(32) not null unique comment '用户名',
    password varchar(32) not null comment '密码',
    name varchar(10) comment '真实用户名',
    phone varchar(11) comment '电话',
    email varchar(20) comment '邮箱',
    code varchar(32) comment '唯一代码',
    is_status int comment '是否激活 1为激活 0为未激活'
)ENGINE = InnoDB
 DEFAULT CHARSET = utf8
 COLLATE = utf8_bin COMMENT ='用户表';