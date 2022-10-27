import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_projek/app/modules/home/views/ayat_kursi_page.dart';
import 'package:quran_projek/app/modules/home/views/bacaan_sholat_page.dart';
import 'package:quran_projek/app/modules/home/views/doa.dart';

import '../../../constants/color.dart';
import '../../../routes/app_pages.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _drawerHeader(),
          const Padding(
            padding: EdgeInsets.only(left: 20.0, top: 10, bottom: 10),
            child: Text("List Fitur",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                )),
          ),
          _drawerItem(
              icon: Icons.book, text: 'Ayat Kursi', onTap: () {
                Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const AyatKursi()));
              }),
          _drawerItem(
              icon: Icons.collections_bookmark, text: 'Bacaan Sholat', 
              onTap: () {
                Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const BacaanSholat()));
              }),
              
          _drawerItem(
              icon: Icons.my_library_books_rounded, text: 'Doa Harian', 
              onTap: () {
                Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const BacaanDoa()));
              }),
              
          _drawerItem(
            icon: Icons.format_quote_rounded,
            text: 'Quotes',
            onTap: () {
              Get.toNamed(
                Routes.QUOTE_SCREEN,
              );
            },
          ),
          const Divider(height: 25, thickness: 1),
          const Padding(
            padding: EdgeInsets.only(left: 20.0, top: 10, bottom: 10),
            child: Text("Other",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                )),
          ),
          _drawerItem(
            icon: Icons.info_rounded,
            text: 'About',
            onTap: () {
              Get.dialog(AlertDialog(
                  title: const Text(
                    "Tentang Aplikasi",
                  ),
                  scrollable: true,
                  content: Column(
                    children: const [
                      Text(
                        "Aplikasi Ini Dibuat Dengan Konsep Sederhana dan juga Semoga Bermanfaat Bagi Pengguna Aplikasi ini",
                        textAlign: TextAlign.justify,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text("~Developer ♥♥♥ "),
                    ],
                  )));
            },
          ),
        ],
      ),
    );
  }
}

Widget _drawerHeader() {
  return UserAccountsDrawerHeader(
    decoration: const BoxDecoration(color: appDarkBlue),
    currentAccountPicture: Row(
      children: const [
        ClipOval(
          child: Image(
              image: AssetImage('assets/images/qurran.png'), fit: BoxFit.cover),
        ),
        // Text("Al Quran"),
      ],
    ),
    accountName: const Text('Al-Quran Indonesia'),
    accountEmail: const Text('Version 1.0'),
  );
}

Widget _drawerItem(
    {required IconData icon, required String text, GestureTapCallback? onTap}) {
  return ListTile(
    title: Row(
      children: <Widget>[
        Icon(icon),
        Padding(
          padding: const EdgeInsets.only(left: 25.0),
          child: Text(
            text,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    ),
    onTap: onTap,
  );
}
