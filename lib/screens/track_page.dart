import 'package:flutter/material.dart';
import 'package:interndemo/components/constants.dart';

class TrackPage extends StatefulWidget {
  const TrackPage({super.key});

  @override
  State<TrackPage> createState() => _TrackPageState();
}

class _TrackPageState extends State<TrackPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AlertDialog(
        backgroundColor: themeColor.withOpacity(0.9),
        content: const Text(
          "Your order is on the way",
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
                foregroundColor: themeColor, backgroundColor: Colors.white),
            child: const Text("OK"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
