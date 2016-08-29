/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2016/8/28 18:51:28                           */
/*==============================================================*/


drop table if exists TBL_SYS_INFORMATION;

drop table if exists TBL_SYS_LOG;

drop table if exists TBL_SYS_MENU;

drop table if exists TBL_SYS_MROLE;

drop table if exists TBL_SYS_PERMISSION;

drop table if exists TBL_SYS_ROLE;

drop table if exists TBL_SYS_RPERMISSION;

drop table if exists TBL_SYS_ULOG;

drop table if exists TBL_SYS_UROLE;

drop table if exists TBL_SYS_USER;

/*==============================================================*/
/* Table: TBL_SYS_INFORMATION                                   */
/*==============================================================*/
create table TBL_SYS_INFORMATION
(
   SID                  bigint not null auto_increment comment '主键',
   CREATED_BY           varchar(32) default 'system' comment '创建人',
   CREATED_DT           datetime default CURRENT_TIMESTAMP comment '创建时间',
   VERSION              int default 1 comment '版本',
   UPDATED_BY           varchar(32) default 'system' comment '更新人',
   UPDATED_DT           datetime default CURRENT_TIMESTAMP comment '更新时间',
   INFO_NAME            varchar(32) not null comment '系统信息名称',
   INFO_SIGN            varchar(32) not null comment '系统信息标识',
   INFO_VALUE           varchar(128) comment '系统信息值',
   ORDER_NO             int,
   ENABLED              varchar(2) default '1' comment '是否可用',
   REMARK               varchar(255) comment '备注',
   primary key (SID)
);

alter table TBL_SYS_INFORMATION comment '系统信息表';

/*==============================================================*/
/* Table: TBL_SYS_LOG                                           */
/*==============================================================*/
create table TBL_SYS_LOG
(
   SID                  bigint not null auto_increment comment '主键',
   CREATED_BY           varchar(32) default 'system' comment '创建人(用户名)',
   CREATED_DT           datetime default 'SYSDATE' comment '创建时间(登录时间)',
   VERSION              int default 1 comment '版本',
   UPDATED_BY           varchar(32) default 'system' comment '更新人(登录名)',
   UPDATED_DT           datetime default 'SYSDATE' comment '更新时间(登录时间)',
   USER_SID             bigint comment '用户id',
   DEVICE_TYPE          varchar(16) comment '登录设备类型(PC或移动端)',
   DEVICE_NO            varchar(32) comment '设备编号(如手机IMEI)',
   DEVICE_NAME          varchar(32) comment '设备名称',
   DEVICE_MODEL         varchar(32) default '1' comment '设备型号',
   MOBILEPHONE          varchar(16) comment '手机号',
   OPT_MOFULE           varchar(16) comment '操作菜单',
   OPT_METHOD           varchar(16) comment '操作类型',
   LOGIN_IP             varchar(128) comment '登录IP',
   OPT_RECORD           varchar(256) comment '操作记录',
   OPT_STATUS           varchar(16) comment '操作状态',
   primary key (SID)
);

alter table TBL_SYS_LOG comment '系统日志表';

/*==============================================================*/
/* Table: TBL_SYS_MENU                                          */
/*==============================================================*/
create table TBL_SYS_MENU
(
   SID                  bigint not null auto_increment comment '主键',
   CREATED_BY           varchar(32) default 'system' comment '创建人',
   CREATED_DT           datetime default CURRENT_TIMESTAMP comment '创建时间',
   VERSION              int default 1 comment '版本',
   UPDATED_BY           varchar(32) default 'system' comment '更新人',
   UPDATED_DT           datetime default CURRENT_TIMESTAMP comment '更新时间',
   MENU_PID             numeric(18,0) comment '上级菜单id',
   MENU_KEY             varchar(16) comment '工号',
   MENU_TYPE            varchar(16) comment '菜单类型',
   MENU_CODE            varchar(32) comment '菜单编码',
   MENU_PCODE           varchar(32) comment '上级菜单编码',
   MENU_NAME            varchar(128) comment '菜单名称',
   MENU_URL             varchar(16) comment '菜单地址',
   MENU_LEVEL           varchar(16) comment '菜单等级（层级）',
   MENU_ICON            varchar(32) comment '菜单图标',
   ORDER_NO             int,
   ENABLED              varchar(2) default '1' comment '是否可用',
   REMARK               varchar(255) comment '备注',
   primary key (SID)
);

alter table TBL_SYS_MENU comment '系统菜单表';

/*==============================================================*/
/* Table: TBL_SYS_MROLE                                         */
/*==============================================================*/
create table TBL_SYS_MROLE
(
   SID                  bigint not null auto_increment comment '主键',
   CREATED_BY           varchar(32) default 'system' comment '创建人',
   CREATED_DT           datetime default CURRENT_TIMESTAMP comment '创建时间',
   VERSION              int default 1 comment '版本',
   UPDATED_BY           varchar(32) default 'system' comment '更新人',
   UPDATED_DT           datetime default CURRENT_TIMESTAMP comment '更新时间',
   ROLE_SID             bigint  comment '角色id',
   MENU_SID             bigint comment '菜单id',
   ENABLED              varchar(2) default '1' comment '是否可用0否1是',
   REMARK               varchar(255) comment '备注',
   primary key (SID)
);

alter table TBL_SYS_MROLE comment '菜单角色表';

