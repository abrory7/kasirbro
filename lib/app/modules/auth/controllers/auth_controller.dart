import 'package:get/get.dart';

class AuthController extends GetxController {
  var inputText = ''.obs; // Observasi variabel inputText

  void updateText(String text) {
    inputText.value = text; // Memperbarui nilai inputText
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
