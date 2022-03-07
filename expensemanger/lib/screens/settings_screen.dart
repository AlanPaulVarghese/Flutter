import 'package:expensemanger/models/money.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/setting.dart';

class SettingsScrn extends StatefulWidget {
  const SettingsScrn({Key? key}) : super(key: key);

  @override
  State<SettingsScrn> createState() => _SettingsScrnState();
}

class _SettingsScrnState extends State<SettingsScrn> {
  @override
  Widget build(BuildContext context) {
    final p = Provider.of<MoneyData>(context);
    return Scaffold(
      backgroundColor: p.darkMode ? Colors.black : Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Settings"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 50,
            ),
            const Text(
              "Account",
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.w900,
              ),
            ),
            TextField(
              onSubmitted: (val) {
                Settings.setName(val);
                setState(() {});
              },
              decoration: InputDecoration(
                  border: InputBorder.none,
                  icon: const Icon(
                    Icons.supervised_user_circle_outlined,
                    size: 30,
                    color: Colors.lightBlue,
                  ),
                  labelText: "${Settings.getName()}",
                  labelStyle: const TextStyle(color: Colors.blue)),
            ),
            TextField(
              onSubmitted: (val) {
                Settings.setEmail(val);
                setState(() {});
              },
              decoration: InputDecoration(
                  border: InputBorder.none,
                  icon: const Icon(
                    Icons.email,
                    size: 30,
                    color: Colors.lightBlue,
                  ),
                  labelText: "${Settings.getEmail()}",
                  labelStyle: const TextStyle(color: Colors.blue)),
            ),
            TextField(
              onSubmitted: (val) {
                Settings.setPhone(int.parse(val));
                setState(() {});
              },
              decoration: InputDecoration(
                  border: InputBorder.none,
                  icon: const Icon(
                    Icons.phone,
                    size: 30,
                    color: Colors.lightBlue,
                  ),
                  labelText: "${Settings.getPhone()}",
                  labelStyle: const TextStyle(color: Colors.blue)),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              "App Setting",
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.w900,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Dark Mode",
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w600,
                      fontSize: 15),
                ),
                Switch(
                    value:
                        Provider.of<MoneyData>(context, listen: false).darkMode,
                    onChanged: (val) async {
                      await Settings.setDarkMode(val);
                      Provider.of<MoneyData>(context, listen: false)
                          .setDarkMode(val);
                      setState(() {});
                    }),
              ],
            )
          ],
        ),
      ),
    );
  }
}
