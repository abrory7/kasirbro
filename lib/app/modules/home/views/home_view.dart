import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, screenType) {
      return GestureDetector(
        onTap: () {
          // Menghilangkan fokus dari TextField ketika menekan di luar
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          backgroundColor: const Color.fromRGBO(236, 240, 241, 1.0),
          body: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 20.h,
                ),
                child: Center(
                  child: Image.asset(
                    'assets/img/logo.png', // Atur tinggi gambar sesuai kebutuhan
                    height: 17.h,
                  ),
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.all(1.h),
                  child: Text(
                    "Nama pengguna:",
                    style: TextStyle(fontSize: 17.sp),
                  ),
                ),
              ),
              SizedBox(
                width: 25.w,
                child: TextField(
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(fontSize: 16.5.sp, fontWeight: FontWeight.bold),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]')),
                    UpperCaseTextFormatter(),
                  ],
                  maxLength: 10,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(5), // Sudut yang lebih tegas
                      borderSide: const BorderSide(
                        color: Color.fromRGBO(44, 62, 80, 1.0), // Warna border
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(5), // Sudut saat fokus
                      borderSide: const BorderSide(
                        color:
                            Color.fromRGBO(44, 62, 80, 1.0), // Warna saat fokus
                        width: 2, // Lebar border saat fokus
                      ),
                    ),
                    hintText: 'Masukkan nama pengguna di sini',
                    hintStyle: TextStyle(
                      fontSize: 13.sp,
                      color: const Color.fromRGBO(44, 62, 80, .5),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                        vertical: 2.h,
                        horizontal: 2.w), // Sesuaikan padding vertikal
                    isDense: true,
                    counterText: '',
                  ),
                  onChanged: (text) {
                    print(text);
                    controller.inputText.value =
                        text; // Memperbarui nilai di controller
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.all(2.h),
                width: 17.5.w,
                height: 8.h,
                child: ElevatedButton(
                  onPressed: () {
                    // Menghilangkan fokus dari TextField saat tombol ditekan
                    FocusScope.of(context).unfocus();

                    if (controller.inputText.value.isNotEmpty) {
                      // Mencetak teks dari controller saat tombol ditekan
                      print(
                          'Teks yang dimasukkan: ${controller.inputText.value}');
                      // Tambahkan logika tambahan jika diperlukan
                    } else {
                      // Feedback jika input kosong
                      print('Input tidak boleh kosong!');
                      Get.snackbar('Error',
                          'Nama pengguna tidak boleh kosong!'); // Menampilkan snackbar
                    }
                  },
                  style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromRGBO(44, 62, 80, 1.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          minimumSize: const Size(100, 40),
                          foregroundColor: Colors.white)
                      .copyWith(
                    elevation:
                        WidgetStateProperty.all(5), // Menambahkan efek bayangan
                  ),
                  child: Text(
                    'Masuk',
                    style:
                        TextStyle(fontSize: 17.sp, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection, // Menjaga posisi kursor
    );
  }
}
