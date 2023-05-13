DROP TRIGGER IF EXISTS tri_bmc_goods_master_delete;

DELIMITER $$

CREATE TRIGGER tri_bmc_goods_master_delete
AFTER DELETE
ON bmc_goods_master FOR EACH ROW
BEGIN
    INSERT INTO bmc_goods_master_hist (goods_id, goods_name, goods_per_kg,goods_desc, created_by, created_date, updated_by, updated_date,is_active,tri_action)
    VALUES (old.goods_id, old.goods_name, old.goods_per_kg, old.goods_desc,  old.created_by, old.created_date, old.updated_by, old.updated_date, old.is_active, "DELETE");
    
    -- Delete the corresponding row from the history table
    DELETE FROM bmc_goods_master_hist
    WHERE goods_id = OLD.goods_id;
END$$

DELIMITER ;
