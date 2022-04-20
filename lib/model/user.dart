import 'package:equatable/equatable.dart';

class MyUser extends Equatable {
  final String id;
  final String nombre;
  final String apellido;
  final String? email;

  final String? image;

  const MyUser(this.id, this.nombre, this.apellido, this.email,
      {String? this.image});

  Map<String, Object?> toFirebasemap({String? newImage}) {
    return <String, Object?>{
      'id': id,
      'nombre': nombre,
      'apellido': apellido,
      'age': email,
      'image': newImage ?? image,
    };
  }

  MyUser.fromFirebasemap(Map<String, Object?> data)
      : id = data['id'] as String,
        nombre = data['nombre'] as String,
        apellido = data['apellido'] as String,
        email = data['email'] as String?,
        image = data['image'] as String?;

  @override
  // TODO: implement props
  List<Object?> get props => [id, nombre, apellido, email, image];
}
