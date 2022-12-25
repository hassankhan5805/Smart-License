import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:smartlicense/utils/appbar.dart';
import 'package:smartlicense/utils/widgets/custom_button.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context: context, title: "Welcome",hideBackButton: true),
      body: Column(
        children: [
          customButton("Apply for license renewel", (){}),
          SizedBox(height: 2.h),
          customButton("Apply for new license", (){}),

        ],
      ),
    );
  }
}