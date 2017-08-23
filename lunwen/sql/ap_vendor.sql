Create Table `inv_transaction`
(
 `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '表ID，自增',
 `db_no` VARCHAR(30) NOT NULL Default '' COMMENT '分库编号',
 `vendor_code` VARCHAR(30) BINARY NOT NULL Default '' COMMENT '供应商编码',
 `transaction_id` BIGINT NOT NULL Default 0 COMMENT '事务处理ID',
 `warehouse` VARCHAR(20) NOT NULL Default '' COMMENT '出货仓库代码',
 `detail_line_type` VARCHAR(30) NOT NULL Default '' COMMENT '明细行代码，即数据类型
如 DR_SUP（入库）
   CR_SUP（退供）
   DR_CUST（客退）
   OTHER（其他） ',
 `detail_line_name` VARCHAR(240) NOT NULL Default '' COMMENT '账单明细行名称 如：“其他”',
 `transaction_date` TIMESTAMP NOT NULL Default '1970-01-02 00:00:00' COMMENT '事务处理日期',
 `trx_creation_date` TIMESTAMP NOT NULL Default '1970-01-02 00:00:00' COMMENT '事务处理创建日期',
 `vendor_name` VARCHAR(240) NOT NULL Default '' COMMENT '供应商名称',
 `order_num` VARCHAR(30) NOT NULL Default '' COMMENT 'order_num',
 `order_date` TIMESTAMP NOT NULL Default '1970-01-02 00:00:00' COMMENT '下单日期',
 `po_no` VARCHAR(20) BINARY NOT NULL Default '' COMMENT 'PO编号',
 `item_no` VARCHAR(50) BINARY NOT NULL Default '' COMMENT 'SKU',
 `item_description` VARCHAR(240) NOT NULL Default '' COMMENT 'SKU名称',
 `quantity` DECIMAL(10,4) NOT NULL Default 0 COMMENT '事务处理数量',
 `data_sign` INT NOT NULL Default 0 COMMENT '数据标识，1，-1,0',
 `bill_price` DECIMAL(20,6) COMMENT '结算不含税价',
 `tax_code` VARCHAR(30) NOT NULL Default '' COMMENT '税码',
 `tax_rate` DECIMAL(10,4) NOT NULL Default 0 COMMENT '税率',
 `bill_amount` DECIMAL(20,8) COMMENT '结算不含税金额',
 `source_status` VARCHAR(20) NOT NULL Default 'NEW' COMMENT 'NEW',
 `create_time` TIMESTAMP(3) NOT NULL Default CURRENT_TIMESTAMP(3) COMMENT '创建日期',
 `update_time` TIMESTAMP(3) NOT NULL Default CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '最后更新日期',
 PRIMARY KEY (`id`),
 KEY `idx_inv_transaction_vendor_code`(`vendor_code`),
 KEY `idx_inv_transaction_item_no`(`item_no`),
 KEY `idx_inv_transaction_po_no`(`po_no`)
)
DEFAULT CHARACTER SET = utf8
COMMENT = '库存事务处理表';


Create Table `bill_detail`
(
 `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '表ID，自增',
 `line_id` BIGINT  NOT NULL COMMENT '行表ID',
 `db_no` VARCHAR(30) NOT NULL Default '' COMMENT '分库编号',
 `vendor_code` VARCHAR(30) BINARY NOT NULL Default '' COMMENT '供应商编码',
 `transaction_id` BIGINT NOT NULL Default 0 COMMENT '事务处理ID',
 `warehouse` VARCHAR(20) NOT NULL Default '' COMMENT '出货仓库代码',
 `detail_line_type` VARCHAR(30) NOT NULL Default '' COMMENT '明细行代码，即数据类型
如 DR_SUP（入库）
   CR_SUP（退供）
   DR_CUST（客退）
   OTHER（其他） ',
 `detail_line_name` VARCHAR(240) NOT NULL Default '' COMMENT '账单明细行名称 如：“其他”',
 `transaction_date` TIMESTAMP NOT NULL Default '1970-01-02 00:00:00' COMMENT '事务处理日期',
 `trx_creation_date` TIMESTAMP NOT NULL Default '1970-01-02 00:00:00' COMMENT '事务处理创建日期',
 `vendor_name` VARCHAR(240) NOT NULL Default '' COMMENT '供应商名称',
 `order_num` VARCHAR(30) NOT NULL Default '' COMMENT 'order_num',
 `order_date` TIMESTAMP NOT NULL Default '1970-01-02 00:00:00' COMMENT '下单日期',
 `po_no` VARCHAR(20) BINARY NOT NULL Default '' COMMENT 'PO编号',
 `item_no` VARCHAR(50) BINARY NOT NULL Default '' COMMENT 'SKU',
 `item_description` VARCHAR(240) NOT NULL Default '' COMMENT 'SKU名称',
 `quantity` DECIMAL(10,4) NOT NULL Default 0 COMMENT '事务处理数量',
 `data_sign` INT NOT NULL Default 0 COMMENT '数据标识，1，-1,0',
 `bill_price` DECIMAL(20,6) COMMENT '结算不含税价',
 `bill_tax_price` DECIMAL(20,6) COMMENT '结算含税价',
 `tax_code` VARCHAR(30) NOT NULL Default '' COMMENT '税码',
 `tax_rate` DECIMAL(10,4) NOT NULL Default 0 COMMENT '税率',
 `bill_amount` DECIMAL(20,8) COMMENT '结算不含税金额',
 `total_bill_amount` DECIMAL(20,8) COMMENT '结算含税金额',
 `bill_number` VARCHAR(50) NOT NULL Default '' COMMENT '账单编号',
 `header_id` BIGINT NOT NULL Default 0 COMMENT '账单头ID',
 `source_status` VARCHAR(20) NOT NULL Default 'NEW' COMMENT 'NEW',
 `create_time` TIMESTAMP(3) NOT NULL Default CURRENT_TIMESTAMP(3) COMMENT '创建日期',
 `update_time` TIMESTAMP(3) NOT NULL Default CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '最后更新日期',
 PRIMARY KEY (`id`),
 KEY `idx_bill_detail_vendor_code`(`vendor_code`),
 KEY `idx_bill_detail_item_no`(`item_no`),
 KEY `idx_bill_detail_po_no`(`po_no`),
 KEY `idx_bill_detail_stage_bill_header_id`(`header_id`)
)
DEFAULT CHARACTER SET = utf8
COMMENT = '账单明细表';

