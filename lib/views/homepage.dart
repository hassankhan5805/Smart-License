import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:smartlicense/services/authentication.dart';

import '../utils/widgets/custom_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Home Page"),
            SizedBox(
              height: 3.h,
            ),
            customButton("Sign Out!", () {
              Authentication().signOut();
            },
                bgColor: MaterialStateProperty.all(Colors.white),
                textColor: Colors.blue),
          ],
        ),
      ),
    );
  }
}
