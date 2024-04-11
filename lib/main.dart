import 'package:flutter/material.dart';
import 'package:nreport/pages/Entrance/homePage.dart';
import 'package:pdf/pdf.dart';
import 'miscelanius/file_handle_api_android.dart';
import 'pages/MobileVersion/pdfFormatter_Mobile.dart';
import 'package:pdf/widgets.dart' as pw;

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NReport',
      home: ReportCreate(),
    );
  }
}