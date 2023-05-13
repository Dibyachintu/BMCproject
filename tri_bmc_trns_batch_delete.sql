DROP TRIGGER IF EXISTS tri_bmc_trns_batch_delete;

DELIMITER $$

CREATE TRIGGER tri_bmc_trns_batch_delete
AFTER DELETE
ON bmc_trns_batch FOR EACH ROW
BEGIN
    INSERT INTO bmc_trns_batch_hist (id, batch_id, fk_wc_id, fk_mcc_id, start_date, end_date, created_by, created_date, updated_by, updated_date, tri_action)
    VALUES (OLD.id, OLD.batch_id, OLD.fk_wc_id, OLD.fk_mcc_id, OLD.start_date, OLD.end_date, OLD.created_by, OLD.created_date, OLD.updated_by, OLD.updated_date, "DELETE");

    -- Delete the corresponding row from the history table
    DELETE FROM bmc_trns_batch_hist
    WHERE id = OLD.id;
END$$

DELIMITER ;
