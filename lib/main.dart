import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pass_/app.dart';
import 'package:pass_/repository/auth_repository.dart';
import 'package:pass_/repository/implementations/auth_repository.dart';
import 'package:pass_/repository/implementations/my_user_repository.dart';
import 'package:pass_/repository/my_user_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put<AuthRepository>(AuthRepositoryImp());
  Get.put<MyUserRepository>(MyUserRepositoryImp());

  runApp(MyApp());
}
