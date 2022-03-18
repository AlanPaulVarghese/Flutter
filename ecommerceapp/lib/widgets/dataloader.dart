import 'package:flutter/material.dart';

class DataLoader extends StatelessWidget {
  final Future future;
  final Widget child;
  const DataLoader({Key? key, required this.future, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
      builder: (ctx, snap) {
        if (snap.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        if (snap.hasError) {
          return const Scaffold(
            body: Center(
              child: Text("An Error Ocuured!"),
            ),
          );
        }
        return child;
      },
    );
  }
}
