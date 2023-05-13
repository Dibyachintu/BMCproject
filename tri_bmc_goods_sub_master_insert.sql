DROP TRIGGER IF EXISTS tri_bmc_goods_sub_master_insert;

DELIMITER $$

CREATE TRIGGER tri_bmc_goods_sub_master_insert
AFTER INSERT
ON bmc_goods_sub_master FOR EACH ROW
BEGIN
    INSERT INTO bmc_goods_sub_master_hist (goods_sub_id, fk_goods_id, sub_goods_name, sub_goods_per_kg, sub_goods_desc,created_by, created_date, updated_by, updated_date, tri_action)
    VALUES (new.goods_sub_id, new.fk_goods_id, new.sub_goods_name, new.sub_goods_per_kg, new.sub_goods_desc,new.created_by, new.created_date,new. updated_by, new.updated_date, "INSERT");
END$$

DELIMITER ;
