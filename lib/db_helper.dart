import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:testing_flutter_uts/employee.dart';
import 'package:testing_flutter_uts/user.dart'; // Import the User class

class DbHelper {
  static final DbHelper _instance = DbHelper._internal();
  static Database? _database;
  final String tableName = 'tableemployee';
  final String columnId = 'id';
  final String name = 'name';
  final String no_employee = 'no_employee';
  final String tunjangan = 'tunjangan';
  final String insentive = 'insentif';
  final String bonus = 'bonus';
  final String tax = 'tax';
  final String net_salary = 'net_salary';

  // Define the user-related variables
  final String userTableName = 'tableuser';
  final String userIdColumn = 'id';
  final String usernameColumn = 'username';
  final String passwordColumn = 'password';
  final String roleColumn = 'role';

  DbHelper._internal();
  factory DbHelper() => _instance;

  Future<Database?> get _db async {
    if (_database != null) {
      return _database;
    }
    _database = await _initDb();
    return _database;
  }

  Future<Database?> _initDb() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'employee.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    var sql = "CREATE TABLE $tableName($columnId INTEGER PRIMARY KEY, "
        "$name TEXT,"
        "$no_employee TEXT,"
        "$tunjangan TEXT,"
        "$insentive TEXT,"
        "$bonus TEXT,"
        "$tax TEXT,"
        "$net_salary TEXT)";
    await db.execute(sql);

    // Add the user table creation SQL statement
    var userTableSql =
        "CREATE TABLE $userTableName($userIdColumn INTEGER PRIMARY KEY, "
        "$usernameColumn TEXT,"
        "$passwordColumn TEXT,"
        "$roleColumn TEXT)";
    await db.execute(userTableSql);

    // Tambahkan user admin ke dalam tabel user pada saat pembuatan database
    var adminUser = User(
      fullName: 'Viona Cornelia',
      username: 'admin',
      password: 'admin123',
      role: 'admin',
    );
    await saveUser(adminUser);
  }

  Future<void> insertAdminUser() async {
    var adminUser = User(
      fullName: 'Viona Cornelia',
      username: 'admin',
      password: 'admin123',
      role: 'admin',
    );
    await saveUser(adminUser);
  }

  Future<void> ensureAdminUserExists() async {
    User? adminUser = await DbHelper().getUser('admin');
    if (adminUser == null) {
      await insertAdminUser();
    }
  }

  Future<int?> saveEmployee(Employee employee) async {
    var dbClient = await _db;
    return await dbClient!.insert(tableName, employee.toMap());
  }

  Future<List<Employee>?> getAllEmployee() async {
    var dbClient = await _db;
    var result = await dbClient!.query(tableName, columns: [
      columnId,
      name,
      no_employee,
      tunjangan,
      bonus,
      insentive,
      tax,
      net_salary
    ]);
    return result.isNotEmpty
        ? result.map((e) => Employee.fromMap(e)).toList()
        : null;
  }

  Future<int?> updateEmployee(Employee employee) async {
    var dbClient = await _db;
    return await dbClient!.update(tableName, employee.toMap(),
        where: '$columnId = ?', whereArgs: [employee.id]);
  }

  Future<int?> deleteEmployee(int id) async {
    var dbClient = await _db;
    return await dbClient!
        .delete(tableName, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<User?> getUser(String username) async {
    var dbClient = await _db;
    var result = await dbClient!.query(userTableName,
        columns: [userIdColumn, usernameColumn, passwordColumn, roleColumn],
        where: '$usernameColumn = ?',
        whereArgs: [username]);
    return result.isNotEmpty ? User.fromMap(result.first) : null;
  }

  Future<int?> saveUser(User user) async {
    var dbClient = await _db;
    return await dbClient!.insert(userTableName, user.toMap());
  }

  getEmployeeByName(String fullName) {}
}
