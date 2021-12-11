import 'package:code_buddy/screen/atom/signin_button.dart';
import 'package:code_buddy/service/signin/github_signin_service.dart';
import 'package:code_buddy/service/signin/google_signin_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  UserCredential? _userCredential;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        body: Center(
          child: IntrinsicWidth(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const FlutterLogo(style: FlutterLogoStyle.stacked, size: 150),
                SignInButton(
                    primaryButtonColor: Colors.white,
                    onPressedAction: signInWithGoogle,
                    logoPath: 'assets/images/logos/google_logo.png',
                    buttonText: "Sign in with Google"
                ),
                const SizedBox(height: 5),
                SignInButton(
                  primaryButtonColor: Colors.black,
                  onPressedAction: signInWithGithub,
                  logoPath: 'assets/images/logos/github_logo_alternative.png',
                  buttonText: "Sign in with Github",
                  buttonTextColor: Colors.white,
                )
              ],
            ),
          ),
        ));
  }

  signInWithGoogle() async {
    await signOutIfAnyUserExists();

    final googleSignInService = GoogleSignInService();
    _userCredential = await googleSignInService.signInWithGoogle();
  }

  signInWithGithub() async {
    await signOutIfAnyUserExists();

    final githubSignInService = GithubSignInService(context);
    _userCredential = await githubSignInService.signInWithGitHub();
  }

  signOutIfAnyUserExists() async {
    final User? user = _auth.currentUser;
    if (user != null) {
      await _auth.signOut();
    }
  }
}
