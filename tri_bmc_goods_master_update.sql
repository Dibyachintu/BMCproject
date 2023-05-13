DROP TRIGGER IF EXISTS tri_bmc_goods_master_update;

DELIMITER $$

CREATE TRIGGER tri_bmc_goods_master_update
AFTER UPDATE
ON bmc_goods_master FOR EACH ROW
BEGIN
    INSERT INTO bmc_goods_master_hist (goods_id, goods_name, goods_per_kg, goods_desc, created_by, created_date, updated_by, updated_date, is_active, tri_action)
    VALUES (OLD.goods_id, OLD.goods_name, OLD.goods_per_kg, OLD.goods_desc, OLD.created_by, OLD.created_date, OLD.updated_by, OLD.updated_date, OLD.is_active, "UPDATE");

    UPDATE bmc_goods_master_hist
    SET goods_id = NEW.goods_id,
        goods_name = NEW.goods_name,
        goods_per_kg = NEW.goods_per_kg,
        goods_desc = NEW.goods_desc,
        created_by = NEW.created_by,
        created_date = NEW.created_date,
        updated_by = NEW.updated_by,
        updated_date = NEW.updated_date,
        is_active = NEW.is_active,
        tri_action = 'UPDATE'
    WHERE goods_id = OLD.goods_id;
END$$

DELIMITER ;
