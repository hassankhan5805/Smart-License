import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:smartlicense/services/reception.dart';
import 'package:smartlicense/utils/appbar.dart';
import 'package:smartlicense/utils/snackbar.dart';
import 'package:smartlicense/utils/widgets/custom_button.dart';

class EmailVerification extends StatelessWidget {
  const EmailVerification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(
            context: context,
            title: "Email Verification",
            hideBackButton: true,
            showLogout: true),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
                "Verification email is sent to ${FirebaseAuth.instance.currentUser!.email} \nPlease verify that email in your inbox and then refresh",
                textAlign: TextAlign.center),
            SizedBox(height: 4.h),
            Text("If you can't find this email please check your SPAM",
                style: TextStyle(color: Colors.red)),
            SizedBox(height: 4.h),
            customButton("Refresh", () async {
              final auth = FirebaseAuth.instance.currentUser!;
              await auth.reload();
              if (auth.emailVerified) {
                Reception().userReception();
              }
            }),
            SizedBox(height: 4.h),
            customButton("Resend", () async {
              final auth = FirebaseAuth.instance.currentUser!;
              await auth.sendEmailVerification();
              snackbar("Success", "Verification send to ${auth.email}");
            }),
            SizedBox(height: 4.h),
          ],
        ));
  }
}
