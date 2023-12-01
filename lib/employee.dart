class Employee {
  int? id;
  String? name;
  String? no_employee;
  String? tunjangan;
  String? insentive;
  String? bonus;
  String? overtime;
  String? net_salary;
  String? tax;

  Employee(this.id, this.name, this.no_employee, this.insentive, this.bonus,
      this.tunjangan, this.overtime, this.net_salary);

  Employee.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    no_employee = map['no_employee'];
    tunjangan = map['tunjangan'];
    insentive = map['insentive'];
    bonus = map['bonus'];
    net_salary = map['net_salary'];
    tax = map['tax'];
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = id;
    }
    map['name'] = name;
    map['no_employee'] = no_employee;
    map['tunjangan'] = tunjangan;
    map['insentive'] = insentive;
    map['bonus'] = bonus;
    map['net_salary'] = net_salary;
    map['tax'] = tax;
    return map;
  }
}
