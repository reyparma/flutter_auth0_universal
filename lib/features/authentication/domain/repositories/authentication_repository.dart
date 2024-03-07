import 'package:dartz/dartz.dart';
import 'package:flutter_auth0_universal/core/error/failures.dart';
import 'package:flutter_auth0_universal/features/authentication/domain/entities/credentials_entity.dart';

abstract class AuthenticationRepository {
  Future<Either<Failure, CredentialsEntity>> logIn();
  Future<Either<Failure, Unit>> logOut();
}
