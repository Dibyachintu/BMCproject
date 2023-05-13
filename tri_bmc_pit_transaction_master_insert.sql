DROP TRIGGER IF EXISTS tri_bmc_pit_transaction_insert;

DELIMITER $$

CREATE TRIGGER tri_bmc_pit_transaction_insert
AFTER INSERT
ON bmc_pit_transaction FOR EACH ROW
BEGIN
    INSERT INTO bmc_pit_transaction_master_hist (pit_transaction_id, batch_id, fk_wc_id, fk_mcc_id, fk_pit_id, pit_unique_id, fk_pit_process_is_active, segregation, visual_inspection, mixed_enzyme, shreading, transfer_to_pit, inert_material, is_filledup, filedup_dt, merg_6_8_days_thrs_dt, mix_up_14_16_days_dt, mix_up_20_22_days_dt, mix_up_28_days_dt, created_by, created_date, updated_by, updated_date, tri_action)
    VALUES (new.pit_transaction_id, new.batch_id, new.fk_wc_id, new.fk_mcc_id, new.fk_pit_id, new.pit_unique_id, new.fk_pit_process_is_active, new.segregation, new.visual_inspection, new.mixed_enzyme, new.shreading, new.transfer_to_pit, new.inert_material, new.is_filledup, new.filedup_dt, new.merg_6_8_days_thrs_dt, new.mix_up_14_16_days_dt, new.mix_up_20_22_days_dt, new.mix_up_28_days_dt, new.created_by, new.created_date, new.updated_by, new.updated_date, "INSERT");
END$$

DELIMITER ;

