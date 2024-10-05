import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final List<Map<String, dynamic>> gridItems = [
    {
      "title": "Transaksi Baru",
      "action": "Transaksi Baru diklik",
      "icon": Icons.add, // Menambahkan ikon
    },
    {
      "title": "Tambah Barang",
      "action": "Tambah Barang diklik",
      "icon": Icons.add_box, // Menambahkan ikon
    },
    {
      "title": "Import Data",
      "action": "Import Data diklik",
      "icon": Icons.file_upload, // Menambahkan ikon
    },
    {
      "title": "Statistik Penjualan",
      "action": "Statistik Penjualan diklik",
      "icon": Icons.bar_chart, // Menambahkan ikon
    },
  ];
  var isStatsVisible = false.obs; // Mengontrol visibilitas konten statistik

  // Fungsi untuk toggle visibilitas konten statistik
  void toggleStatsVisibility() {
    isStatsVisible.value = !isStatsVisible.value;
  }

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
}
