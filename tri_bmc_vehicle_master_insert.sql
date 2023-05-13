

DROP TRIGGER IF EXISTS tri_bmc_vehicle_master_insert;

DELIMITER $$

CREATE TRIGGER tri_bmc_vehicle_master_insert
AFTER INSERT
ON bmc_vehicle_master FOR EACH ROW
BEGIN
    INSERT INTO bmc_vehicle_master_hist (vehicle_id, fk_zone_id,fk_wc_id,fk_route_id,fk_driver_id,vehicle_no,rc_no,rc_photo,vehicle_image,insurance,vehicle_passing_wt,vehicle_wt,vehicle_desc,is_active, created_by, created_date, updated_by, updated_date,tri_action)
    VALUES (new.vehicle_id, new.fk_zone_id,new.fk_wc_id,new.fk_route_id,new.fk_driver_id,new.vehicle_no,new.rc_no,new.rc_photo,new.vehicle_image,new.insurance,new.vehicle_passing_wt,new.vehicle_wt,new.vehicle_desc,new.is_active, new.created_by, new.created_date, new.updated_by, new.updated_date, "INSERT");
END$$

DELIMITER ;



