DROP TRIGGER IF EXISTS tri_bmc_pit_transaction_delete;

DELIMITER $$

CREATE TRIGGER tri_bmc_pit_transaction_delete
AFTER DELETE
ON bmc_pit_transaction FOR EACH ROW
BEGIN
    INSERT INTO bmc_pit_transaction_master_hist (pit_transaction_id, batch_id, fk_wc_id, fk_mcc_id, fk_pit_id, pit_unique_id, fk_pit_process_is_active, segregation, visual_inspection, mixed_enzyme, shreading, transfer_to_pit, inert_material, is_filledup, filedup_dt, merg_6_8_days_thrs_dt, mix_up_14_16_days_dt, mix_up_20_22_days_dt, mix_up_28_days_dt, created_by, created_date, updated_by, updated_date, tri_action)
    VALUES (OLD.pit_transaction_id, OLD.batch_id, OLD.fk_wc_id, OLD.fk_mcc_id, OLD.fk_pit_id, OLD.pit_unique_id, OLD.fk_pit_process_is_active, OLD.segregation, OLD.visual_inspection, OLD.mixed_enzyme, OLD.shreading, OLD.transfer_to_pit, OLD.inert_material, OLD.is_filledup, OLD.filedup_dt, OLD.merg_6_8_days_thrs_dt, OLD.mix_up_14_16_days_dt, OLD.mix_up_20_22_days_dt, OLD.mix_up_28_days_dt, OLD.created_by, OLD.created_date, OLD.updated_by, OLD.updated_date, "DELETE");
    
    -- Delete the corresponding row from the history table
    DELETE FROM bmc_pit_transaction_master_hist
    WHERE pit_transaction_id = OLD.pit_transaction_id;
END$$

DELIMITER ;
