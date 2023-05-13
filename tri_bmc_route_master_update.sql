DROP TRIGGER IF EXISTS tri_bmc_route_master_update;

DELIMITER $$
CREATE TRIGGER tri_bmc_route_master_update
AFTER UPDATE
ON bmc_route_master FOR EACH ROW
BEGIN
   
    INSERT INTO bmc_route_master_hist (route_id, fk_zone_id, fk_wc_id, route_name, route_desc, is_active, created_by, created_date, updated_by, updated_date, tri_action)
    VALUES (new.route_id, new.fk_zone_id, new.fk_wc_id, new.route_name, new.route_desc, new.is_active, new.created_by, new.created_date, new.updated_by, new.updated_date, "UPDATE");
    
    -- Update the corresponding row in the history table with the new values
UPDATE bmc_route_master_hist
SET route_id = NEW.route_id,
    fk_zone_id = NEW.fk_zone_id,
    fk_wc_id = NEW.fk_wc_id,
    route_name = NEW.route_name,
    route_desc = NEW.route_desc,
    is_active = NEW.is_active,
    created_by = NEW.created_by,
    created_date = NEW.created_date,
    updated_by = NEW.updated_by,
    updated_date = NEW.updated_date,
    tri_action = 'UPDATE'
WHERE route_id = NEW.route_id;
END$$
DELIMITER ;
