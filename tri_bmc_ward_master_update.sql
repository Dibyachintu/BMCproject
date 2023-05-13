DROP TRIGGER IF EXISTS tri_ward_master_update;

DELIMITER $$
CREATE TRIGGER tri_bmc_ward_master_update
AFTER UPDATE
ON bmc_ward_master FOR EACH ROW
BEGIN
    -- Insert the old values into the history table
    INSERT INTO bmc_ward_master_hist (ward_id, fk_zone_id,fk_wc_id,ward_name,ward_desc,is_active,created_by, created_date, updated_by, updated_date,tri_action)
    VALUES (new.ward_id, new.fk_zone_id,new.fk_wc_id,new.ward_name,new.ward_desc, new.created_by, new.created_date, new.updated_by, new.updated_date, "UPDATE");

    -- Update the corresponding row in the history table with the new values
    UPDATE bmc_ward_master_hist
    SET ward_id = NEW.ward_id,
        fk_zone_id = NEW.fk_zone_id,
        fk_wc_id=NEW.fk_wc_id,
        ward_name=NEW.ward_name,
        ward_desc=NEW.ward_desc,
        is_active=NEW.is_active,
        created_by = NEW.created_by,
        created_date = NEW.created_date,
        updated_by = NEW.updated_by,
        updated_date = NEW.updated_date,
		tri_action = 'UPDATE'
    WHERE ward_id = OLD.ward_id;
END$$

DELIMITER ;
