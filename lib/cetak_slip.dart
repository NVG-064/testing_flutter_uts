import 'package:flutter/material.dart';
import 'package:testing_flutter_uts/detail_slip_gaji.dart';

class PrintSlipGaji extends StatelessWidget {
  const PrintSlipGaji({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cetak Slip Gaji"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DropdownButtonFormField<String>(
              items: [
                DropdownMenuItem<String>(
                  value: 'january',
                  child: Text('Januari 2023'),
                ),
                DropdownMenuItem<String>(
                  value: 'february',
                  child: Text('Februari 2023'),
                ),
              ],
              onChanged: (value) {},
              decoration: InputDecoration(
                labelText: 'Pilih Periode Gaji',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            Card(
              elevation: 3.0,
              child: ListTile(
                title: Text('Januari - 2023'),
                subtitle: Text('Total Salary: Rp 5.200.000'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return DetailSlipGaji();
                    }),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
