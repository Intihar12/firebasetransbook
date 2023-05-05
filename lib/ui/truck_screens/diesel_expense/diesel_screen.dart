import 'package:firebasetransbook/controllers/truck_controller/truck_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DieselScreen extends StatelessWidget {
  DieselScreen({Key? key}) : super(key: key);
  TruckController truckController = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TruckController>(builder: (controller) {
      return Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: 500,
              child: ListView.builder(
                  itemCount: truckController.dieselList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [Text(truckController.dieselList[index].amount)],
                    );
                  }),
            )
          ],
        ),
      );
    });
  }
}
