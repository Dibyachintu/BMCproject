DROP TRIGGER IF EXISTS tri_bmc_wc_master_insert;

DELIMITER $$

CREATE TRIGGER tri_bmc_wc_master_insert
AFTER INSERT
ON bmc_wc_master FOR EACH ROW
BEGIN
    INSERT INTO bmc_agency_master_hist (wc_id, fk_zone_id, wc_name, wc_desc, is_active,created_by, created_date, updated_by, updated_date, tri_action)
    VALUES (new.wc_id, new.fk_zone_id, new.wc_name, new.wc_desc, new.is_active,new.created_by, new.created_date, new.updated_by, new.updated_date, "INSERT");
END$$

DELIMITER ;
