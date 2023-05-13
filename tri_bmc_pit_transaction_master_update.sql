DROP TRIGGER IF EXISTS tri_bmc_pit_transaction_update;

DELIMITER $$

CREATE TRIGGER tri_bmc_pit_transaction_update
AFTER UPDATE
ON bmc_pit_transaction FOR EACH ROW
BEGIN
    INSERT INTO bmc_pit_transaction_master_hist (pit_transaction_id, batch_id, fk_wc_id, fk_mcc_id, fk_pit_id, pit_unique_id, fk_pit_process_is_active, segregation, visual_inspection, mixed_enzyme, shreading, transfer_to_pit, inert_material, is_filledup, filedup_dt, merg_6_8_days_thrs_dt, mix_up_14_16_days_dt, mix_up_20_22_days_dt, mix_up_28_days_dt, created_by, created_date, updated_by, updated_date, tri_action)
    VALUES (old.pit_transaction_id, old.batch_id, old.fk_wc_id, old.fk_mcc_id, old.fk_pit_id, old.pit_unique_id, old.fk_pit_process_is_active, old.segregation, old.visual_inspection, old.mixed_enzyme, old.shreading, old.transfer_to_pit, old.inert_material, old.is_filledup, old.filedup_dt, old.merg_6_8_days_thrs_dt, old.mix_up_14_16_days_dt, old.mix_up_20_22_days_dt, old.mix_up_28_days_dt, old.created_by, old.created_date, old.updated_by, old.updated_date, "UPDATE");

    UPDATE bmc_pit_transaction_master_hist SET
    batch_id = new.batch_id,
    fk_wc_id = new.fk_wc_id,
    fk_mcc_id = new.fk_mcc_id,
    fk_pit_id = new.fk_pit_id,
    pit_unique_id = new.pit_unique_id,
    fk_pit_process_is_active = new.fk_pit_process_is_active,
    segregation = new.segregation,
    visual_inspection = new.visual_inspection,
    mixed_enzyme = new.mixed_enzyme,
    shreading = new.shreading,
    transfer_to_pit = new.transfer_to_pit,
    inert_material = new.inert_material,
    is_filledup = new.is_filledup,
    filedup_dt = new.filedup_dt,
    merg_6_8_days_thrs_dt = new.merg_6_8_days_thrs_dt,
    mix_up_14_16_days_dt = new.mix_up_14_16_days_dt,
    mix_up_20_22_days_dt = new.mix_up_20_22_days_dt,
    mix_up_28_days_dt = new.mix_up_28_days_dt,
    updated_by = new.updated_by,
    updated_date = new.updated_date,
    tri_action = "UPDATE"
    WHERE pit_transaction_id = old.pit_transaction_id;
END$$

DELIMITER ;
