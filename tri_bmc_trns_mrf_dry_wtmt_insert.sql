DROP TRIGGER IF EXISTS tri_bmc_trns_mrf_dry_wtmt_insert;

DELIMITER $$

CREATE TRIGGER tri_bmc_trns_mrf_dry_wtmt_insert
AFTER INSERT
ON bmc_trns_mrf_dry_wtmt FOR EACH ROW
BEGIN
    INSERT INTO bmc_trns_mrf_dry_wtmt_hist (mrf_trns_id, fk_goods_id, fk_goods_sub_id, quntaum, inter_material, mrf_desc,created_by, created_date, updated_by, updated_date,tri_action)
    VALUES (new.mrf_trns_id, new.fk_goods_id, new.fk_goods_sub_id, new.quntaum, new.inter_material, new.mrf_desc,new.created_by, new.created_date,new. updated_by, new.updated_date, "INSERT");
END$$

DELIMITER ;
