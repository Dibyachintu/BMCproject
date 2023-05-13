DROP TRIGGER IF EXISTS tri_bmc_trns_trip_grb_wtmt_update;

DELIMITER $$

CREATE TRIGGER tri_bmc_trns_trip_grb_wtmt_update
AFTER UPDATE
ON bmc_trns_trip_grb_wtmt FOR EACH ROW
BEGIN
    INSERT INTO bmc_trns_trip_grb_wtmt_hist (trip_trns_id, fk_zone_id, fk_wc_id, fk_route_id, fk_driver_id, fk_vehicle_id,vehicle_number,trip_start_reading,trip_end_reading,trip_start_reading_img,trip_end_reading_img,gross_wt,dry_wt,wet_wt,tare_wt,created_by, created_date, updated_by, updated_date,tri_action)
    VALUES (OLD.trip_trns_id, OLD.fk_zone_id, OLD.fk_wc_id, OLD.fk_route_id, OLD.fk_driver_id, OLD.fk_vehicle_id,OLD.vehicle_number,OLD.trip_start_reading,OLD.trip_end_reading,OLD.trip_start_reading_img,OLD.trip_end_reading_img,OLD.gross_wt,OLD.dry_wt,OLD.wet_wt,OLD.tare_wt,OLD.created_by, OLD.created_date, OLD.updated_by, OLD.updated_date, "UPDATE");

    UPDATE bmc_trns_trip_grb_wtmt_hist
    SET trip_trns_id = NEW.trip_trns_id,
        fk_zone_id = NEW.fk_zone_id,
        fk_wc_id = NEW.fk_wc_id,
        fk_route_id = NEW.fk_route_id,
        fk_driver_id = NEW.fk_driver_id,
        fk_vehicle_id = NEW.fk_vehicle_id,
        vehicle_number = NEW.vehicle_number,
        trip_start_reading = NEW.trip_start_reading,
        trip_end_reading = NEW.trip_end_reading,
        trip_start_reading_img = NEW.trip_start_reading_img,
        trip_end_reading_img = NEW.trip_end_reading_img,
        gross_wt = NEW.gross_wt,
        dry_wt = NEW.dry_wt,
        wet_wt = NEW.wet_wt,
        tare_wt = NEW.tare_wt,
        created_by = NEW.created_by,
        created_date = NEW.created_date,
        updated_by = NEW.updated_by,
        updated_date = NEW.updated_date,
        tri_action = 'UPDATE'
    WHERE trip_trns_id = OLD.trip_trns_id;
END$$

DELIMITER ;
