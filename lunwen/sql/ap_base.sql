Create Table `bill_header`
(
 `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '表ID，自增',
 `db_no` VARCHAR(30) NOT NULL Default '' COMMENT '分库编号',
 `bill_number` VARCHAR(50) NOT NULL Default '' COMMENT '账单编号',
 `bill_date` DATE NOT NULL Default '1970-01-02' COMMENT '账单日期',
 `period_name` VARCHAR(20) NOT NULL Default '' COMMENT '账单期间',
 `vendor_code` VARCHAR(30) BINARY NOT NULL Default '' COMMENT '供应商编码',
 `vendor_name` VARCHAR(240) NOT NULL Default '' COMMENT '供应商名称',
 `bill_amount` DECIMAL(20,8) COMMENT '结算不含税金额',
 `total_bill_amount` DECIMAL(20,8) COMMENT '结算含税金额',
 `source_status` VARCHAR(20) NOT NULL Default 'NEW' COMMENT 'NEW',
 `create_time` TIMESTAMP(3) NOT NULL Default CURRENT_TIMESTAMP(3) COMMENT '创建日期',
 `update_time` TIMESTAMP(3) NOT NULL Default CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '最后更新日期',
 PRIMARY KEY (`id`),
 KEY `idx_bill_header_vendor_code`(`vendor_code`)
)
DEFAULT CHARACTER SET = utf8
COMMENT = '账单头表';


Create Table `vendor_index`
(
 `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '表ID，主键',
 `vendor_code` VARCHAR(30) BINARY NOT NULL Default '' COMMENT '供应商代码',
 `db_no` VARCHAR(30) NOT NULL Default '' COMMENT '分库编号',
 `create_time` TIMESTAMP(3) NOT NULL Default CURRENT_TIMESTAMP(3) COMMENT '创建日期',
 `update_time` TIMESTAMP(3) NOT NULL Default CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '最后更新日期',
 `is_deleted` TINYINT NOT NULL Default 0 COMMENT '软删除标识（0:未删除,1:已删除）',
 PRIMARY KEY (`id`),
 UNIQUE `uniq_vendor_index_vendor_code`(`vendor_code`)
)
DEFAULT CHARACTER SET = utf8
COMMENT = '供应商分库索引表';

Create Table `po_blacklist`
(
 `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '表ID，主键',
 `po_no` VARCHAR(20) BINARY NOT NULL Default '' COMMENT 'PO号',
 `create_time` TIMESTAMP(3) NOT NULL Default CURRENT_TIMESTAMP(3) COMMENT '创建日期',
 `update_time` TIMESTAMP(3) NOT NULL Default CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '最后更新日期',
 `is_deleted` TINYINT NOT NULL Default 0 COMMENT '软删除标识（0:未删除,1:已删除）',
 PRIMARY KEY (`id`),
 UNIQUE `uniq_po_blacklist_po_no`(`po_no`)
)
DEFAULT CHARACTER SET = utf8
COMMENT = '黑名单PO';
