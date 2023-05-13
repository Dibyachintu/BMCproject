
DROP TRIGGER IF EXISTS tri_bmc_user_role_master_delete;
DELIMITER $$

CREATE TRIGGER tri_bmc_user_role_master_delete
AFTER DELETE
ON bmc_user_role_master
FOR EACH ROW
BEGIN
    -- Insert the deleted row into the history table
    INSERT INTO bmc_user_role_master_hist (id, role_name, is_active, created_by, created_date, updated_by, updated_date,tri_action)
    VALUES (OLD.id, OLD.role_name, OLD.is_active, OLD.created_by, OLD.created_date, OLD.updated_by, OLD.updated_date,OLD.tri_action);
    
    -- Delete the corresponding row from the history table
    DELETE FROM bmc_user_role_master_hist
    WHERE id = OLD.id;
END$$

DELIMITER ;
