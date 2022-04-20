import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:pass_/model/user.dart';

import 'package:path/path.dart' as path;

class FirebaseProvider {
  User get currentUser {
    final user =
        FirebaseAuth.instance.currentUser; //si el usuario inicio secion
    if (user == null) throw Exception('Not authenticated exception');
    return user;
  }

  FirebaseFirestore get firestore => FirebaseFirestore.instance;

  FirebaseStorage get storage => FirebaseStorage.instance;

  //funcion para leer la base de datos
  Future<MyUser?> getMyUser() async {
    //puede regresar usuario o regresar null
    final snapshot = await firestore
        .doc('user/${currentUser.uid}')
        .get(); //leemos el documento en la ruta
    if (snapshot.exists) {
      return MyUser.fromFirebasemap(snapshot.data()!);
    } //le enviamos la data
    return null;
  }

  //funcion para escribir en la base de datos
  Future<void> saveMyUser(MyUser user, File? image) async {
    final ref = firestore.doc('user/${currentUser.uid}');
    if (image != null) {
      final imagePath = '${currentUser.uid}/profile/${path.basename}';
      final storageRef = storage.ref(imagePath);
      await storageRef.putFile(image);
      final url = await storageRef.getDownloadURL();
      await ref.set(user.toFirebasemap(newImage: url),
          SetOptions(merge: true)); //guardamos el usuario con la imagen
    } else {
      await ref.set(user.toFirebasemap(),
          SetOptions(merge: true)); //guardamos el usuario sin imagen
    }
  }
}
