DROP TRIGGER IF EXISTS tri_bmc_mrf_master_update;

DELIMITER $$
CREATE TRIGGER tri_bmc_mrf_master_update
AFTER UPDATE
ON bmc_mrf_master FOR EACH ROW
BEGIN
    -- Insert the old values into the history table
    INSERT INTO bmc_mrf_master_hist (mrf_id, fk_zone_id,fk_wc_id,mrf_name,mrf_desc,is_active, created_by, created_date, updated_by, updated_date,tri_action)
    VALUES (new.mrf_id, new.fk_zone_id,new.fk_wc_id,new.mrf_name,new.mrf_desc,new.is_active, new.created_by, new.created_date, new.updated_by, new.updated_date, "UPDATE");

    -- Update the corresponding row in the history table with the new values
    UPDATE bmc_mrf_master_hist
    SET mrf_id = NEW.mrf_id,
        fk_zone_id = NEW.fk_zone_id,
        fk_wc_id=NEW.fk_wc_id,
        mrf_name=NEW.mrf_name,
        mrf_desc=NEW.mrf_desc,
        is_active=NEW.is_active,
        created_by = NEW.created_by,
        created_date = NEW.created_date,
        updated_by = NEW.updated_by,
        updated_date = NEW.updated_date,
        tri_action = 'UPDATE'
    WHERE mrf_id = OLD.mrf_id;
END$$

DELIMITER ;
