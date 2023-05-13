DROP TRIGGER IF EXISTS tri_bmc_wc_master_delete;

DELIMITER $$

CREATE TRIGGER tri_bmc_wc_master_delete
AFTER DELETE
ON bmc_wc_master FOR EACH ROW
BEGIN
    INSERT INTO bmc_agency_master_hist (wc_id, fk_zone_id, wc_name, wc_desc, is_active, created_by, created_date, updated_by, updated_date, tri_action)
    VALUES (old.wc_id, old.fk_zone_id, old.wc_name, old.wc_desc, old.is_active, old.created_by, old.created_date, old.updated_by, old.updated_date, "DELETE");
    
     -- Delete the corresponding row from the history table
    DELETE FROM bmc_agency_master_hist
    WHERE wc_id = OLD.wc_id;
END$$

DELIMITER ;
