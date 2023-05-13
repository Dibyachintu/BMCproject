DROP TRIGGER IF EXISTS tri_bmc_goods_sub_master_update;

DELIMITER $$

CREATE TRIGGER tri_bmc_goods_sub_master_update
AFTER UPDATE
ON bmc_goods_sub_master FOR EACH ROW
BEGIN
    INSERT INTO bmc_goods_sub_master_hist (goods_sub_id, fk_goods_id, sub_goods_name, sub_goods_per_kg, sub_goods_desc, created_by, created_date, updated_by, updated_date, tri_action)
    VALUES (old.goods_sub_id, old.fk_goods_id, old.sub_goods_name, old.sub_goods_per_kg, old.sub_goods_desc, old.created_by, old.created_date, old.updated_by, old.updated_date, "UPDATE");
    
     UPDATE bmc_goods_sub_master_hist
SET goods_sub_id = NEW.goods_sub_id,
    fk_goods_id = NEW.fk_goods_id,
    sub_goods_name = NEW.sub_goods_name,
    sub_goods_per_kg = NEW.sub_goods_per_kg,
    sub_goods_desc = NEW.sub_goods_desc,
    created_by = NEW.created_by,
    created_date = NEW.created_date,
    updated_by = NEW.updated_by,
    updated_date = NEW.updated_date,
   
    tri_action = 'UPDATE'
WHERE goods_sub_id = OLD.goods_sub_id;
END$$

DELIMITER ;
