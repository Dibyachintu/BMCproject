DROP TRIGGER IF EXISTS tri_bmc_driver_master_delete;

DELIMITER $$

CREATE TRIGGER tri_bmc_driver_master_delete
AFTER DELETE
ON bmc_driver_master FOR EACH ROW
BEGIN
INSERT INTO bmc_driver_master_hist (driver_id, fk_wc_id, driver_name, driver_photo, phone_no, dl_no, dl_photo, dl_expiry, address, dl_desc, is_active, created_by, created_date, updated_by, updated_date, tri_action)
VALUES (old.driver_id, old.fk_wc_id, old.driver_name, old.driver_photo, old.phone_no, old.dl_no, old.dl_photo, old.dl_expiry, old.address, old.dl_desc, old.is_active, old.created_by, old.created_date, old.updated_by, old.updated_date, "DELETE");

-- Delete the corresponding row from the history table
    DELETE FROM bmc_driver_master_hist
    WHERE driver_id = OLD.driver_id;
END$$

DELIMITER ;