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

# 图书
create table library(
    id int auto_increment primary key comment '主键',
    name varchar(32) not null unique comment '图书名',
    price int comment '价格',
    category varchar(10) comment '类别',
    author varchar(32) comment '作者',
    borrowed_or_not int comment '是否被借阅 1:被借阅 0:无借阅',
    whether_to_purchased int comment '是否被购买 1:被购买 0:没有被购买',
    remarks varchar(32) comment '备注'
)ENGINE = InnoDB
 DEFAULT CHARSET = utf8
 COLLATE = utf8_bin COMMENT ='图书表';

create table cart(
    c_id int auto_increment primary key comment '主键'

)ENGINE = InnoDB
 DEFAULT CHARSET = utf8
 COLLATE = utf8_bin COMMENT ='购物车表';
