import 'package:get/get.dart';

import 'controllers/client_controller/client_controller.dart';
import 'controllers/country_code_controller/country_code_controller.dart';
import 'controllers/driver_controller/driver_controller.dart';
import 'controllers/trip_controller/trip_controller.dart';
import 'controllers/truck_controller/truck_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CountryController>(() => CountryController(), fenix: true);
    Get.lazyPut<DriverController>(() => DriverController(), fenix: true);
    Get.lazyPut<ClientController>(() => ClientController(), fenix: true);
    Get.lazyPut<TripController>(() => TripController(), fenix: true);
    Get.lazyPut<TruckController>(() => TruckController(), fenix: true);
  }
}
