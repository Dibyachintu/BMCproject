DROP TRIGGER IF EXISTS tri_bmc_user_master_delete;

DELIMITER $$
CREATE TRIGGER tri_bmc_user_master_delete
AFTER DELETE
ON bmc_user_master FOR EACH ROW
BEGIN
    INSERT INTO bmc_user_master_hist (user_id, name, email_id,password,mobile_no,is_active,created_by, created_date, updated_by, updated_date,tri_action)
    VALUES (old.user_id, old.name, old.email_id, old.password, old.mobile_no, old.is_active, old.created_by, old.created_date, old.updated_by, old.updated_date, "DELETE");
    
      -- Delete the corresponding row from the history table
    DELETE FROM bmc_user_master_hist
    WHERE user_id = OLD.user_id;
END$$
DELIMITER ;
