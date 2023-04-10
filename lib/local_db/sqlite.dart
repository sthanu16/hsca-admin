// ignore_for_file: depend_on_referenced_packages

import 'dart:async';

import 'package:sqflite/sqflite.dart';

import '../common/constant/db_constants.dart';
import 'database_helper.dart';

class SqliteDB {
  SqliteDB._privateConstructor();

  static final SqliteDB instance = SqliteDB._privateConstructor();

  static late Database _database;

  Future<Database> get database async {
    _database = await DatabaseHelper.initDatabase();
    return _database;
  }

  Future<void> insertUser(Map<dynamic,dynamic> mapData) async {
    Database? db = await SqliteDB.instance.database;
    final map = {
      DBConstants.cl_first_name: mapData,
    };
    db.insert(DBConstants.tb_user, map);
  }
  Future<void> updateUser(String realtorId) async {
    Database db = await instance.database;
    await db.update(
        DBConstants.tb_user,
        {
          DBConstants.cl_first_name: "",
        },
        where: '${DBConstants.cl_realtor_id} = ?',
        whereArgs: [realtorId]);
  }
  Future<void> getCarParkingListList(String realtorId) async {
    Database db = await instance.database;
    List<Map<String, dynamic>> results =
        await db.query(DBConstants.tb_user ,
        where:  "${DBConstants.cl_realtor_id} = ?",
        whereArgs: [realtorId] , orderBy: "${DBConstants.cl_realtor_id} ASC"  );
  /*  List<REVPPARKINGLOCATIONSARRAYBean?> list = [];
    await Future.forEach(results, (dynamic element) {
      list.add(REVPPARKINGLOCATIONSARRAYBean(
        location_name: element[DBConstants.CL_LOCATION_NAME],
        carpark_location_id: element[DBConstants.CL_CARPARK_LOCATION_ID],
        station_name:  element[DBConstants.CL_CARPARK_STATION_NAME],
        station_id:  element[DBConstants.CL_CARPARK_STATION_ID],
        order:  element[DBConstants.CL_CARPARK_ORDER],
      ));
    });*/
   // return results;
  }

   Future<int> deleteUser(String realtorId) async {
    Database db = await instance.database;
   dynamic results =
    await db.delete(DBConstants.tb_user,
        where:  "${DBConstants.cl_realtor_id} = ?",
        whereArgs: [realtorId]);
    return results;
  }


/*
  Future<List<Map<String, dynamic>>> getImagesAPIRequestData(String caseNum) async {
    Database db = await instance.database;
    List<Map<String, dynamic>> results =
        await db.query(DBConstants.TB_IMAGES_REQUEST,
            where:  "${DBConstants.CL_IMAGES_CASE_ID} LIKE ?",
            whereArgs: ['%$caseNum%'],orderBy: "${DBConstants.CL_API_REQUEST_SERIAL_ID} ASC");
    return results;
  }
*/

  /* Future<int> deleteSubSectionsImagesData(String caseNum,String subSection) async {
    Database db = await instance.database;
   dynamic results =
    await db.delete(DBConstants.TB_IMAGES_REQUEST,
        where:  "${DBConstants.CL_IMAGES_CASE_ID} LIKE ? and ${DBConstants.CL_IMAGES_SUB_SECTION} = ?",
        whereArgs: ['%$caseNum%',subSection]);
    return results;
  }*/

  Future<void> cleanSingleTable(String tableName) async {
    Database db = await instance.database;
    await db.rawDelete("Delete from $tableName");
  }

  Future close() async {
    Database db = await instance.database;
    db.close();
  }
}
