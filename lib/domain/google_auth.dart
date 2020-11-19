import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuth {
  final GoogleSignIn google = GoogleSignIn();


  signInToCreateAccout() async => await google.signIn();



  signOutUserAccout() async => await google.signOut();



  Future onUserChangeAccoutListner() async {
    List userAccoutDetails = [];
    await google.onCurrentUserChanged.listen((accout) {
      return handleSigninUser(accout);
    });
  }


  Future onUserslientlyLogin() async {
    List userSlientlyLogInDetails = [];
    await google.signInSilently().then((accout) {
      return handleSigninUser(accout);
    });
  }


  List handleSigninUser(GoogleSignInAccount accout) {
    if (accout != null)
      return [true, accout];
    else
      return [false, accout];
  }


}

final $gfun = GoogleAuth();
