import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interndemo/components/constants.dart';
import 'package:interndemo/screens/home_page.dart';
import 'package:interndemo/screens/track_page.dart';

class FinalPage extends StatelessWidget {
  const FinalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle,
              color: Colors.green,
              size: Get.height * 0.2,
            ),
            SizedBox(
              height: Get.height * 0.025,
            ),
            const Text(
              'Congratulations!!!',
              style: titleStyle,
            ),
            SizedBox(
              height: Get.height * 0.025,
            ),
            Container(
              width: Get.width * 0.5,
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Your order has been taken and is being attended to !',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(
              height: Get.height * 0.04,
            ),
            TextButton(
                style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: themeColor,
                    padding: const EdgeInsets.symmetric(horizontal: 30)),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const TrackPage()));
                },
                child: const Text('Track Order')),
            SizedBox(
              height: Get.height * 0.04,
            ),
            TextButton(
                style: TextButton.styleFrom(
                    foregroundColor: themeColor,
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 30)),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomePage()));
                },
                child: const Text('Continue Shopping'))
          ],
        ),
      ),
    );
  }
}
