DROP TRIGGER IF EXISTS tri_bmc_pit_master_insert;

DELIMITER $$

CREATE TRIGGER tri_bmc_pit_master_insert
AFTER INSERT
ON bmc_pit_master FOR EACH ROW
BEGIN
    INSERT INTO bmc_pit_master_hist (pit_id, pit_unique_id,pit_name,fk_wc_id,fk_mcc_id,pit_batch_id,pit_is_active,pit_desc, created_by, created_date, updated_by, updated_date,pit_cnd_sts,pit_cnd_sts_st_dt,pit_cnd_sts_end_dt,pit_cnd_remarks,tri_action)
    VALUES (new.pit_id, new.pit_unique_id,new.pit_name,new.fk_wc_id,new.fk_mcc_id,new.pit_batch_id,new.pit_is_active, new.created_by, new.created_date, new.updated_by, new.updated_date,new.pit_cnd_sts,new.pit_cnd_sts_st_dt,new.pit_cnd_sts_end_dt,new.pit_cnd_remarks, "INSERT");
END$$

DELIMITER ;

