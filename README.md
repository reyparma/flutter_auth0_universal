# flutter_auth0_universal
This Flutter application runs on IOS, Android and Web.  It is written based on clean architecture and uses Auth0 for authentication, BloC for state management and Go_Router for navigation.

Before running this app, make sure you have configured an Auth0 application and created a user on the Auth0 dashboard with your account. You can find instructions in my article [Flutter Web Authentication Using Auth0, BloC and Go_Router](https://medium.com/@reyparma_53717/flutter-web-authentication-using-auth0-bloc-and-go-router-62d7ebc91e7a).

# Additional Auth0 Setup for Mobile
IMPORTANT: In the Auth0 dashboard, make sure to add the following entries in the Default App's Allowed Callback and Logout URLs for Android and IOS:

For Android: android://<AUTH0_DOMAIN>/android/com.example.flutter_auth0_universal/callback

For IOS: com.example.flutterAuth0Universal://<AUTH0_DOMAIN>/ios/com.example.flutterAuth0Universal/callback

Reference: ([Auth0 Application Allowed Callback and Logout URLs)](https://github.com/auth0-samples/auth0-flutter-samples/tree/main/sample)

<img width="650" alt="universal_login" src="https://github.com/reyparma/flutter_auth0_universal/assets/5339530/669426be-d8c1-4430-bcaf-5ce2b7d9b085">

<img width="650" alt="universal_user_profile" src="https://github.com/reyparma/flutter_auth0_universal/assets/5339530/6ca92ff4-1e1b-4cf3-a74c-e5e3d98ab983">
