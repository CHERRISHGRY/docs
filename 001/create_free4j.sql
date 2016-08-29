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
   SID                  bigint not null auto_increment comment '����',
   CREATED_BY           varchar(32) default 'system' comment '������',
   CREATED_DT           datetime default CURRENT_TIMESTAMP comment '����ʱ��',
   VERSION              int default 1 comment '�汾',
   UPDATED_BY           varchar(32) default 'system' comment '������',
   UPDATED_DT           datetime default CURRENT_TIMESTAMP comment '����ʱ��',
   INFO_NAME            varchar(32) not null comment 'ϵͳ��Ϣ����',
   INFO_SIGN            varchar(32) not null comment 'ϵͳ��Ϣ��ʶ',
   INFO_VALUE           varchar(128) comment 'ϵͳ��Ϣֵ',
   ORDER_NO             int,
   ENABLED              varchar(2) default '1' comment '�Ƿ����',
   REMARK               varchar(255) comment '��ע',
   primary key (SID)
);

alter table TBL_SYS_INFORMATION comment 'ϵͳ��Ϣ��';

/*==============================================================*/
/* Table: TBL_SYS_LOG                                           */
/*==============================================================*/
create table TBL_SYS_LOG
(
   SID                  bigint not null auto_increment comment '����',
   CREATED_BY           varchar(32) default 'system' comment '������(�û���)',
   CREATED_DT           datetime default 'SYSDATE' comment '����ʱ��(��¼ʱ��)',
   VERSION              int default 1 comment '�汾',
   UPDATED_BY           varchar(32) default 'system' comment '������(��¼��)',
   UPDATED_DT           datetime default 'SYSDATE' comment '����ʱ��(��¼ʱ��)',
   USER_SID             bigint comment '�û�id',
   DEVICE_TYPE          varchar(16) comment '��¼�豸����(PC���ƶ���)',
   DEVICE_NO            varchar(32) comment '�豸���(���ֻ�IMEI)',
   DEVICE_NAME          varchar(32) comment '�豸����',
   DEVICE_MODEL         varchar(32) default '1' comment '�豸�ͺ�',
   MOBILEPHONE          varchar(16) comment '�ֻ���',
   OPT_MOFULE           varchar(16) comment '�����˵�',
   OPT_METHOD           varchar(16) comment '��������',
   LOGIN_IP             varchar(128) comment '��¼IP',
   OPT_RECORD           varchar(256) comment '������¼',
   OPT_STATUS           varchar(16) comment '����״̬',
   primary key (SID)
);

alter table TBL_SYS_LOG comment 'ϵͳ��־��';

/*==============================================================*/
/* Table: TBL_SYS_MENU                                          */
/*==============================================================*/
create table TBL_SYS_MENU
(
   SID                  bigint not null auto_increment comment '����',
   CREATED_BY           varchar(32) default 'system' comment '������',
   CREATED_DT           datetime default CURRENT_TIMESTAMP comment '����ʱ��',
   VERSION              int default 1 comment '�汾',
   UPDATED_BY           varchar(32) default 'system' comment '������',
   UPDATED_DT           datetime default CURRENT_TIMESTAMP comment '����ʱ��',
   MENU_PID             numeric(18,0) comment '�ϼ��˵�id',
   MENU_KEY             varchar(16) comment '����',
   MENU_TYPE            varchar(16) comment '�˵�����',
   MENU_CODE            varchar(32) comment '�˵�����',
   MENU_PCODE           varchar(32) comment '�ϼ��˵�����',
   MENU_NAME            varchar(128) comment '�˵�����',
   MENU_URL             varchar(16) comment '�˵���ַ',
   MENU_LEVEL           varchar(16) comment '�˵��ȼ����㼶��',
   MENU_ICON            varchar(32) comment '�˵�ͼ��',
   ORDER_NO             int,
   ENABLED              varchar(2) default '1' comment '�Ƿ����',
   REMARK               varchar(255) comment '��ע',
   primary key (SID)
);

alter table TBL_SYS_MENU comment 'ϵͳ�˵���';

/*==============================================================*/
/* Table: TBL_SYS_MROLE                                         */
/*==============================================================*/
create table TBL_SYS_MROLE
(
   SID                  bigint not null auto_increment comment '����',
   CREATED_BY           varchar(32) default 'system' comment '������',
   CREATED_DT           datetime default CURRENT_TIMESTAMP comment '����ʱ��',
   VERSION              int default 1 comment '�汾',
   UPDATED_BY           varchar(32) default 'system' comment '������',
   UPDATED_DT           datetime default CURRENT_TIMESTAMP comment '����ʱ��',
   ROLE_SID             bigint  comment '��ɫid',
   MENU_SID             bigint comment '�˵�id',
   ENABLED              varchar(2) default '1' comment '�Ƿ����0��1��',
   REMARK               varchar(255) comment '��ע',
   primary key (SID)
);

alter table TBL_SYS_MROLE comment '�˵���ɫ��';

/*==============================================================*/
/* Table: TBL_SYS_PERMISSION                                    */
/*==============================================================*/
create table TBL_SYS_PERMISSION
(
   SID                  bigint not null auto_increment comment '����',
   CREATED_BY           varchar(32) default 'system' comment '������',
   CREATED_DT           datetime default CURRENT_TIMESTAMP comment '����ʱ��',
   VERSION              int default 1 comment '�汾',
   UPDATED_BY           varchar(32) default 'system' comment '������',
   UPDATED_DT           datetime default CURRENT_TIMESTAMP comment '����ʱ��',
   PERMISSION_NAME      varchar(32) comment 'Ȩ������',
   PERMISSION_SIGN      varchar(32)  comment 'Ȩ�ޱ�ʶ,�������ж�ʹ��,��"user:create"',
   ENABLED              varchar(2) default '1' comment '�Ƿ����0��1��',
   DESCRIPTION          varchar(255) comment 'Ȩ������,UI������ʾʹ��',
   primary key (SID)
);

