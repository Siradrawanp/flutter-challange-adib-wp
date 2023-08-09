import 'package:get/get.dart';
import 'package:ist_hometest_app/services/auth_services.dart';

import '../model/user_model.dart';

class LoginController extends GetxController {
  var userData = <User>[].obs;
  var isLogged = false.obs;

  login(String username, String password) async {
    var data = await AuthServices.login(username, password);
    if (data['status']) {
      userData.value = data['data'];
      isLogged(true);
    }
  }

  logout() {
    userData.clear();
    isLogged(false);
  }
}