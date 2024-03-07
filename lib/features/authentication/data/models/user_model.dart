import 'package:flutter_auth0_universal/features/authentication/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel(
      {String? email,
      bool? isEmailVerified,
      String? name,
      String? nickname,
      String? pictureUrl,
      DateTime? updatedAt})
      : super(
            email: email,
            isEmailVerified: isEmailVerified,
            name: name,
            nickname: nickname,
            pictureUrl: pictureUrl,
            updatedAt: updatedAt);

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserEntity.fromMap(map) as UserModel;
  }

  factory UserModel.fromEntity(UserEntity entity) {
    return UserModel(
      email: entity.email,
      name: entity.name,
    );
  }
}
