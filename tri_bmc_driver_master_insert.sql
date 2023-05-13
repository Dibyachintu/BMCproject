DROP TRIGGER IF EXISTS tri_bmc_driver_master_insert;

DELIMITER $$

CREATE TRIGGER tri_bmc_driver_master_insert
AFTER INSERT
ON bmc_driver_master FOR EACH ROW
BEGIN
    INSERT INTO bmc_driver_master_hist (driver_id, fk_wc_id, driver_name, driver_photo, phone_no, dl_no, dl_photo, dl_expiry, address, dl_desc, is_active, created_by, created_date, updated_by, updated_date, tri_action)
    VALUES (new.driver_id, new.fk_wc_id, new.driver_name, new.driver_photo, new.phone_no, new.dl_no, new.dl_photo, new.dl_expiry, new.address, new.dl_desc, new.is_active, new.created_by, new.created_date, new.updated_by, new.updated_date, "INSERT");
END$$

DELIMITER ;
