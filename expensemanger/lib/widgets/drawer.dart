import 'package:flutter/material.dart';
import '../screens/balancesheet.dart';
import '../models/setting.dart';
import '../screens/settings_screen.dart';
import 'package:provider/provider.dart';
import '../models/money.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final p = Provider.of<MoneyData>(context);
    return Container(
      color: p.darkMode ? Colors.black : Colors.white,
      child: Column(
        children: [
          SizedBox(
            height: size.height * .3,
            width: size.width,
            child: Container(
              padding: const EdgeInsets.only(left: 30),
              color: Colors.blue,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.white,
                    child: Text(
                      Settings.getName().toString()[0],
                      style: const TextStyle(fontSize: 35),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    "${Settings.getName()}",
                    style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    "${Settings.getEmail()}",
                    style: const TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (ctx) => const BalanceSheet()));
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 12.0, top: 8.0),
              child: Row(
                children: const [
                  Icon(
                    Icons.file_copy,
                    color: Colors.blue,
                    size: 30,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Balance sheet",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.blue,
                        fontWeight: FontWeight.w900),
                  ),
                ],
              ),
            ),
          ),
          const Divider(),
          const SizedBox(
            height: 5,
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (ctx) => const SettingsScrn()));
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 12.0, top: 8.0),
              child: Row(
                children: const [
                  Icon(
                    Icons.settings,
                    color: Colors.blue,
                    size: 30,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Settings",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.blue,
                        fontWeight: FontWeight.w900),
                  ),
                ],
              ),
            ),
          ),
          const Divider(),
        ],
      ),
    );
  }
}
