DROP TRIGGER IF EXISTS tri_bmc_trns_mrf_dry_wtmt_delete;

DELIMITER $$

CREATE TRIGGER tri_bmc_trns_mrf_dry_wtmt_delete
AFTER DELETE
ON bmc_trns_mrf_dry_wtmt FOR EACH ROW
BEGIN
INSERT INTO bmc_trns_mrf_dry_wtmt_hist (mrf_trns_id, fk_goods_id, fk_goods_sub_id, quntaum, inter_material, mrf_desc,created_by, created_date, updated_by, updated_date, tri_action)
VALUES (OLD.mrf_trns_id, OLD.fk_goods_id, OLD.fk_goods_sub_id, OLD.quntaum, OLD.inter_material, OLD.mrf_desc, OLD.created_by, OLD.created_date, OLD.updated_by, OLD.updated_date, "DELETE");

-- Delete the corresponding row from the history table
    DELETE FROM bmc_trns_mrf_dry_wtmt_hist
    WHERE mrf_trns_id = OLD.mrf_trns_id;
END$$

DELIMITER ;