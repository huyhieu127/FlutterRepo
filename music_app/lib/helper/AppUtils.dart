import 'package:flutter/material.dart';

class AppUtils {
  static String formatDateTime(DateTime dateTime) {
    // Hàm định dạng ngày giờ, ví dụ
    return "${dateTime.day}/${dateTime.month}/${dateTime.year} ${dateTime.hour}:${dateTime.minute}";
  }

  static void showSnackBar(BuildContext context, String message) {
    // Hàm hiển thị SnackBar, ví dụ
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

// Các hàm tiện ích khác có thể được thêm vào ở đây
}