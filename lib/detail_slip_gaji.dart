import 'package:flutter/material.dart';

class DetailSlipGaji extends StatelessWidget {
  const DetailSlipGaji({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Slip Gaji"),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: Icon(Icons.print),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.file_download),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Row(
                children: [
                  Text(
                    "Periode",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 8),
                  Text(
                    ": Januari 2023",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const Row(
                children: [
                  Text(
                    "Nama",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 8),
                  Text(
                    ": John Doe",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              DetailItem("Tunjangan Status", "Rp 1,000,000"),
              DetailItem("Base Salary", "Rp 5,000,000"),
              DetailItem("Overtime", "Rp 500,000"),
              DetailItem("Intensive Position", "Rp 2,000,000"),
              DetailItem("Bonus", "Rp 1,000,000"),
              DetailItem("Gross Salary", "Rp 9,500,000"),
              DetailItem("Tax (BPJS & PPH21)", "Rp 1,000,000"),
              DetailItem("Net Salary", "Rp 8,500,000"),
            ],
          ),
        ),
      ),
    );
  }
}

class DetailItem extends StatelessWidget {
  final String label;
  final String value;

  DetailItem(this.label, this.value);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
          Text(value),
        ],
      ),
    );
  }
}
