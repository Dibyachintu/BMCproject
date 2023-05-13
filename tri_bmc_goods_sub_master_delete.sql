DROP TRIGGER IF EXISTS tri_bmc_goods_sub_master_delete;

DELIMITER $$

CREATE TRIGGER tri_bmc_goods_sub_master_delete
AFTER DELETE
ON bmc_goods_sub_master FOR EACH ROW
BEGIN
    INSERT INTO bmc_goods_sub_master_hist (goods_sub_id, fk_goods_id, sub_goods_name, sub_goods_per_kg, sub_goods_desc, created_by, created_date, updated_by, updated_date, tri_action)
    VALUES (old.goods_sub_id, old.fk_goods_id, old.sub_goods_name, old.sub_goods_per_kg, old.sub_goods_desc, old.created_by, old.created_date, old.updated_by, old.updated_date, "DELETE");
    
    -- Delete the corresponding row from the history table
    DELETE FROM bmc_goods_sub_master_hist
    WHERE goods_sub_id = OLD.goods_sub_id;
END$$

DELIMITER ;
