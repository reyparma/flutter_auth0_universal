import 'package:dartz/dartz.dart';
import 'package:flutter_auth0_universal/core/error/failures.dart';
import 'package:flutter_auth0_universal/features/authentication/domain/entities/user_entity.dart';
import 'package:flutter_auth0_universal/features/user_profile/domain/repositories/user_profile_repository.dart';

class GetUserProfileUseCase {
  final UserProfileRepository repository;

  const GetUserProfileUseCase({required this.repository});

  Future<Either<Failure, UserEntity>> call() {
    return repository.getUserProfile();
  }
}
