Create Table `ap_bill_header`
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
 KEY `idx_ap_bill_header_vendor_code`(`vendor_code`),
)
DEFAULT CHARACTER SET = utf8
COMMENT = '账单头表';

