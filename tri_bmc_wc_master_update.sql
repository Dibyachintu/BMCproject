DROP TRIGGER IF EXISTS tri_bmc_wc_master_update;

DELIMITER $$

CREATE TRIGGER tri_bmc_wc_master_update
AFTER UPDATE
ON bmc_wc_master FOR EACH ROW
BEGIN
    -- Insert the old record into the history table before update
    INSERT INTO bmc_agency_master_hist (wc_id, fk_zone_id, wc_name, wc_desc, is_active, created_by, created_date, updated_by, updated_date, tri_action)
    VALUES (OLD.wc_id, OLD.fk_zone_id, OLD.wc_name, OLD.wc_desc, OLD.is_active, OLD.created_by, OLD.created_date, OLD.updated_by, OLD.updated_date, "UPDATE_BEFORE");

    -- Insert the new record into the history table after update
    INSERT INTO bmc_agency_master_hist (wc_id, fk_zone_id, wc_name, wc_desc, is_active, created_by, created_date, updated_by, updated_date, tri_action)
    VALUES (NEW.wc_id, NEW.fk_zone_id, NEW.wc_name, NEW.wc_desc, NEW.is_active, NEW.created_by, NEW.created_date, NEW.updated_by, NEW.updated_date, "UPDATE_AFTER");
    
    -- Update the corresponding row in the history table with the new values
    UPDATE bmc_user_role_master_hist
    SET wc_id = NEW.wc_id,
        fk_zone_id = NEW.fk_zone_id,
        wc_name=NEW.wc_name,
        is_active=NEW.is_active,
        created_by = NEW.created_by,
        created_date = NEW.created_date,
        updated_by = NEW.updated_by,
        updated_date = NEW.updated_date,
        tri_action = 'UPDATE'
    WHERE wc_id = OLD.wc_id;
END$$

DELIMITER ;
