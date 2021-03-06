create table t_lis_translog
(
   id                   int not null auto_increment,
   barcode_id           varchar(100) not null,
   order_id             varchar(100)  not null,
   element_assem_id     varchar(100) not null,
   element_assem_name   varchar(100) not null,
   username             varchar(100),
   sex_name             varchar(10),
   age                  varchar(10),
   operator_id          varchar(100),
   operator_name        varchar(100),
   is_successfull       int,
   trans_msg            varchar(4000),
   sample_date          datetime,
   trans_date           datetime default CURRENT_TIMESTAMP,
   trans_time           datetime default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   primary key (id)
);

/*==============================================================*/
/* Index: idx_lis_translog_barcode_id                           */
/*==============================================================*/
create index idx_lis_translog_barcode_id on t_lis_translog
(
   barcode_id
);

/*==============================================================*/
/* Index: idx_lis_translog_order_id                             */
/*==============================================================*/
create index idx_lis_translog_order_id on t_lis_translog
(
   order_id
);

GRANT SELECT,INSERT,DELETE,UPDATE ON jk.t_lis_translog TO lis@'%';