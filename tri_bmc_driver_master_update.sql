DROP TRIGGER IF EXISTS tri_bmc_driver_master_update;

DELIMITER $$

CREATE TRIGGER tri_bmc_driver_master_update
AFTER UPDATE
ON bmc_driver_master FOR EACH ROW
BEGIN
INSERT INTO bmc_driver_master_hist (driver_id, fk_wc_id, driver_name, driver_photo, phone_no, dl_no, dl_photo, dl_expiry, address, dl_desc, is_active, created_by, created_date, updated_by, updated_date, tri_action)
VALUES (NEW.driver_id, NEW.fk_wc_id, NEW.driver_name, NEW.driver_photo, NEW.phone_no, NEW.dl_no, NEW.dl_photo, NEW.dl_expiry, NEW.address, NEW.dl_desc, NEW.is_active, NEW.created_by, NEW.created_date, NEW.updated_by, NEW.updated_date, "UPDATE");

UPDATE bmc_driver_master_hist
SET driver_id = NEW.driver_id,
    fk_wc_id = NEW.fk_wc_id,
    driver_name = NEW.driver_name,
    driver_photo = NEW.driver_photo,
    phone_no = NEW.phone_no,
    dl_no = NEW.dl_no,
    dl_photo = NEW.dl_photo,
    dl_expiry = NEW.dl_expiry,
    address = NEW.address,
    dl_desc = NEW.dl_desc,
    is_active = NEW.is_active,
    created_by = NEW.created_by,
    created_date = NEW.created_date,
    updated_by = NEW.updated_by,
    updated_date = NEW.updated_date,
    tri_action = 'UPDATE'
WHERE driver_id = OLD.driver_id;
END$$

DELIMITER ;