Create Table `bill_line`
(
 `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '表ID，自增',
 `db_no` VARCHAR(30) NOT NULL Default '' COMMENT '分库编号',
 `vendor_code` VARCHAR(30) BINARY NOT NULL Default '' COMMENT '供应商编码',
 `detail_line_type` VARCHAR(30) NOT NULL Default '' COMMENT '明细行代码，即数据类型
如 DR_SUP（入库）
   CR_SUP（退供）
   DR_CUST（客退）
   OTHER（其他） ',
 `detail_line_name` VARCHAR(240) NOT NULL Default '' COMMENT '账单明细行名称 如：“其他”',
 `vendor_name` VARCHAR(240) NOT NULL Default '' COMMENT '供应商名称',
 `po_no` VARCHAR(20) BINARY NOT NULL Default '' COMMENT 'PO编号',
 `data_sign` INT NOT NULL Default 0 COMMENT '数据标识，1，-1,0',
 `tax_code` VARCHAR(30) NOT NULL Default '' COMMENT '税码',
 `tax_rate` DECIMAL(10,4) NOT NULL Default 0 COMMENT '税率',
 `bill_amount` DECIMAL(20,8) COMMENT '结算不含税金额',
 `total_bill_amount` DECIMAL(20,8) COMMENT '结算含税金额',
 `bill_number` VARCHAR(50) NOT NULL Default '' COMMENT '账单编号',
 `header_id` BIGINT NOT NULL Default 0 COMMENT '账单头ID',
 `source_status` VARCHAR(20) NOT NULL Default 'NEW' COMMENT 'NEW',
 `create_time` TIMESTAMP(3) NOT NULL Default CURRENT_TIMESTAMP(3) COMMENT '创建日期',
 `update_time` TIMESTAMP(3) NOT NULL Default CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '最后更新日期',
 PRIMARY KEY (`id`),
 KEY `idx_bill_line_vendor_code`(`vendor_code`),
 KEY `idx_bill_line_po_no`(`po_no`),
 KEY `idx_bill_line_stage_bill_header_id`(`header_id`)
)
DEFAULT CHARACTER SET = utf8
COMMENT = '账单行表';


