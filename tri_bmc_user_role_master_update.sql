DROP TRIGGER IF EXISTS tri_bmc_user_role_master_update;

DELIMITER $$
CREATE TRIGGER tri_bmc_user_role_master_update
AFTER UPDATE
ON bmc_user_role_master FOR EACH ROW
BEGIN
    -- Insert the old values into the history table
    INSERT INTO bmc_user_role_master_hist (id, role_name,is_active, created_by, created_date, updated_by, updated_date,tri_action)
    VALUES (new.id, new.role_name,new.is_active, new.created_by, new.created_date, new.updated_by, new.updated_date, "UPDATE");

    -- Update the corresponding row in the history table with the new values
    UPDATE bmc_user_role_master_hist
    SET id = NEW.id,
        role_name = NEW.role_name,
        is_active=NEW.is_active,
        created_by = NEW.created_by,
        created_date = NEW.created_date,
        updated_by = NEW.updated_by,
        updated_date = NEW.updated_date,
        is_active = NEW.is_active,
        tri_action = 'UPDATE'
    WHERE id = OLD.id;
END$$

DELIMITER ;
