DROP TRIGGER IF EXISTS tri_bmc_mcc_master_delete;
DELIMITER $$

CREATE TRIGGER tri_bmc_mcc_master_delete
AFTER DELETE
ON bmc_mcc_master
FOR EACH ROW
BEGIN
    -- Insert the deleted row into the history table
    INSERT INTO bmc_mcc_master_hist (mcc_id, fk_zone_id, fk_wc_id, mcc_desc, is_active, created_by, created_date, updated_by, updated_date, tri_action)
    VALUES (OLD.mcc_id, OLD.fk_zone_id, OLD.fk_wc_id, OLD.mcc_desc, OLD.is_active, OLD.created_by, OLD.created_date, OLD.updated_by, OLD.updated_date, "DELETE");
    
    -- Delete the corresponding row from the history table
    DELETE FROM bmc_mcc_master_hist
    WHERE mcc_id = OLD.mcc_id;
END$$

DELIMITER ;
