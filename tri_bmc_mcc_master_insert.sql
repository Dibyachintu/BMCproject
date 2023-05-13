DROP TRIGGER IF EXISTS tri_bmc_mcc_master_insert;

DELIMITER $$

CREATE TRIGGER tri_bmc_mcc_master
AFTER INSERT
ON bmc_mcc_master FOR EACH ROW
BEGIN
    INSERT INTO bmc_mcc_master_hist (mcc_id, fk_zone_id,fk_wc_id,mcc_desc,is_active, created_by, created_date, updated_by, updated_date,tri_action)
    VALUES (new.mcc_id, new.fk_zone_id,new.fk_wc_id,new.mcc_desc,is_active=new.is_active,new.created_by, new.created_date, new.updated_by, new.updated_date, "INSERT");
END$$

DELIMITER ;

