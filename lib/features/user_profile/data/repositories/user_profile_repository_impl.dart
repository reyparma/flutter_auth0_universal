import 'package:dartz/dartz.dart';
import 'package:flutter_auth0_universal/core/error/failures.dart';
import 'package:flutter_auth0_universal/features/authentication/domain/entities/user_entity.dart';
import 'package:flutter_auth0_universal/features/user_profile/data/datasources/user_profile_remote_datasource.dart';
import 'package:flutter_auth0_universal/features/user_profile/domain/repositories/user_profile_repository.dart';

class UserProfileRepositoryImpl implements UserProfileRepository {
  final UserProfileRemoteDataSource userProfileRemoteDataSource;

  UserProfileRepositoryImpl({required this.userProfileRemoteDataSource});

  @override
  Future<Either<Failure, UserEntity>> getUserProfile() async {
    try {
      final UserEntity userEntity =
          await userProfileRemoteDataSource.getUserProfile();
      return Right(userEntity);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
