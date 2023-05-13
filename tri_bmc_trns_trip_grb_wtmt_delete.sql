DROP TRIGGER IF EXISTS tri_bmc_trns_trip_grb_wtmt_delete;

DELIMITER $$

CREATE TRIGGER tri_bmc_trns_trip_grb_wtmt_delete
AFTER DELETE
ON bmc_trns_trip_grb_wtmt FOR EACH ROW
BEGIN
    INSERT INTO bmc_trns_trip_grb_wtmt_hist (trip_trns_id, fk_zone_id, fk_wc_id, fk_route_id, fk_driver_id, fk_vehicle_id, vehicle_number, trip_start_reading, trip_end_reading, trip_start_reading_img, trip_end_reading_img, gross_wt, dry_wt, wet_wt, tare_wt, created_by, created_date, updated_by, updated_date, tri_action)
    VALUES (OLD.trip_trns_id, OLD.fk_zone_id, OLD.fk_wc_id, OLD.fk_route_id, OLD.fk_driver_id, OLD.fk_vehicle_id, OLD.vehicle_number, OLD.trip_start_reading, OLD.trip_end_reading, OLD.trip_start_reading_img, OLD.trip_end_reading_img, OLD.gross_wt, OLD.dry_wt, OLD.wet_wt, OLD.tare_wt, OLD.created_by, OLD.created_date, OLD.updated_by, OLD.updated_date, "DELETE");

    DELETE FROM bmc_trns_trip_grb_wtmt_hist
    WHERE trip_trns_id = OLD.trip_trns_id;
END$$

DELIMITER ;
