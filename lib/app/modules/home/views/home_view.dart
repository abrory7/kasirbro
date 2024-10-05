import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, screenType) {
        return Scaffold(
          body: SafeArea(
            child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(3.h),
                      color: const Color.fromRGBO(44, 62, 80, 1.0),
                      child: Image.asset(
                        'assets/img/logo.png',
                        height: 10.h,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 8,
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(3.h),
                      color: const Color.fromRGBO(236, 240, 241, 1.0),
                      child: Column(
                        children: [
                          SizedBox(height: 6.5.h),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 7.w),
                              child: GridView.count(
                                crossAxisCount: 4,
                                crossAxisSpacing: 3.w,
                                physics: const NeverScrollableScrollPhysics(),
                                children: controller.gridItems.map((item) {
                                  return GestureDetector(
                                    onTap: () {
                                      print(item['action']);
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: const Color.fromRGBO(
                                            44, 62, 80, 1.0),
                                        borderRadius: BorderRadius.circular(8),
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Colors.black26,
                                            offset: Offset(0, 2),
                                            blurRadius: 4,
                                          ),
                                        ],
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            item['icon'],
                                            color: Colors.white,
                                            size: 30.sp,
                                          ),
                                          const SizedBox(
                                              height:
                                                  4), // Jarak antara ikon dan teks
                                          Text(
                                            item['title']!,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 2.h),
                                  child: Text(
                                    'Ringkasan Statistik',
                                    style: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.bold,
                                      color:
                                          const Color.fromRGBO(44, 62, 80, 1.0),
                                    ),
                                  ),
                                ),
                                Obx(() => Visibility(
                                      visible: controller.isStatsVisible.value,
                                      child: Table(
                                        columnWidths: const {
                                          0: FractionColumnWidth(0.25),
                                          1: FractionColumnWidth(0.25),
                                          2: FractionColumnWidth(0.25),
                                        },
                                        children: [
                                          // Header Table
                                          TableRow(
                                            children: [
                                              Container(
                                                padding: EdgeInsets.all(8
                                                    .sp), // Ubah padding menggunakan Sizer
                                                color: const Color.fromRGBO(
                                                    44, 62, 80, 1.0),
                                                child: const Text(
                                                  'Total Pendapatan',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                              Container(
                                                padding: EdgeInsets.all(8
                                                    .sp), // Ubah padding menggunakan Sizer
                                                color: const Color.fromRGBO(
                                                    44, 62, 80, 1.0),
                                                child: const Text(
                                                  'Jumlah Transaksi',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                              Container(
                                                padding: EdgeInsets.all(8
                                                    .sp), // Ubah padding menggunakan Sizer
                                                color: const Color.fromRGBO(
                                                    44, 62, 80, 1.0),
                                                child: const Text(
                                                  'Barang Terlaris',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ],
                                          ),
                                          // Data Table
                                          TableRow(
                                            children: [
                                              _buildStatColumn('Rp. 1.000.000'),
                                              _buildStatColumn('50 Transaksi'),
                                              _buildStatColumn('Laptop A'),
                                            ],
                                          ),
                                        ],
                                      ),
                                    )),
                                Obx(
                                  () => SizedBox(
                                      height: controller.isStatsVisible.value
                                          ? 2.h
                                          : 0),
                                ),
                                Obx(
                                  () => ElevatedButton(
                                    onPressed: controller.toggleStatsVisibility,
                                    style: ElevatedButton.styleFrom(
                                      foregroundColor:
                                          Colors.white, // Warna teks tombol
                                      backgroundColor: const Color.fromRGBO(
                                          44,
                                          62,
                                          80,
                                          1.0), // Warna latar belakang tombol
                                      padding: EdgeInsets.symmetric(
                                          vertical: 1.h,
                                          horizontal: 3.w), // Padding tombol
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(controller.isStatsVisible.value
                                            ? Icons.visibility_off
                                            : Icons.visibility),
                                        SizedBox(
                                            width: 1
                                                .w), // Spacer antara ikon dan teks
                                        Text(controller.isStatsVisible.value
                                            ? 'Sembunyikan Statistik'
                                            : 'Tampilkan Statistik'),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildStatColumn(String value) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment:
          CrossAxisAlignment.center, // Menjaga teks agar berada di tengah
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(8.sp), // Ubah padding menggunakan Sizer
          color: const Color.fromRGBO(44, 62, 80, .8),
          child: Text(
            value,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.sp,
            ),
            textAlign: TextAlign.center, // Memastikan teks berada di tengah
          ),
        ),
      ],
    );
  }
}
