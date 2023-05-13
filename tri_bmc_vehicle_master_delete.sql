DROP TRIGGER IF EXISTS tri_bmc_vehicle_master_delete;
DELIMITER $$

CREATE TRIGGER tri_bmc_vehicle_master_delete
AFTER DELETE
ON bmc_vehicle_master
FOR EACH ROW
BEGIN
    -- Insert the deleted row into the history table
    INSERT INTO bmc_vehicle_master_hist (vehicle_id, fk_zone_id,fk_wc_id,fk_route_id,fk_driver_id,vehicle_no,rc_no,rc_photo,vehicle_image,insurance,vehicle_passing_wt,vehicle_wt,vehicle_desc,is_active, created_by, created_date, updated_by, updated_date,tri_action)
    VALUES (old.vehicle_id, old.fk_zone_id,old.fk_wc_id,old.fk_route_id,old.fk_driver_id,old.vehicle_no,old.rc_no,old.rc_photo,old.vehicle_image,old.insurance,old.vehicle_passing_wt,old.vehicle_wt,old.vehicle_desc,old.is_active, old.created_by, old.created_date, old.updated_by, old.updated_date, "DELETE");
    
    -- Delete the corresponding row from the history table
    DELETE FROM bmc_vehicle_master_hist
    WHERE vehicle_id = old.vehicle_id;
END$$

DELIMITER ;
