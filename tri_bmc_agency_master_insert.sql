DROP TRIGGER IF EXISTS tri_bmc_agency_master_insert;

DELIMITER $$

CREATE TRIGGER tri_bmc_agency_master_insert
AFTER INSERT
ON bmc_agency_master FOR EACH ROW
BEGIN
    INSERT INTO bmc_agency_master_hist (agency_id, zone_id, wc_id, agency_name, agency_address, agency_phone, agency_mail_id, cont_start_date, cont_end_date, description,created_by, created_date, updated_by, updated_date,is_active, tri_action)
    VALUES (new.agency_id, new.zone_id, new.wc_id, new.agency_name, new.agency_address, new.agency_phone, new.agency_mail_id, new.cont_start_date, new.cont_end_date, new.description,new.created_by, new.created_date,new. updated_by, new.updated_date,new.is_active, "INSERT");
END$$

DELIMITER ;
