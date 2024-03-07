import 'package:flutter_auth0_universal/app/injection_container.dart';
import 'package:flutter_auth0_universal/features/authentication/domain/entities/user_entity.dart';
import 'package:hive/hive.dart';

abstract class UserProfileRemoteDataSource {
  Future<UserEntity> getUserProfile();
}

class UserProfileRemoteDataSourceImpl implements UserProfileRemoteDataSource {
  @override
  Future<UserEntity> getUserProfile() async {
    final Map<String, dynamic>? map = locator<Box>().get('userMap');
    final UserEntity userEntity = UserEntity.fromMap(map!);
    return userEntity;
  }
}
