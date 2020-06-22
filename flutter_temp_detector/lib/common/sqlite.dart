import 'package:flutter_temp_detector/User/models/Config.dart';
import 'package:flutter_temp_detector/User/models/User.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';

abstract class DB {
  
  static Database _db;
  static int get _version => 1;

  static Future<void> init() async {
    if (_db != null) { return ;}
    try {
      String _path = await getDatabasesPath() + 'temp_detector';
      _db = await openDatabase(_path, version: _version, onCreate: onCreate);
    }catch(e){
      print(e);
    }
  }

  static void onCreate(Database db, int version) async => {
    await db.execute("CREATE TABLE users (id INTEGER NOT NULL, name STRING, email STRING, jwt STRING, isLoged BOOLEAN)"),
    await db.execute("CREATE TABLE configs (id INTEGER NOT NULL, grpc STRING, grpcport STRING, ws STRING, wsport STRING)")
  };

  static Future<List<Map<String, dynamic>>> query(String table) async =>
    _db.query(table);

  static Future<int> insert(String table, UserModel user) async =>
    await _db.insert(table, user.toMap());

  static Future<int> update(String table, UserModel user) async => 
    await _db.update(table, user.toMap(), where: 'id = ?', whereArgs: [user.id]);

  static Future<int> delete(String table, int id) async => 
    await _db.delete(table, where: 'id = ?', whereArgs: [id]);

  static Future<int> insertConfig(String table, ConfigModel config) async =>
    await _db.insert(table, config.toMap());

  static Future<int> updateConfig(String table, ConfigModel config) async => 
    await _db.update(table, config.toMap(), where: 'id = ?', whereArgs: [config.id]);
}