DROP TRIGGER IF EXISTS tri_bmc_agency_master_delete;

DELIMITER $$

CREATE TRIGGER tri_bmc_agency_master_delete
AFTER DELETE
ON bmc_agency_master FOR EACH ROW
BEGIN
INSERT INTO bmc_agency_master_hist (agency_id, zone_id, wc_id, agency_name, agency_address,
agency_phone, agency_mail_id, cont_start_date, cont_end_date, description, created_by,
created_date, updated_by, updated_date, is_active, tri_action)
VALUES (OLD.agency_id, OLD.zone_id, OLD.wc_id, OLD.agency_name, OLD.agency_address, OLD.agency_phone, OLD.agency_mail_id, OLD.cont_start_date, OLD.cont_end_date, OLD.description, OLD.created_by, OLD.created_date, OLD.updated_by, OLD.updated_date, OLD.is_active, "DELETE");

-- Delete the corresponding row from the history table
    DELETE FROM bmc_agency_master_hist
    WHERE agency_id = OLD.agency_id;
END$$

DELIMITER ;