import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;

class DBHelper {
  //opening data base
  static Future<sql.Database> database() async {
    final dbPath = await sql.getDatabasesPath();
    return sql.openDatabase(path.join(dbPath, 'userssdb.db'),
        version: 1, onCreate: _createDB);
  }

  static Future _createDB(db, version) {
    //making the table for users
    return db.execute('''
    create table userss(
      id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
      name text not null,
      surname text not null,
      date text not null,
      gender text not null,
      weight int not null,
      username text not null ,
      pwd text text not null,
      email text not null
    )
    ''');
  }

  static Future<int> insert(String table, Map<String, Object> data) async {
    //isnert data for user
    final db = await DBHelper.database();
    final id =
        db.insert(table, data, conflictAlgorithm: sql.ConflictAlgorithm.ignore);
    return id;
  }

  static Future<List<Map<String, dynamic>>> getData(table) async {
    // gets all data from that table
    final db = await DBHelper.database();
    return db.query(table);
  }

// taking the username and pwd and check if exists
  static const String C_UserName = 'username';
  static const String C_Password = 'pwd';

  static Future<List<Map<String, dynamic>>?> getUser(
      String username, String pwd) async {
    var dbClient = await DBHelper.database();
    var res = await dbClient.rawQuery("SELECT username,pwd FROM userss WHERE "
        "$C_UserName = '$username' AND "
        "$C_Password = '$pwd'");
    if (res.length > 0) {}
    return res.toList();
  }

// Read all items
  static Future<List<Map<String, dynamic>>> getItems() async {
    final db = await DBHelper.database();
    return db.query('userss', orderBy: "id");
  }

  // Update an item by id but i didnt emplement it in app. :)
  static Future<int> updateItem(
      int id,
      String name,
      String surname,
      String date,
      String gender,
      int weight,
      String username,
      String pwd,
      String email) async {
    final db = await DBHelper.database();

    final data = {
      'name': name,
      'surname': surname,
      'date': date,
      'gender': gender,
      'weight': weight,
      'username': username,
      'pwd': pwd,
      'email': email
    };
    final result =
        /* Δίνω ως όρισμα τον table, τα data (map structure)
    where για matching id & περνάω το id στο whereArgs για αποφυγή SQL injection */
        await db.update('userss', data, where: "id = ?", whereArgs: [id]);
    return result;
  }
}