alter table TBL_SYS_PERMISSION comment 'Ȩ�ޱ�';

/*==============================================================*/
/* Table: TBL_SYS_ROLE                                          */
/*==============================================================*/
create table TBL_SYS_ROLE
(
   SID                  bigint not null auto_increment comment '����',
   CREATED_BY           varchar(32) default 'system' comment '������',
   CREATED_DT           datetime default CURRENT_TIMESTAMP comment '����ʱ��',
   VERSION              int default 1 comment '�汾',
   UPDATED_BY           varchar(32) default 'system' comment '������',
   UPDATED_DT           datetime default CURRENT_TIMESTAMP comment '����ʱ��',
   ROLE_NAME            varchar(32) comment '��ɫ����',
   ROLE_SIGN            varchar(32)  comment '��ɫ��ʶ,�������ж�ʹ��,��"admin"',
   ENABLED              varchar(2) default '1' comment '�Ƿ����0��1��',
   DESCRIPTION          varchar(255) comment '��ɫ����,UI������ʾʹ��',
   primary key (SID)
);

alter table TBL_SYS_ROLE comment '��ɫ��';

/*==============================================================*/
/* Table: TBL_SYS_RPERMISSION                                   */
/*==============================================================*/
create table TBL_SYS_RPERMISSION
(
   SID                  bigint not null auto_increment comment '����',
   CREATED_BY           varchar(32) default 'system' comment '������',
   CREATED_DT           datetime default CURRENT_TIMESTAMP comment '����ʱ��',
   VERSION              int default 1 comment '�汾',
   UPDATED_BY           varchar(32) default 'system' comment '������',
   UPDATED_DT           datetime default CURRENT_TIMESTAMP comment '����ʱ��',
   ROLE_SID             bigint comment '��ɫid',
   PERMISSION_SID       bigint comment 'Ȩ��id',
   ENABLED              varchar(2) default '1' comment '�Ƿ����0��1��',
   REMARK               varchar(255) comment '��ע',
   primary key (SID)
);

alter table TBL_SYS_RPERMISSION comment '��ɫȨ�ޱ�';

/*==============================================================*/
/* Table: TBL_SYS_ULOG                                          */
/*==============================================================*/
create table TBL_SYS_ULOG
(
   SID                  bigint not null auto_increment comment '����',
   CREATED_BY           varchar(32) default 'system' comment '������(�û���)',
   CREATED_DT           datetime default CURRENT_TIMESTAMP comment '����ʱ��(��¼ʱ��)',
   VERSION              int default 1 comment '�汾',
   UPDATED_BY           varchar(32) default 'system' comment '������(��¼��)',
   UPDATED_DT           datetime default CURRENT_TIMESTAMP comment '����ʱ��(��¼ʱ��)',
   USER_SID             bigint comment '�û�id',
   LOGIN_NAME           varchar(32) comment '�豸���(���ֻ�IMEI)',
   USER_NAME            varchar(32) comment '��¼�豸����(PC���ƶ���)',
   LOGIN_TIME           datetime default CURRENT_TIMESTAMP comment '��¼ʱ��',
   LOGIN_IP             varchar(128) comment '��¼IP',
   ENABLED              varchar(2) default '1' '�Ƿ����0��1��',
   REMARK               varchar(255),
   primary key (SID)
);

alter table TBL_SYS_ULOG comment '�û���¼��־��';

/*==============================================================*/
/* Table: TBL_SYS_UROLE                                         */
/*==============================================================*/
create table TBL_SYS_UROLE
(
   SID                  bigint not null auto_increment comment '����',
   CREATED_BY           varchar(32) default 'system' comment '������',
   CREATED_DT           datetime default CURRENT_TIMESTAMP comment '����ʱ��',
   VERSION              int default 1 comment '�汾',
   UPDATED_BY           varchar(32) default 'system' comment '������',
   UPDATED_DT           datetime default CURRENT_TIMESTAMP comment '����ʱ��',
   USER_SID             bigint comment '�û�id',
   ROLE_SID             bigint  comment '��ɫid',
   ENABLED              varchar(2) default '1' comment '�Ƿ����0��1��',
   REMARK               varchar(255) comment '��ע',
   primary key (SID)
);

alter table TBL_SYS_UROLE comment '�û���ɫ��';

/*==============================================================*/
/* Table: TBL_SYS_USER                                          */
/*==============================================================*/
create table TBL_SYS_USER
(
   SID                  bigint not null auto_increment comment '����',
   CREATED_BY           varchar(32) default 'system' comment '������',
   CREATED_DT           datetime default CURRENT_TIMESTAMP comment '����ʱ��',
   VERSION              int default 1 comment '�汾',
   UPDATED_BY           varchar(32) default 'system' comment '������',
   UPDATED_DT           datetime default CURRENT_TIMESTAMP comment '����ʱ��',
   USER_CODE            varchar(16) comment '�û�����',
   USER_NAME            varchar(32) comment '�û���',
   LOGIN_NAME           varchar(32) not null comment '��¼��',
   PASSWORD             varchar(128) not null comment '����',
   ENABLED              varchar(2) default '1' comment '�Ƿ����',
   REMARK               varchar(255) comment '��ע',
   primary key (SID)
);

alter table TBL_SYS_USER comment 'ϵͳ�û���';

