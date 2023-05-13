DROP TRIGGER IF EXISTS tri_bmc_pit_master_delete;

DELIMITER $$
CREATE TRIGGER tri_bmc_pit_master_delete
AFTER DELETE
ON bmc_pit_master FOR EACH ROW
BEGIN
    -- Insert the deleted row into the history table
    INSERT INTO bmc_pit_master_hist (pit_id, pit_unique_id,pit_name,fk_wc_id,fk_mcc_id,pit_batch_id,pit_is_active,pit_desc, created_by, created_date, updated_by, updated_date,pit_cnd_sts,pit_cnd_sts_st_dt,pit_cnd_sts_end_dt,pit_cnd_remarks,tri_action)
    VALUES (OLD.pit_id, OLD.pit_unique_id, OLD.pit_name, OLD.fk_wc_id, OLD.fk_mcc_id, OLD.pit_batch_id, OLD.pit_is_active, OLD.created_by, OLD.created_date, OLD.updated_by, OLD.updated_date, OLD.pit_cnd_sts, OLD.pit_cnd_sts_st_dt, OLD.pit_cnd_sts_end_dt, OLD.pit_cnd_remarks, "DELETE");
    
    -- Delete the corresponding row from the history table
    DELETE FROM bmc_pit_master_hist
    WHERE pit_id = OLD.pit_id;
END$$

DELIMITER ;
