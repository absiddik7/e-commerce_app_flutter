import 'package:flutter/material.dart';

class NavDrawer extends StatefulWidget {
  const NavDrawer({super.key});

  @override
  State<NavDrawer> createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = size.width;

    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topRight: Radius.circular(30),
        bottomRight: Radius.circular(30),
      ),
      child: Drawer(
        width: width * 0.7,
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          children: [
            const SizedBox(
              height: 160,
              child: DrawerHeader(
                margin: EdgeInsets.symmetric(vertical: 0),
                decoration: BoxDecoration(
                  color: Colors.indigo,
                ),
                child: Center(
                  child: Text('Diabetes Diary',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      )),
                ),
              ),
            ),
            Container(
              color: Colors.orange,
              child: ListTile(
                  leading: const Icon(Icons.add, color: Colors.white),
                  title: const Text('Add a record',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      )),
                  onTap: () {
                    Navigator.pop(context);
                 
                  }),
            ),
            ListTile(
              selectedColor: Colors.red,
              leading: const Icon(Icons.home),
              title: const Text('Home',
                  style: TextStyle(
                    fontSize: 16,
                  )),
              onTap: () {
                Navigator.pop(context);
                
              },
            ),
            ListTile(
              leading: const Icon(Icons.water_drop_outlined),
              title: const Text('Glucose',
                  style: TextStyle(
                    fontSize: 16,
                  )),
              onTap: () {
                Navigator.pop(context);
               
              },
            ),
            ListTile(
              leading: const Icon(Icons.monitor_heart_rounded),
              title: const Text('Pressure',
                  style: TextStyle(
                    fontSize: 16,
                  )),
              onTap: () {
                Navigator.pop(context);
               
              },
            ),
            ListTile(
              leading: const Icon(Icons.monitor_weight),
              title: const Text('Weight',
                  style: TextStyle(
                    fontSize: 16,
                  )),
              onTap: () {
                Navigator.pop(context);
                
              },
            ),
            ListTile(
              leading: const Icon(Icons.medication_outlined),
              title: const Text('Medication',
                  style: TextStyle(
                    fontSize: 16,
                  )),
              onTap: () {
                Navigator.pop(context);
               
              },
            ),
            ListTile(
              leading: const Icon(Icons.medical_services_outlined),
              title: const Text('Appointments',
                  style: TextStyle(
                    fontSize: 16,
                  )),
              onTap: () {
                Navigator.pop(context);
                
              },
            ),
            const Divider(
              thickness: 1,
            ),
            ListTile(
              leading: const Icon(Icons.download),
              title: const Text('Export',
                  style: TextStyle(
                    fontSize: 16,
                  )),
              onTap: () {
                Navigator.pop(context);
                
              },
            ),
            const Divider(
              thickness: 1,
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings',
                  style: TextStyle(
                    fontSize: 16,
                  )),
              onTap: () {
                Navigator.pop(context);
                
              },
            ),
            ListTile(
              leading: const Icon(Icons.share),
              title: const Text('Share',
                  style: TextStyle(
                    fontSize: 16,
                  )),
              onTap: () {
                // Update the state of the app.
              },
            ),
          ],
        ),
      ),
    );
  }
}