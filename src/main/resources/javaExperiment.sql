create database experiment;
use experiment;
create table user_account
(
    id        int auto_increment primary key comment '主键',
    username  varchar(32) not null unique comment '用户名',
    password  varchar(32) not null comment '密码',
    name      varchar(10) comment '真实用户名',
    phone     varchar(11) comment '电话',
    email     varchar(20) comment '邮箱',
    code      varchar(32) comment '唯一代码',
    is_status int comment '是否激活 1为激活 0为未激活'
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_bin COMMENT ='用户表';
use experiment;
drop table if exists library;
# 图书
create table library
(
    id                   int auto_increment primary key comment '主键',
    name                 varchar(32) not null unique comment '图书名',
    price                varchar(3) comment '价格',
    category             varchar(10) comment '类别',
    author               varchar(32) comment '作者',
    `l_image`            varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '图片',
    introduce            varchar(200) comment '介绍',
    borrowed_or_not      int comment '是否被借阅 1:被借阅 0:无借阅',
    whether_to_purchased int comment '是否被购买 1:被购买 0:没有被购买',
    `sales`              int comment '已售数量',
    `borrowed_quantity`  int comment '已借数量',
    `stock`              int comment '库存',
    remarks              varchar(200) comment '备注',
    l_code               varchar(32) not null unique comment '唯一代码'
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_bin COMMENT ='图书表';
drop table if exists cart;
create table cart
(
    c_id          int auto_increment primary key comment '主键',
    l_code        varchar(32) not null unique comment '图书唯一代码',
    num           int comment '数量',
    `total_price` int comment '总价格'
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_bin COMMENT ='购物车表';


drop table if exists book_category;
create table book_category
(
    `b_id`        int auto_increment primary key comment '主键',
    `name`        varchar(32) not null unique comment '类别名称'
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_bin COMMENT ='图书类别表';

drop table if exists student;
create table student(
    `id` int auto_increment primary key comment '主键',
    `name` varchar(32) not null unique comment '姓名',
    `password` varchar(32) not null comment '密码'
)ENGINE = InnoDB
 DEFAULT CHARSET = utf8
 COLLATE = utf8_bin COMMENT ='学生表';

alter table student add column sex varchar(1) comment '1 代表男 0 代表女' after name;
alter table student add column no varchar(32) comment '学号' after id;