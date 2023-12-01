import 'package:flutter/material.dart';
import 'package:testing_flutter_uts/add_slip_gaji.dart';
import 'package:testing_flutter_uts/auth_services.dart';
import 'package:testing_flutter_uts/daftar_pegawai.dart';
import 'package:testing_flutter_uts/add_pegawai.dart';
import 'package:testing_flutter_uts/home_user.dart';
import 'package:testing_flutter_uts/login.dart';
import 'package:testing_flutter_uts/slip_gaji.dart';

class Home extends StatelessWidget {
  static List<Map<String, dynamic>> employees = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Online Salary App"),
        backgroundColor: Colors.blue,
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () => Home(),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Admin"),
              accountEmail: Text("admin123@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.person,
                  color: Colors.blue,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.list),
              title: Text("Daftar Pegawai"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return DaftarPegawai(employees: employees);
                  }),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.person_add),
              title: Text("Tambah Data Pegawai"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return AddPegawai(user: false);
                  }),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.article),
              title: Text("Slip Gaji"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return SlipGaji();
                  }),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.add_box),
              title: Text("Tambah Slip Gaji"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return AddSlipGaji();
                  }),
                );
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text("Logout"),
              onTap: () async {
                AuthServices.signOut();

                // Navigate to the Login page
                await Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Hi, Admin!",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeUser()),
                );
              },
              child: Text('Dashboard User'),
            ),
          ],
        ),
      ),
    );
  }
}
