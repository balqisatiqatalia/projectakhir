import 'package:sqflite/sqflite.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'obat.dart';
import 'biodata.dart';

  class DbHelper {
  static DbHelper _dbHelper;
  static Database _database;
  DbHelper._createObject();

    Future<Database> initDb() async {
    //untuk menentukan nama database dan lokasi yg dibuat
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'bio.db';

    //create, read databases
    var bioDatabase = openDatabase(path, version: 1, onCreate: _createDbb);

    //mengembalikan nilai object sebagai hasil dari fungsinya
    return bioDatabase;
    }
    // update table baru
  void _onUpgrade(Database db, int oldVersion, int newVersion) async {
    _createDbb(db, newVersion);
  }

//buat tabel baru 
  void _createDbb(Database db, int version) async {
    var batch = db.batch();
     batch.execute('DROP TABLE IF EXISTS imun');
     await batch.execute('DROP TABLE IF EXISTS bio');
     batch.execute('''
    CREATE TABLE imun (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nameim TEXT,
    price INTEGER,
    obat TEXT
    )
    ''');
     batch.execute('''
    CREATE TABLE bio (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT,
    age INTEGER,
    address TEXT
    )
    ''');
    await batch.commit();
  }
    //select databases biodata
    Future<List<Map<String, dynamic>>> select() async {
    Database db = await this.initDb();
    var mapList = await db.query('bio', orderBy: 'name');
    return mapList;
    }
    //select databases imunisasi
    Future<List<Map<String, dynamic>>> selectimun() async {
    Database db = await this.initDb();
    var mapList = await db.query('imun', orderBy: 'nameim');
    return mapList;
    }

    //create databases biodata
        Future<int> insert(biodata object) async {
      Database db = await this.initDb();
      int count = await db.insert('bio', object.toMap());
      return count;
      }
       //create databases imunisasi
        Future<int> insertimun(Imunisasi object) async {
      Database db = await this.initDb();
      int count = await db.insert('imun', object.toMap());
      return count;
      }

      //update databases biodata
      Future<int> update(biodata object) async {
      Database db = await this.initDb();
      int count = await db.update('bio', object.toMap(),
      where: 'id=?',
      whereArgs: [object.id]);
      return count;
      }
       //update databases imunisasi
      Future<int> updateimun(Imunisasi object) async {
      Database db = await this.initDb();
      int count = await db.update('imun', object.toMap(),
      where: 'id=?',
      whereArgs: [object.id]);
      return count;
      }

      //delete databases biodata
      Future<int> delete(int id) async {
      Database db = await this.initDb();
      int count = await db.delete('bio',
      where: 'id=?',whereArgs: [id]);
      return count;
      }
       //delete databases imunisasi
      Future<int> deleteimun(int id) async {
      Database db = await this.initDb();
      int count = await db.delete('imun',
      where: 'id=?',whereArgs: [id]);
      return count;
      }
//fungsi untuk mengembalikan nilai data data yang baru dimasukkan
        Future<List<biodata>> getBiodataList() async {
        var bioMapList = await select();
        int count = bioMapList.length;
        List<biodata> bioList = List<biodata>();
        for (int i=0; i<count; i++) {
        bioList.add(biodata.fromMap(bioMapList[i]));
        }
        return bioList;
        }

         Future<List<Imunisasi>> getImunisasiList() async {
        var imunMapList = await selectimun();
        int count = imunMapList.length;
        List<Imunisasi> imunList = List<Imunisasi>();
        for (int i=0; i<count; i++) {
        imunList.add(Imunisasi.fromMap(imunMapList[i]));
        }
        return imunList;
        }
        
        factory DbHelper() {
      if (_dbHelper == null) {
      _dbHelper = DbHelper._createObject();
      }
      return _dbHelper;
      }
  Future<Database> get database async {
  if (_database == null) {
  _database = await initDb();
  }
  return _database;
  }
  }
  