/*==============================================================*/
/* Table: TBL_SYS_PERMISSION                                    */
/*==============================================================*/
create table TBL_SYS_PERMISSION
(
   SID                  bigint not null auto_increment comment '主键',
   CREATED_BY           varchar(32) default 'system' comment '创建人',
   CREATED_DT           datetime default CURRENT_TIMESTAMP comment '创建时间',
   VERSION              int default 1 comment '版本',
   UPDATED_BY           varchar(32) default 'system' comment '更新人',
   UPDATED_DT           datetime default CURRENT_TIMESTAMP comment '更新时间',
   PERMISSION_NAME      varchar(32) comment '权限名称',
   PERMISSION_SIGN      varchar(32)  comment '权限标识,程序中判断使用,如"user:create"',
   ENABLED              varchar(2) default '1' comment '是否可用0否1是',
   DESCRIPTION          varchar(255) comment '权限描述,UI界面显示使用',
   primary key (SID)
);

alter table TBL_SYS_PERMISSION comment '权限表';

/*==============================================================*/
/* Table: TBL_SYS_ROLE                                          */
/*==============================================================*/
create table TBL_SYS_ROLE
(
   SID                  bigint not null auto_increment comment '主键',
   CREATED_BY           varchar(32) default 'system' comment '创建人',
   CREATED_DT           datetime default CURRENT_TIMESTAMP comment '创建时间',
   VERSION              int default 1 comment '版本',
   UPDATED_BY           varchar(32) default 'system' comment '更新人',
   UPDATED_DT           datetime default CURRENT_TIMESTAMP comment '更新时间',
   ROLE_NAME            varchar(32) comment '角色名称',
   ROLE_SIGN            varchar(32)  comment '角色标识,程序中判断使用,如"admin"',
   ENABLED              varchar(2) default '1' comment '是否可用0否1是',
   DESCRIPTION          varchar(255) comment '角色描述,UI界面显示使用',
   primary key (SID)
);

alter table TBL_SYS_ROLE comment '角色表';

/*==============================================================*/
/* Table: TBL_SYS_RPERMISSION                                   */
/*==============================================================*/
create table TBL_SYS_RPERMISSION
(
   SID                  bigint not null auto_increment comment '主键',
   CREATED_BY           varchar(32) default 'system' comment '创建人',
   CREATED_DT           datetime default CURRENT_TIMESTAMP comment '创建时间',
   VERSION              int default 1 comment '版本',
   UPDATED_BY           varchar(32) default 'system' comment '更新人',
   UPDATED_DT           datetime default CURRENT_TIMESTAMP comment '更新时间',
   ROLE_SID             bigint comment '角色id',
   PERMISSION_SID       bigint comment '权限id',
   ENABLED              varchar(2) default '1' comment '是否可用0否1是',
   REMARK               varchar(255) comment '备注',
   primary key (SID)
);

alter table TBL_SYS_RPERMISSION comment '角色权限表';

/*==============================================================*/
/* Table: TBL_SYS_ULOG                                          */
/*==============================================================*/
create table TBL_SYS_ULOG
(
   SID                  bigint not null auto_increment comment '主键',
   CREATED_BY           varchar(32) default 'system' comment '创建人(用户名)',
   CREATED_DT           datetime default CURRENT_TIMESTAMP comment '创建时间(登录时间)',
   VERSION              int default 1 comment '版本',
   UPDATED_BY           varchar(32) default 'system' comment '更新人(登录名)',
   UPDATED_DT           datetime default CURRENT_TIMESTAMP comment '更新时间(登录时间)',
   USER_SID             bigint comment '用户id',
   LOGIN_NAME           varchar(32) comment '设备编号(如手机IMEI)',
   USER_NAME            varchar(32) comment '登录设备类型(PC或移动端)',
   LOGIN_TIME           datetime default CURRENT_TIMESTAMP comment '登录时间',
   LOGIN_IP             varchar(128) comment '登录IP',
   ENABLED              varchar(2) default '1' '是否可用0否1是',
   REMARK               varchar(255),
   primary key (SID)
);

alter table TBL_SYS_ULOG comment '用户登录日志表';

/*==============================================================*/
/* Table: TBL_SYS_UROLE                                         */
/*==============================================================*/
create table TBL_SYS_UROLE
(
   SID                  bigint not null auto_increment comment '主键',
   CREATED_BY           varchar(32) default 'system' comment '创建人',
   CREATED_DT           datetime default CURRENT_TIMESTAMP comment '创建时间',
   VERSION              int default 1 comment '版本',
   UPDATED_BY           varchar(32) default 'system' comment '更新人',
   UPDATED_DT           datetime default CURRENT_TIMESTAMP comment '更新时间',
   USER_SID             bigint comment '用户id',
   ROLE_SID             bigint  comment '角色id',
   ENABLED              varchar(2) default '1' comment '是否可用0否1是',
   REMARK               varchar(255) comment '备注',
   primary key (SID)
);

alter table TBL_SYS_UROLE comment '用户角色表';

/*==============================================================*/
/* Table: TBL_SYS_USER                                          */
/*==============================================================*/
create table TBL_SYS_USER
(
   SID                  bigint not null auto_increment comment '主键',
   CREATED_BY           varchar(32) default 'system' comment '创建人',
   CREATED_DT           datetime default CURRENT_TIMESTAMP comment '创建时间',
   VERSION              int default 1 comment '版本',
   UPDATED_BY           varchar(32) default 'system' comment '更新人',
   UPDATED_DT           datetime default CURRENT_TIMESTAMP comment '更新时间',
   USER_CODE            varchar(16) comment '用户编码',
   USER_NAME            varchar(32) comment '用户名',
   LOGIN_NAME           varchar(32) not null comment '登录名',
   PASSWORD             varchar(128) not null comment '密码',
   ENABLED              varchar(2) default '1' comment '是否可用',
   REMARK               varchar(255) comment '备注',
   primary key (SID)
);

alter table TBL_SYS_USER comment '系统用户表';

