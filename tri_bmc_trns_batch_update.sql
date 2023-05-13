DROP TRIGGER IF EXISTS tri_bmc_trns_batch_update;

DELIMITER $$

CREATE TRIGGER tri_bmc_trns_batch_update
AFTER UPDATE
ON bmc_trns_batch FOR EACH ROW
BEGIN
    INSERT INTO bmc_trns_batch_hist (id, batch_id, fk_wc_id, fk_mcc_id, start_date, end_date, created_by, created_date, updated_by, updated_date, tri_action)
    VALUES (OLD.id, OLD.batch_id, OLD.fk_wc_id, OLD.fk_mcc_id, OLD.start_date, OLD.end_date, OLD.created_by, OLD.created_date, OLD.updated_by, OLD.updated_date, "UPDATE");
 UPDATE bmc_trns_batch_hist
SET id = NEW.id,
    batch_id = NEW.batch_id,
    fk_wc_id = NEW.fk_wc_id,
    fk_mcc_id = NEW.fk_mcc_id,
    start_date = NEW.start_date,
    end_date = NEW.end_date,
    created_by = NEW.created_by,
    created_date = NEW.created_date,
    updated_by = NEW.updated_by,
    updated_date = NEW.updated_date,
    tri_action = 'UPDATE'
WHERE id = OLD.id;
END$$

DELIMITER ;
