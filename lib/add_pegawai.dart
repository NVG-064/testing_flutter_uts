import 'package:flutter/material.dart';
import 'package:testing_flutter_uts/daftar_pegawai.dart';

class AddPegawai extends StatefulWidget {
  final bool user;

  const AddPegawai({Key? key, required this.user}) : super(key: key);

  @override
  _AddPegawaiState createState() => _AddPegawaiState();
}

class _AddPegawaiState extends State<AddPegawai> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _overtimeController = TextEditingController();

  String _typeStaff = 'Permanent Staff';
  String _status = 'Single';
  String _insentivePosition = 'Staff';

  double _baseSalary = 5500000.0;
  double _bonus = 0.0;
  double _grossSalary = 0.0;
  double _tax = 0.0;
  double _netSalary = 0.0;

  List<Map<String, dynamic>> employees = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Data Pegawai'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 24),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
                maxLength: 50,
              ),
              SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: _typeStaff,
                onChanged: (value) {
                  setState(() {
                    _typeStaff = value!;
                  });
                },
                items: ['Permanent Staff', 'Non Permanent Staff']
                    .map<DropdownMenuItem<String>>(
                      (String value) => DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      ),
                    )
                    .toList(),
                decoration: InputDecoration(
                  labelText: 'Type Staff',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: _status,
                onChanged: (value) {
                  setState(() {
                    _status = value!;
                  });
                },
                items: ['Single', 'Married']
                    .map<DropdownMenuItem<String>>(
                      (String value) => DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      ),
                    )
                    .toList(),
                decoration: InputDecoration(
                  labelText: 'Status',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: _insentivePosition,
                onChanged: (value) {
                  setState(() {
                    _insentivePosition = value!;
                  });
                },
                items: [
                  'Staff',
                  'Supervisor',
                  'Manager',
                  'Head of Department',
                  'Director'
                ]
                    .map<DropdownMenuItem<String>>(
                      (String value) => DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      ),
                    )
                    .toList(),
                decoration: InputDecoration(
                  labelText: 'Incentive Position',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _overtimeController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Overtime (hours)',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value != null && double.tryParse(value) != null) {
                    double overtime = double.parse(value);
                    if (overtime > 12) {
                      return 'Overtime cannot exceed 12 hours';
                    }
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  saveEmployeeData();
                },
                child: Text('Save Employee Data'),
              ),
              SizedBox(height: 16),
              Text(
                'Result:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Text('Base Salary: $_baseSalary'),
              Text('Bonus: $_bonus'),
              Text('Gross Salary: $_grossSalary'),
              Text('Tax: $_tax'),
              Text('Net Salary: $_netSalary'),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Icon(Icons.arrow_back),
      ),
    );
  }

  void saveEmployeeData() {
    String name = _nameController.text;
    String typeStaff = _typeStaff;
    String status = _status;
    String incentivePosition = _insentivePosition;
    double overtime = double.tryParse(_overtimeController.text) ?? 0.0;

    // Create a map with employee data
    Map<String, dynamic> newEmployee = {
      'name': name,
      'typeStaff': typeStaff,
      'status': status,
      'incentivePosition': incentivePosition,
      'overtime': overtime,
    };

    // Add the new employee to the list
    employees.add(newEmployee);

    // Print the employee data (optional)
    print('Employee Data: $newEmployee');

    // Print all employees (optional)
    print('All Employees: $employees');

    // Show a message that data is saved (optional)
    print('Employee data saved successfully!');

    // Navigate to DaftarPegawai with the updated employees list
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) {
        return DaftarPegawai(employees: employees);
      }),
    );
  }

  double getIncentivePositionValue(String position) {
    switch (position) {
      case 'Supervisor':
        return 3000000.0;
      case 'Manager':
        return 4500000.0;
      case 'Head of Department':
        return 10000000.0;
      case 'Director':
        return 25000000.0;
      default:
        return 1000000.0;
    }
  }
}
