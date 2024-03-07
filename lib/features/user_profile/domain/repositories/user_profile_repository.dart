import 'package:dartz/dartz.dart';
import 'package:flutter_auth0_universal/core/error/failures.dart';
import 'package:flutter_auth0_universal/features/authentication/domain/entities/user_entity.dart';

abstract class UserProfileRepository {
  Future<Either<Failure, UserEntity>> getUserProfile();
}
