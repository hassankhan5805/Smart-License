import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartlicense/controllers/admin_controller.dart';
import 'package:smartlicense/services/reception.dart';
import 'package:smartlicense/utils/appbar.dart';
import 'package:smartlicense/utils/widgets/loading.dart';

class WaitingRoom extends StatelessWidget {
  const WaitingRoom({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context:context,title: "Waiting room"),
      body: Container(
        child: Center(
            child: adminCntr.admin != null
                ? GetX<AdminController>(
                    init: Get.put<AdminController>(AdminController()),
                    builder: (admin) {
                      if (admin.admin!.value.userType != null &&
                          !admin.admin!.value.userType!.pendingAdmin)
                        Reception().userReception();
                      return Text(admin.admin!.value.type == null
                          ? "No data"
                          : "${admin.admin!.value.type}");
                    })
                : LoadingWidget()),
      ),
    );
  }
}
