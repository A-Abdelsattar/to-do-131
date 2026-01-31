import 'package:hive_flutter/hive_flutter.dart';

part 'user_model.g.dart';


@HiveType(typeId: 0)
class UserModel{
  @HiveField(0)
  String image;
  @HiveField(1)
  String name;

  UserModel({required this.image, required this.name});
}