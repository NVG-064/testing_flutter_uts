import 'package:flutter/material.dart';

class SalaryPage extends StatefulWidget {
  final bool user;

  const SalaryPage({Key? key, required this.user}) : super(key: key);

  @override
  _SalaryPageState createState() => _SalaryPageState();
}

class _SalaryPageState extends State<SalaryPage> {
  // Controller for text input fields
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _overtimeController = TextEditingController();

  // Dropdown value holders
  String _typeStaff = 'Permanent Staff';
  String _status = 'Single';
  String _insentivePosition = 'Staff';

  // Other variables
  double _baseSalary = 5500000.0; // Initial value for permanent staff
  double _bonus = 0.0;
  double _grossSalary = 0.0;
  double _tax = 0.0;
  double _netSalary = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Salary Page'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Navigate back to the Home page when the back icon is pressed
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Employee Data Entry',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name'),
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
                decoration: InputDecoration(labelText: 'Type Staff'),
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
                decoration: InputDecoration(labelText: 'Status'),
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
                decoration: InputDecoration(labelText: 'Incentive Position'),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _overtimeController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Overtime (hours)'),
                validator: (value) {
                  // Validate the overtime input
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
                  // Calculate salary components when the button is pressed
                  calculateSalary();
                },
                child: Text('Calculate Salary'),
              ),
              SizedBox(height: 16),
              Text('Result:'),
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
          // Navigate back to the Home page when the button is pressed
          Navigator.pop(context);
        },
        child: Icon(Icons.arrow_back),
      ),
    );
  }

  // Function to calculate salary components
  void calculateSalary() {
    // Reset variables
    _bonus = 0.0;
    _grossSalary = 0.0;
    _tax = 0.0;
    _netSalary = 0.0;

    // Parse input values
    double overtime = double.tryParse(_overtimeController.text) ?? 0.0;

    // Calculate bonus
    if (overtime > 0) {
      _bonus = overtime * 100000.0;
    }

    // Calculate gross salary
    _grossSalary = _baseSalary +
        (_status == 'Married' ? 1000000.0 : 0.0) +
        getIncentivePositionValue(_insentivePosition) +
        _bonus;

    // Calculate tax
    _tax = 0.11 * _grossSalary + 250000.0;

    // Calculate net salary
    _netSalary = _grossSalary - _tax;

    // Update the UI
    setState(() {});
  }

  // Function to get incentive position value
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
        return 1000000.0; // Default for 'Staff'
    }
  }
}
