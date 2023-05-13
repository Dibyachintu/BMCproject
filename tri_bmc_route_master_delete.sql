DROP TRIGGER IF EXISTS tri_bmc_route_master_delete;

DELIMITER $$
CREATE TRIGGER tri_bmc_route_master_delete
AFTER DELETE
ON bmc_route_master FOR EACH ROW
BEGIN
    INSERT INTO bmc_user_role_map_hist (route_id, fk_zone_id, fk_wc_id, route_name, route_desc, is_active, created_by, created_date, updated_by, updated_date, tri_action)
    VALUES (old.route_id, old.fk_zone_id, old.fk_wc_id, old.route_name, old.route_desc, old.is_active, old.created_by, old.created_date, old.updated_by, old.updated_date, "DELETE");
      -- Delete the corresponding row from the history table
    DELETE FROM bmc_user_master_hist
    WHERE route_id = OLD.route_id;
    
END$$
DELIMITER ;
