DROP TRIGGER IF EXISTS tri_bmc_trns_mrf_dry_wtmt_update;

DELIMITER $$

CREATE TRIGGER tri_bmc_trns_mrf_dry_wtmt_update
AFTER UPDATE
ON bmc_trns_mrf_dry_wtmt FOR EACH ROW
BEGIN
    INSERT INTO bmc_trns_mrf_dry_wtmt_hist (mrf_trns_id, fk_goods_id, fk_goods_sub_id, quntaum, inter_material, mrf_desc,created_by, created_date, updated_by, updated_date, tri_action)
    VALUES (OLD.mrf_trns_id, OLD.fk_goods_id, OLD.fk_goods_sub_id, OLD.quntaum, OLD.inter_material, OLD.mrf_desc, OLD.created_by, OLD.created_date, OLD.updated_by, OLD.updated_date, "UPDATE");

    UPDATE bmc_trns_mrf_dry_wtmt_hist
    SET mrf_trns_id = NEW.mrf_trns_id,
        fk_goods_id = NEW.fk_goods_id,
        fk_goods_sub_id = NEW.fk_goods_sub_id,
        quntaum = NEW.quntaum,
        inter_material = NEW.inter_material,
        mrf_desc = NEW.mrf_desc,
        created_by = NEW.created_by,
        created_date = NEW.created_date,
        updated_by = NEW.updated_by,
        updated_date = NEW.updated_date,
        tri_action = 'UPDATE'
    WHERE mrf_trns_id = OLD.mrf_trns_id;
END$$

DELIMITER ;
