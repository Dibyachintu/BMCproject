DROP TRIGGER IF EXISTS tri_bmc_agency_master_update;

DELIMITER $$

CREATE TRIGGER tri_bmc_agency_master_update
AFTER UPDATE
ON bmc_agency_master FOR EACH ROW
BEGIN
    INSERT INTO bmc_agency_master_hist (agency_id, zone_id, wc_id, agency_name, agency_address, 
    agency_phone, agency_mail_id, cont_start_date, cont_end_date, description, created_by, 
    created_date, updated_by, updated_date, is_active, tri_action)
    VALUES (OLD.agency_id, OLD.zone_id, OLD.wc_id, OLD.agency_name, OLD.agency_address, OLD.agency_phone, OLD.agency_mail_id, OLD.cont_start_date, OLD.cont_end_date, OLD.description, NEW.created_by, NEW.created_date, NEW.updated_by, NEW.updated_date, NEW.is_active, "UPDATE");
    
    UPDATE bmc_agency_master_hist
SET agency_id = NEW.agency_id,
    zone_id = NEW.zone_id,
    wc_id = NEW.wc_id,
    agency_name = NEW.agency_name,
    agency_address = NEW.agency_address,
    agency_phone = NEW.agency_phone,
    agency_mail_id = NEW.agency_mail_id,
    cont_start_date = NEW.cont_start_date,
    cont_end_date = NEW.cont_end_date,
    description = NEW.description,
    created_by = NEW.created_by,
    created_date = NEW.created_date,
    updated_by = NEW.updated_by,
    updated_date = NEW.updated_date,
    is_active = NEW.is_active,
    tri_action = 'UPDATE'
WHERE agency_id = OLD.agency_id;
END$$

DELIMITER ;