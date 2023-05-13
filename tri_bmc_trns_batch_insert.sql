DROP TRIGGER IF EXISTS tri_bmc_trns_batch_insert;

DELIMITER $$

CREATE TRIGGER tri_bmc_trns_batch_insert
AFTER INSERT
ON bmc_trns_batch FOR EACH ROW
BEGIN
    INSERT INTO bmc_trns_batch_hist (id, batch_id, fk_wc_id, fk_mcc_id, start_date, end_date,created_by, created_date, updated_by, updated_date,tri_action)
    VALUES (new.id, new.batch_id, new.fk_wc_id, new.fk_mcc_id, new.start_date, new.end_date,new.created_by, new.created_date,new. updated_by, new.updated_date, "INSERT");
END$$

DELIMITER ;
