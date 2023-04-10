// ignore_for_file: constant_identifier_names

class DBConstants {
  static const String database_name = "hsca.db";
  static const int database_version = 1;

  /*TABLES NAME*/
  static const String tb_user= "user";

  /*
  * user table column
  * */
  static const String cl_realtor_id = "realtor_id";
  static const String cl_first_name = "first_name";
  static const String cl_last_name = "last_name";
  static const String cl_email = "email";
  static const String cl_age = "age";
  static const String cl_street_first = "street_first";
  static const String cl_street_second = "street_second";
  static const String cl_city = "city";
  static const String cl_state = "state";
  static const String cl_postal_code = "postal_code";
  static const String cl_country = "country";
  static const String cl_house_phone = "house_phone";
  static const String cl_cell_phone = "cell_phone";
  static const String cl_price_min = "price_min";
  static const String cl_price_max = "price_max";
  static const String cl_building_type = "building_type";


  /*TABLES NAME*/
  static const String tb_house= "house";

  /*
  * house table column
  * */
  static const String cl_house_id = "house_id";
  static const String cl_address = "address";
  static const String cl_house_price = "house_price";
  static const String cl_bedrooms = "bedrooms";
  static const String cl_bathrooms = "bathrooms";
  static const String cl_annual_tax = "annual_tax";
  static const String cl_sq_feet = "sq_feet";
  static const String cl_neighborhood = "neighborhood";
  static const String cl_built_year = "built_year";

  /*TABLES NAME*/
  static const String tb_interior= "interior";

  /*
  * interior table column
  * */
  // static const String cl_house_id_interior = "house_id_interior";
  static const String cl_painting = "painting";
  static const String cl_ceiling = "ceiling";
  static const String cl_windows = "windows";
  static const String cl_flooring = "flooring";
  static const String cl_living_room = "living_room";
  static const String cl_size = "size";
  static const String cl_carpet = "carpet";
  static const String cl_wood = "wood";
  static const String cl_family_room = "family_room";
  static const String cl_dinning_room = "dinning_room";
  static const String cl_powder_room = "powder_room";


  /*TABLES NAME*/
  static const String tb_exterior= "exterior";

  /*
  * exterior table column
  * */
  // static const String cl_house_id_exterior = "house_id_exterior";
  static const String cl_view = "view";
  static const String cl_land_scaping = "land_scaping";
  static const String cl_lawnF = "lawnF";
  static const String cl_lawnB = "lawnB";
  static const String cl_brick = "brick";
  static const String cl_viny = "viny";
  static const String cl_deck = "deck";
  static const String cl_patio = "patio";
  static const String cl_garage = "garage";
//  static const String cl_windows1 = "windows1";
  static const String cl_doors = "doors";
  static const String cl_roof = "roof";
  static const String cl_fence = "fence";

  /*TABLES NAME*/
  static const String tb_bedrooms= "bedrooms";

  /*
  * bedrooms table column
  * */
 // static const String cl_house_id_bedrooms = "house_id_bedrooms";
  static const String cl_room_type = "room_type";
 // static const String cl_size1 = "size1";
  static const String cl_carpet_floor = "carpet_floor";
  static const String cl_wood_floor = "wood_floor";
  static const String cl_closetWN = "closetWN";
  static const String cl_bathroom = "bathroom";
  static const String cl_standing = "standing";
  static const String cl_tub = "tub";


  /*TABLES NAME*/
  static const String tb_community = "community";

  /*
  * community table column
  * */
 // static const String cl_house_id_community = "house_id_community";
  static const String cl_schools = "schools";
  static const String cl_shopping = "shopping";
  static const String cl_distance_to_airport = "distance_to_airport";
  static const String cl_distance_to_go = "distance_to_go";
  static const String cl_public_transport = "public_transport";


  /*TABLES NAME*/
  static const String tb_appliances = "appliances";

  /*
  * appliances table column
  * */
  // static const String cl_house_id_appliances = "house_id_appliances";
  static const String cl_regridgerator = "regridgerator";
  static const String cl_dish_washer = "dish_washer";
  static const String cl_washer = "washer";
  static const String cl_ac = "ac";
  static const String cl_furnace = "furnace";

  /*TABLES NAME*/
  static const String tb_kitchen = "kitchen";

  /*
  * kitchen table column
  * */
 // static const String cl_house_id_kitchen = "house_id_kitchen";
  static const String cl_cabinets = "cabinets";
 // static const String cl_flooring1 = "flooring1";
  static const String cl_microOven = "microOven";
  static const String cl_back_splash = "back_splash";
  static const String cl_island = "island";


  /*TABLES NAME*/
  static const String tb_other = "other";

  /*
  * other table column
  * */
 // static const String cl_house_id_other = "house_id_other";
  static const String cl_basement = "basement";
  static const String cl_finished = "finished";
//  static const String cl_garage1 = "garage1";

}
