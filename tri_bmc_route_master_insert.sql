DROP TRIGGER IF EXISTS tri_bmc_route_master_insert;

DELIMITER $$

CREATE TRIGGER tri_bmc_route_master_insert
AFTER INSERT
ON bmc_route_master FOR EACH ROW
BEGIN
    INSERT INTO bmc_user_role_map_hist (route_id,fk_zone_id,fk_wc_id,route_name,route_desc,is_active,created_by, created_date, updated_by, updated_date,tri_action)
    VALUES (new.route_id, new.fk_zone_id,new.fk_wc_id,new.route_name,new.route_desc,new.is_active,new.created_by, new.created_date, new.updated_by, new.updated_date, "INSERT");
END$$

DELIMITER ;



