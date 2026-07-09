import 'package:doctor_opportunity/core/di/dependancy_injection.dart';
import 'package:doctor_opportunity/core/routing/app_router.dart';
import 'package:doctor_opportunity/doc_app.dart';
import 'package:flutter/material.dart';

void main() {
  setupGetIt();

  runApp(DocApp(appRouter: AppRouter()));
}
