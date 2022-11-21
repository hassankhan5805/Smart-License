import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:sizer/sizer.dart';
import 'package:smartlicense/controllers/admin_controller.dart';
import 'package:smartlicense/controllers/loading.dart';
import 'package:smartlicense/model/admin.dart';
import 'package:smartlicense/services/admin.dart';
import 'package:smartlicense/utils/appbar.dart';
import 'package:smartlicense/utils/widgets/custom_button.dart';
import 'package:smartlicense/utils/widgets/loading.dart';
import '../../../utils/warning.dart';

class SuperAdmin extends StatelessWidget {
  const SuperAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          appBar(context: context, title: "Super Admin", hideBackButton: true),
      body: Stack(
        children: [
          Obx(() {
            return !loading()
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(children: [
                      adminCntr.allAadmins != null
                          ? SizedBox(
                              height: 80.h,
                              child: ListView.builder(
                                  itemCount: adminCntr.allAadmins!.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: AdminCard(
                                          context: context,
                                          admin: adminCntr.allAadmins![index]),
                                    );
                                  }),
                            )
                          : LoadingWidget()
                    ]),
                  )
                : LoadingWidget();
          }),
          LoadingWidget()
        ],
      ),
    );
  }
}

Widget AdminCard(
    {required BuildContext context,
    required AdminModel admin,
    bool pending = true}) {
  final white = TextStyle(color: Colors.white, fontSize: 12.sp);
  final heading = TextStyle(
      color: Colors.white, fontSize: 16.sp, fontWeight: FontWeight.bold);
  return Container(
    height: admin.userType!.pendingAdmin ? 27.h : 17.h,
    width: double.infinity,
    decoration: BoxDecoration(
      color: Color.fromARGB(255, 59, 88, 97),
      borderRadius: BorderRadius.circular(12),
    ),
    padding: EdgeInsets.all(12.sp),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("${admin.appliedFor}", style: heading),
        Row(
          children: [
            Text("Admin Name:", style: white),
            Spacer(),
            Text("${admin.name}", style: white)
          ],
        ),
        Row(
          children: [
            Text("Admin Email:", style: white),
            Spacer(),
            Text("${admin.email}", style: white)
          ],
        ),
        Row(
          children: [
            Text("Admin Type:", style: white),
            Spacer(),
            Text("${admin.type}", style: white)
          ],
        ),
        Row(
          children: [
            Text("Admin Designation:", style: white),
            Spacer(),
            Text("${admin.designation}", style: white)
          ],
        ),
        Visibility(
            visible: admin.userType!.pendingAdmin,
            child: Column(
              children: [
                SizedBox(height: 2.h),
                Row(
                  children: [
                    SizedBox(
                        width: 30.w,
                        child: customButton(
                            "Accpet",
                            () => WarningDialog(
                                context: context,
                                title:
                                    "Are you sure you want to make this an admin",
                                onYes: () =>
                                    AdminServices().approveAdmin(admin)))),
                    Spacer(),
                    SizedBox(
                        width: 30.w,
                        child: customButton(
                            "Decline",
                            () => WarningDialog(
                                context: context,
                                title:
                                    "Are you sure you want to block their request",
                                onYes: () =>
                                    AdminServices().blockrequest(admin)),
                            bgColor: Colors.red))
                  ],
                )
              ],
            ))
      ],
    ),
  );
}
/*TextButton(
              onPressed: () async {
                final auth = FirebaseAuth.instance;
                final firestore = FirebaseFirestore.instance;
                int a = 7;
                var x = AdminModel(
                    uid: "$a",
                    name: "name$a",
                    email: "user$a@test.com",
                    registeredOn: Timestamp.now(),
                    type: "medicalAdmin",
                    appliedFor: "Medical Admin",
                    designation: "designation$a");
                try {
                  await firestore
                      .collection("admins")
                      .doc("$a")
                      .set(x.toJson());
                  loading(false);
                } catch (e) {
                  loading(false);
                  alertSnackbar("Can't register admin");
                }
              },
              child: Text("create dummy admin")),*/