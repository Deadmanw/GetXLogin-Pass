import 'dart:io';

import 'package:pass_/model/user.dart';
import 'package:pass_/repository/my_user_repository.dart';
import 'package:pass_/repository/providers/firebase_provider.dart';

class MyUserRepositoryImp extends MyUserRepository {
  final provider = FirebaseProvider();

  @override
  Future<MyUser?> getMyUser() => provider.getMyUser();

  @override
  Future<void> saveMyUser(MyUser user, File? image) =>
      provider.saveMyUser(user, image);
}
