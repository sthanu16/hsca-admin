// ignore_for_file: depend_on_referenced_packages

import 'dart:async';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../common/constant/db_constants.dart';

class DatabaseHelper {

  static Future<Database> initDatabase() async {
    final documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, DBConstants.database_name);
    return openDatabase(path,
        onCreate: (db, version) {
      //Create Login table
      db.execute(
          "CREATE TABLE ${DBConstants.tb_user}"
              "(${DBConstants.cl_realtor_id} TEXT, "
              "${DBConstants.cl_first_name} TEXT, "
              "${DBConstants.cl_last_name} TEXT, "
              "${DBConstants.cl_age} TEXT, "
              "${DBConstants.cl_email} TEXT, "
              "${DBConstants.cl_street_first} TEXT, "
              "${DBConstants.cl_street_second} TEXT, "
              "${DBConstants.cl_city} TEXT, "
              "${DBConstants.cl_state} TEXT, "
              "${DBConstants.cl_postal_code} TEXT, "
              "${DBConstants.cl_country} TEXT, "
              "${DBConstants.cl_house_phone} TEXT, "
              "${DBConstants.cl_cell_phone} TEXT, "
              "${DBConstants.cl_price_min} TEXT, "
              "${DBConstants.cl_price_max} TEXT, "
              "${DBConstants.cl_building_type} TEXT)");

      // Create House table

      db.execute(
          "CREATE TABLE ${DBConstants.tb_house}"
              "(${DBConstants.cl_house_id} TEXT, "
              "${DBConstants.cl_address} TEXT, "
              "${DBConstants.cl_house_price} TEXT, "
              "${DBConstants.cl_bedrooms} TEXT, "
              "${DBConstants.cl_bathrooms} TEXT, "
              "${DBConstants.cl_annual_tax} TEXT, "
              "${DBConstants.cl_sq_feet} TEXT, "
              "${DBConstants.cl_neighborhood} TEXT, "
              "${DBConstants.cl_built_year} TEXT)");

      // Create Interior table

      db.execute(
          "CREATE TABLE ${DBConstants.tb_interior}"

              "(${DBConstants.cl_house_id} TEXT, "
              "${DBConstants.cl_painting} TEXT, "
              "${DBConstants.cl_ceiling} TEXT, "
              "${DBConstants.cl_windows} TEXT, "
              "${DBConstants.cl_flooring} TEXT, "
              "${DBConstants.cl_living_room} TEXT, "
              "${DBConstants.cl_size} TEXT, "
              "${DBConstants.cl_carpet} TEXT, "
              "${DBConstants.cl_wood} TEXT, "
              "${DBConstants.cl_family_room} TEXT, "
              "${DBConstants.cl_dinning_room} TEXT, "
              "${DBConstants.cl_powder_room} TEXT)");

      // Create Exterior table

      db.execute(
          "CREATE TABLE ${DBConstants.tb_exterior}"

              "(${DBConstants.cl_house_id} TEXT, "
              "${DBConstants.cl_view} TEXT, "
              "${DBConstants.cl_land_scaping} TEXT, "
              "${DBConstants.cl_lawnF} TEXT, "
              "${DBConstants.cl_lawnB} TEXT, "
              "${DBConstants.cl_brick} TEXT, "
              "${DBConstants.cl_viny} TEXT, "
              "${DBConstants.cl_deck} TEXT, "
              "${DBConstants.cl_patio} TEXT, "
              "${DBConstants.cl_garage} TEXT, "
              "${DBConstants.cl_windows} TEXT, "
              "${DBConstants.cl_doors} TEXT, "
              "${DBConstants.cl_roof} TEXT, "
              "${DBConstants.cl_fence} TEXT)");

      // Create Bedrooms table

      db.execute(
          "CREATE TABLE ${DBConstants.tb_bedrooms}"

              "(${DBConstants.cl_house_id} TEXT, "
              "${DBConstants.cl_room_type} TEXT, "
              "${DBConstants.cl_size} TEXT, "
              "${DBConstants.cl_carpet_floor} TEXT, "
              "${DBConstants.cl_wood_floor} TEXT, "
              "${DBConstants.cl_closetWN} TEXT, "
              "${DBConstants.cl_bathroom} TEXT, "
              "${DBConstants.cl_standing} TEXT, "
              "${DBConstants.cl_tub} TEXT)");

      // Create Community table

      db.execute(
          "CREATE TABLE ${DBConstants.tb_community}"

              "(${DBConstants.cl_house_id} TEXT, "
              "${DBConstants.cl_schools} TEXT, "
              "${DBConstants.cl_shopping} TEXT, "
              "${DBConstants.cl_distance_to_airport} TEXT, "
              "${DBConstants.cl_distance_to_go} TEXT, "
              "${DBConstants.cl_public_transport} TEXT)");

      // Create Appliances table

      db.execute(
          "CREATE TABLE ${DBConstants.tb_appliances}"

              "(${DBConstants.cl_house_id} TEXT, "
              "${DBConstants.cl_regridgerator} TEXT, "
              "${DBConstants.cl_dish_washer} TEXT, "
              "${DBConstants.cl_washer} TEXT, "
              "${DBConstants.cl_ac} TEXT, "
              "${DBConstants.cl_furnace} TEXT)");

      // Create Kitchen table

      db.execute(
          "CREATE TABLE ${DBConstants.tb_kitchen}"

              "(${DBConstants.cl_house_id} TEXT, "
              "${DBConstants.cl_cabinets} TEXT, "
              "${DBConstants.cl_flooring} TEXT, "
              "${DBConstants.cl_microOven} TEXT, "
              "${DBConstants.cl_back_splash} TEXT, "
              "${DBConstants.cl_island} TEXT)");

      // Create Other table

      db.execute(
          "CREATE TABLE ${DBConstants.tb_other}"

              "(${DBConstants.cl_house_id} TEXT, "
              "${DBConstants.cl_basement} TEXT, "
              "${DBConstants.cl_finished} TEXT, "
              "${DBConstants.cl_garage} TEXT)");

        }, version: DBConstants.database_version);
  }
}
