DROP TRIGGER IF EXISTS tri_bmc_user_master_insert;

DELIMITER $$

CREATE TRIGGER tri_bmc_user_master_insert
AFTER INSERT
ON bmc_user_master FOR EACH ROW
BEGIN
    INSERT INTO bmc_user_master_hist (user_id, name, email_id,password,mobile_no,is_active,created_by, created_date, updated_by, updated_date,tri_action)
    VALUES (new.user_id, new.name, new.email_id,new.password,new.mobile_no,new.is_active,new.created_by, new.created_date, new.updated_by, new.updated_date, "INSERT");
END$$

DELIMITER ;



