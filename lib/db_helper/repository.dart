
import 'package:fluttercrud/db_helper/database_connection.dart';
import 'package:sqflite/sqflite.dart';
// crate the basic DB operations


class Repository {
  late DatabaseConnection_databaseConnection;
  Repository(){
    _databaseConnection= DatabaseConnection();
  }

  static Database? _database;
  Future<Database?>get database async {
    if(_database !=null) {
      return _database;
    } else{
      _database = await _databaseConnection.setDatabase();
      return _database;
    }
  }
  // insert fuintion 
  insertData(table, data) async{
    var connection = await database;
    return await connection?.insert(table, data);
  }

  // Read data
  readData(table) async {
    var connection =  await database;
    return await connection?.query(table);
  }

  readDataById(table, itemId) async{
    var connection = await database;
    return await connection?.query(table, where: 'id=?', whereArgs: [itemId]);
  }

  // Update data
  updateData(table, data) async {
    var connection = await database;
    return await connection
    ?.update(table, data, where: 'id=?',  whereArgs: [data['id']]);
  }

  // Delete daya 
  deleteDataByID (table, itemId) async{
    var connection = await database;
    return await connection?.rawDelete("delete from $table where id=$itemId");
  }

}