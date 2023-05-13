DROP TRIGGER IF EXISTS tri_bmc_vehicle_master_update;

DELIMITER $$
CREATE TRIGGER tri_bmc_vehicle_master_update
AFTER UPDATE
ON bmc_vehicle_master FOR EACH ROW
BEGIN
    -- Insert the old values into the history table
   INSERT INTO bmc_vehicle_master_hist (vehicle_id, fk_zone_id,fk_wc_id,fk_route_id,fk_driver_id,vehicle_no,rc_no,rc_photo,vehicle_image,insurance,vehicle_passing_wt,vehicle_wt,vehicle_desc,is_active, created_by, created_date, updated_by, updated_date,tri_action)
    VALUES (new.vehicle_id, new.fk_zone_id,new.fk_wc_id,new.fk_route_id,new.fk_driver_id,new.vehicle_no,new.rc_no,new.rc_photo,new.vehicle_image,new.insurance,new.vehicle_passing_wt,new.vehicle_wt,new.vehicle_desc,new.is_active, new.created_by, new.created_date, new.updated_by, new.updated_date, "DELETE");

    -- Update the corresponding row in the history table with the new values
    UPDATE bmc_vehicle_master_hist
    SET vehicle_id = NEW.vehicle_id,
        fk_zone_id = NEW.fk_zone_id,
        fk_wc_id=NEW.fk_wc_id,
        fk_route_id=NEW.fk_route_id,
        fk_driver_id=NEW.fk_driver_id,
        vehicle_no=NEW.vehicle_no,
        rc_no=NEW.rc_no,
        rc_photo=NEW.rc_photo,
        vehicle_image=NEW.vehicle_image,
        insurance=NEW.insurance,
        vehicle_passing_wt=NEW.vehicle_passing_wt,
        vehicle_wt=NEW.vehicle_wt,
        vehicle_desc=NEW.vehicle_desc,
        is_active=NEW.is_active,
        created_by = NEW.created_by,
        created_date = NEW.created_date,
        updated_by = NEW.updated_by,
        updated_date = NEW.updated_date,
        tri_action = 'UPDATE'
    WHERE vehicle_id = NEW.vehicle_id;
END$$

DELIMITER ;
