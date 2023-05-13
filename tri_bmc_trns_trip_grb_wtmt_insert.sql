DROP TRIGGER IF EXISTS tri_bmc_trns_trip_grb_wtmt_insert;

DELIMITER $$

CREATE TRIGGER tri_bmc_trns_trip_grb_wtmt_insert
AFTER INSERT
ON bmc_trns_trip_grb_wtmt FOR EACH ROW
BEGIN
    INSERT INTO bmc_trns_trip_grb_wtmt (trip_trns_id, fk_zone_id, fk_wc_id, fk_route_id, fk_driver_id, fk_vehicle_id,vehicle_number,trip_start_reading,trip_end_reading,trip_start_reading_img,trip_end_reading_img,gross_wt,dry_wt,wet_wt,tare_wt,created_by, created_date, updated_by, updated_date,tri_action)
    VALUES (new.trip_trns_id, new.fk_zone_id, new.fk_wc_id, new.fk_route_id, new.fk_driver_id, new.fk_vehicle_id,new.vehicle_number,new.trip_start_reading,new.trip_end_reading,new.trip_start_reading_img,new.trip_end_reading_img,new.gross_wt,new.dry_wt,new.wet_wt,new.tare_wt,new.created_by, new.created_date, new.updated_by, new.updated_date, "INSERT");
END$$

DELIMITER ;
