import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:auth0_flutter/auth0_flutter_web.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_auth0_universal/core/error/exceptions.dart';
import 'package:flutter_auth0_universal/features/authentication/data/models/credentials_model.dart';
import 'package:flutter_auth0_universal/features/authentication/data/models/user_model.dart';

abstract class AuthenticationRemoteDataSource {
  Future<CredentialsModel> logIn();
  Future<void> logOut();
}

class AuthenticationRemoteDataSourceImpl
    implements AuthenticationRemoteDataSource {
  late Auth0Web auth0Web;
  late Auth0 auth0;

  AuthenticationRemoteDataSourceImpl() {
    auth0 = Auth0(dotenv.env['AUTH0_DOMAIN']!, dotenv.env['AUTH0_CLIENT_ID']!);
    auth0Web =
        Auth0Web(dotenv.env['AUTH0_DOMAIN']!, dotenv.env['AUTH0_CLIENT_ID']!);

    if (kIsWeb) {
      // Install required callback
      auth0Web.onLoad().then((credentials) {
        print(credentials);
        // Do nothing
      });
    }
  }

  @override
  Future<CredentialsModel> logIn() async {
    try {
      Credentials? credentials;

      if (kIsWeb) {
        credentials = await auth0Web.loginWithPopup();
      } else {
        credentials = await auth0
            .webAuthentication()
            .login(
                // Even with these settings, login popup still shows on logout in IOS
                useEphemeralSession: true,
                parameters: {
                  'prompt': 'login'
                }
                );
      }
      final userModel = UserModel(
          email: credentials.user.email,
          name: credentials.user.name,
          isEmailVerified: credentials.user.isEmailVerified,
          pictureUrl: credentials.user.pictureUrl.toString(),
          updatedAt: credentials.user.updatedAt,
          nickname: credentials.user.nickname);

      final credentialsModel = CredentialsModel(
          idToken: credentials.idToken,
          accessToken: credentials.accessToken,
          userModel: userModel);
      return credentialsModel;
    } on Exception catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<void> logOut() async {
    try {
      if (kIsWeb) {
        await auth0Web.logout(returnToUrl: 'http://localhost:3000');
      } else {
        await auth0
            //.webAuthentication(scheme: dotenv.env['AUTH0_CUSTOM_SCHEME'])
            .webAuthentication(scheme: 'https')
            .logout();
      }
    } on Exception catch (e) {
      throw ServerException(e.toString());
    }
  }
}
