import 'package:flutter/material.dart';

class SlipGaji extends StatelessWidget {
  SlipGaji({Key? key});

  final List<String> salaryPeriods = [
    'Januari 2023',
    'Februari 2023',
    'Maret 2023',
    'April 2023',
    'Mei 2023',
    'Juni 2023',
    'Juli 2023',
    'Agustus 2023',
    'September 2023',
    'Oktober 2023',
    'November 2023',
    'Desember 2023',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Slip Gaji"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 24),
            DropdownButtonFormField<String>(
              value: salaryPeriods.first,
              onChanged: (value) {
                print('Selected Salary Period: $value');
              },
              items: salaryPeriods.map((String period) {
                return DropdownMenuItem<String>(
                  value: period,
                  child: Text(
                    period,
                    style: TextStyle(fontSize: 16),
                  ),
                );
              }).toList(),
              decoration: InputDecoration(
                labelText: 'Pilih Periode Gaji',
                border: OutlineInputBorder(),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                labelStyle: TextStyle(fontSize: 16),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 2.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 1.0),
                ),
                suffixIcon: Icon(Icons.calendar_today),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
