DROP TRIGGER IF EXISTS tri_bmc_mrf_master_insert;

DELIMITER $$

CREATE TRIGGER tri_bmc_mrf_master_insert
AFTER INSERT
ON bmc_mrf_master FOR EACH ROW
BEGIN
    INSERT INTO bmc_mrf_master_hist (mrf_id, fk_zone_id,fk_wc_id,mrf_name,mrf_desc,is_active, created_by, created_date, updated_by, updated_date,tri_action)
    VALUES (new.mrf_id, new.fk_zone_id,new.fk_wc_id,new.mrf_name,new.mrf_desc,new.is_active, new.created_by, new.created_date, new.updated_by, new.updated_date, "INSERT");
END$$

DELIMITER ;



