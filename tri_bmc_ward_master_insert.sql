

DROP TRIGGER IF EXISTS tri_bmc_ward_master_insert;

DELIMITER $$

CREATE TRIGGER tri_bmc_ward_master_insert
AFTER INSERT
ON bmc_ward_master FOR EACH ROW
BEGIN
    INSERT INTO bmc_ward_master_hist (ward_id, fk_zone_id,fk_wc_id,ward_name,ward_desc,is_active,created_by, created_date, updated_by, updated_date,tri_action)
    VALUES (new.ward_id, new.fk_zone_id,new.fk_wc_id,new.ward_name,new.ward_desc, new.created_by, new.created_date, new.updated_by, new.updated_date, "INSERT");
END$$

DELIMITER ;



