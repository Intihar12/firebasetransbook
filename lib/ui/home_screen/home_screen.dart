import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebasetransbook/controllers/client_controller/client_controller.dart';
import 'package:firebasetransbook/controllers/trip_controller/trip_controller.dart';
import 'package:firebasetransbook/controllers/truck_controller/truck_controller.dart';
import 'package:firebasetransbook/values/dimens.dart';
import 'package:firebasetransbook/values/my_colors.dart';
import 'package:firebasetransbook/values/my_imgs.dart';
import 'package:firebasetransbook/values/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants.dart';
import '../../controllers/auth_controllers/auth_controller.dart';
import '../../controllers/driver_controller/driver_controller.dart';
import '../../controllers/profile_controller/profile_controller.dart';
import '../../controllers/supplier_controller/supplier_controller.dart';
import '../../utils/utils.dart';
import '../../widgets/hom_screen_all_containers_widget.dart';
import '../../widgets/hom_screen_widget.dart';
import '../auth/login_screen.dart';
import '../client_screen/client_screen.dart';
import '../driver_screens/driver_screen.dart';
import '../profile/edit_profile_screen.dart';
import '../supplier_screen/supplier_screen.dart';
import '../trips_screen/trips_screen.dart';
import '../truck_screens/truck_screen.dart';

class HomScreen extends StatelessWidget {
  final controller = Get.put(ProfileController());

  HomScreen({Key? key}) : super(key: key);
  final auth = FirebaseAuth.instance;
  AuthControllers authControllers = Get.put(AuthControllers());
  SupplierController supplierControllers = Get.put(SupplierController());
  DriverController driverController = Get.find();
  ClientController clientController = Get.find();
  TripController tripController = Get.find();
  TruckController truckController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        // backgroundColor: MyColors.black,
        child: ListView(
          children: [
            DrawerHeader(decoration: BoxDecoration(color: Colors.deepPurple), child: Text("drewer header")),
            ListTile(
              title: Text("Edit"),
              onTap: () {
                controller.isLoadingProfile.value = true;
                controller.isUpdateProfileLoading.value = true;
                controller.isEditScreen.value = false;
                controller.getUserData();
                Get.to(EditProfileScreen());
                controller.update();
              },
            )
          ],
        ),
      ),
      backgroundColor: MyColors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: MyColors.textAppbarcolor),
        automaticallyImplyLeading: true,
        backgroundColor: MyColors.white,
        elevation: 0,
        title: Row(
          children: [
            Container(
              alignment: Alignment.center,
              height: 30,
              width: 30,
              decoration: BoxDecoration(shape: BoxShape.circle, color: MyColors.grey),
              child: Text(
                authControllers.avatarText ?? "",
                style: TextStyles.white15PtLessWeightTextStyle,
              ),
            ),
            SizedBox(
              width: getWidth(Dimens.size15),
            ),
            Text(
              authControllers.userBusinessInfoModal.name.toString(),
              style: TextStyles.blackLessWeight14PtTextStyle,
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              auth.signOut().then((value) {
                Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
              }).onError((error, stackTrace) {
                Utils().toastMessage(error.toString());
              });
            },
            icon: Icon(
              Icons.logout,
              color: MyColors.textAppbarcolor,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: getHeight(Dimens.size40),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: getWidth(Dimens.size20), vertical: getHeight(Dimens.size20)),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    HomeScreenWidget(
                      onTap: () {
                        Get.to(TripsScreen());
                      },
                      text: "Trips",
                      icon: MyImgs.tripsIcon,
                      backGroundColor: MyColors.orange2,
                    ),
                    HomeScreenWidget(
                      onTap: () {
                        clientController.isClientScreenLoading = false;
                        clientController.getClientData();
                        Get.to(ClilentsScreenState());
                      },
                      text: "Clients",
                      icon: MyImgs.clientIcon,
                      backGroundColor: MyColors.green4,
                    ),
                    HomeScreenWidget(
                      onTap: () {},
                      text: "Reports",
                      icon: MyImgs.viewReporysImg,
                      backGroundColor: MyColors.yellow1,
                    ),
                  ],
                ),
                SizedBox(
                  height: getHeight(Dimens.size20),
                ),
                GestureDetector(
                  onTap: () {
                    controller.update();
                  },
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      //  height: 43,
                      height: getHeight(Dimens.size50),
                      decoration: BoxDecoration(
                          //  color: AppColors.mainColor,
                          color: MyColors.blue1,
                          borderRadius: BorderRadius.circular(25)),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "addTrip",
                              style: TextStyles.white15PtLessWeightTextStyle,
                            ),
                            Icon(
                              Icons.add_rounded,
                              color: Colors.white,
                              size: 20,
                            )
                          ],
                        ),
                      )),
                ),
                SizedBox(
                  height: getHeight(Dimens.size20),
                ),
              ],
            ),
          ),
          Container(
            //  height: getHeight(Dimens.size360),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: MyColors.grey1),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: getWidth(Dimens.size20), vertical: getHeight(Dimens.size20)),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      HomeScreenAllContainersWidgets(
                        onTap: () {
                          supplierControllers.isSupplierData.value = false;
                          supplierControllers.getUserData();
                          Get.to(SupplierScreen());
                          supplierControllers.update();
                        },
                        text: "Supplier",
                        icon: MyImgs.personIcon,
                      ),
                      HomeScreenAllContainersWidgets(
                        onTap: () {
                          driverController.isCreateDriver.value = false;
                          driverController.getDriverListData();
                          Get.to(DriverScreen());
                          driverController.update();
                        },
                        text: "Driver",
                        icon: MyImgs.deriverIcon,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: getHeight(Dimens.size12),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      HomeScreenAllContainersWidgets(
                        onTap: () {
                          truckController.isTruckListDataLoading.value = true;
                          truckController.getTruckData();
                          Get.to(TruckScreen());
                        },
                        text: "Truck",
                        icon: MyImgs.truckIcon,
                      ),
                      HomeScreenAllContainersWidgets(
                        onTap: () {},
                        text: "Expense",
                        icon: MyImgs.homeIcon,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: getHeight(Dimens.size12),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      HomeScreenAllContainersWidgets(
                        onTap: () {},
                        text: "Shop khata",
                        icon: MyImgs.repairs,
                      ),
                      HomeScreenAllContainersWidgets(
                        onTap: () {},
                        text: "Invoice",
                        icon: MyImgs.invoiceIcon,
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
