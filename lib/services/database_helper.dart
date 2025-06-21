import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:my_aplication_proeyctdm1/entity/user.dart';
import 'package:my_aplication_proeyctdm1/entity/Combo.dart';



class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;
  factory DatabaseHelper() {
    return _instance;
  }

  DatabaseHelper._internal();

  Future<void> initializeDatabase() async {
    await database;
  }


  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'database.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    //Tabla de Usuarios 
    await db.execute('''
      CREATE TABLE Users (
      id INTEGER PRIMARY KEY,
      name TEXT NOT NULL,
      email TEXT NOT NULL,
      image TEXT NOT NULL,
      listFavVideogame TEXT NOT NULL
      )
    ''');
    //Tabla de Combos
    await db.execute('''
      CREATE TABLE Combos (
      id INTEGER PRIMARY KEY,
      name TEXT NOT NULL,
      safe TEXT NOT NULL,
      listMovement TEXT NOT NULL
      )
    ''');
  }

  //Insertar usuario
  Future<void> insertUser(User user) async {
    final db = await database;
    await db.insert(
      'Users',
      user.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
  //Borrar usuario
  Future<void> deleteUser(int id) async {
    final db = await database;
    await db.delete(
      'Users',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
  //Conseguir usuarios
  Future<List<User>> getUsers() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('Users');

    return List.generate(maps.length, (i) { return User.fromMap(maps[i]); } );
  }
  //Actualizar usuario
  Future<void> updateUser(User user) async {
    final db = await database;

    await db.update(
      'Users',
      user.toMap(),
      where: 'id = ?',
      whereArgs: [user.id],                                                                
    );
  }


  //Borrar base de datos
  Future<void> deleteDataBase(String tableName) async {
    final db = await database;
    await db.delete(tableName);
  }
  

  //Insertar combo
  Future<void> insertCombo(Combo combo) async {
    final db = await database;
    await db.insert(
      'Combos',
      combo.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
  //Borrar usuario
  Future<void> deleteCombo(int id) async {
    final db = await database;
    await db.delete(
      'Combos',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
  //Conseguir usuarios
  Future<List<User>> getCombos() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('Combos');

    return List.generate(maps.length, (i) { return User.fromMap(maps[i]); } );
  }
  //Actualizar usuario
  Future<void> updateCombo(Combo combo) async {
    final db = await database;

    await db.update(
      'Combos',
      combo.toMap(),
      where: 'id = ?',
      whereArgs: [combo.id],                                                                
    );
  }
}