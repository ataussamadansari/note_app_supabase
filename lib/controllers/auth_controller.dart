import 'package:get/get.dart';
import '../core/supabase_constant.dart';
import '../data/repositories/auth_repository.dart';
import '../ui/home_screen.dart';
import '../ui/login_screen.dart';

class AuthController extends GetxController {
  final AuthRepository repo = AuthRepository();

  RxBool isLoading = false.obs;

  @override
  void onInit() {
    supabaseAuth.onAuthStateChange.listen((data) {
      if (data.session == null) {
        Get.offAll(() => LoginScreen());
      }
    });
    super.onInit();
  }

  /// 🔥 Session Check
  void checkSession() {
    final session = currentSession;

    if (session != null) {
      Get.offAll(() => HomeScreen());
    } else {
      Get.offAll(() => LoginScreen());
    }
  }

  Future<void> register(
      String name, String email, String password) async {
    try {
      isLoading.value = true;
      await repo.register(name, email, password);
      Get.snackbar("Success", "Account Created");
      Get.offAll(() => HomeScreen());
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> login(String email, String password) async {
    try {
      isLoading.value = true;
      await repo.login(email, password);
      Get.snackbar("Success", "Login Successful");
      Get.offAll(() => HomeScreen());
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> logout() async {
      await repo.logout();
  }
}
