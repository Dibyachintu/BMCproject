DROP TRIGGER IF EXISTS tri_bmc_goods_master_insert;

DELIMITER $$

CREATE TRIGGER tri_bmc_goods_master_insert
AFTER INSERT
ON bmc_goods_master FOR EACH ROW
BEGIN
    INSERT INTO bmc_goods_master_hist (goods_id, goods_name, goods_per_kg,goods_desc, created_by, created_date, updated_by, updated_date,is_active,tri_action)
    VALUES (new.goods_id, new.goods_name, new.goods_per_kg, new.goods_desc,  new.created_by, new.created_date, new.updated_by, new.updated_date,new.is_active, "INSERT");
END$$

DELIMITER ;

