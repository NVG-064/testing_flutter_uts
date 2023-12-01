class User {
  int? id;
  late String fullName; // Add fullName property
  late String username;
  late String password;
  late String role;

  User({
    this.id,
    required this.fullName,
    required this.username,
    required this.password,
    required this.role,
  });

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'fullName': fullName, // Update to include fullName
      'username': username,
      'password': password,
      'role': role,
    };
    if (id != null) {
      map['id'] = id;
    }
    return map;
  }

  User.fromMap(Map<String, dynamic> map) {
    id = map['id']; // Update to include fullName
    username = map['username'];
    password = map['password'];
    role = map['role'];
  }
}
