import 'package:code_buddy/core/context/localization/resource/languages.dart';
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
                Text(Languages.of(context)!.logIn,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontWeight: FontWeight.bold)
                ),
                const SizedBox(height: 15),
                SignInButton(
                    primaryButtonColor: Colors.white,
                    onPressedAction: signInWithGoogle,
                    logoPath: 'assets/images/logos/google_logo.png',
                    buttonText: Languages.of(context)!.signInWithGoogle),
                const SizedBox(height: 5),
                SignInButton(
                  primaryButtonColor: Colors.black,
                  onPressedAction: signInWithGithub,
                  logoPath: 'assets/images/logos/github_logo_alternative.png',
                  buttonText: Languages.of(context)!.signInWithGithub,
                  buttonTextColor: Colors.white,
                ),
                const SizedBox(height: 15),
                Text(Languages.of(context)!.register,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontWeight: FontWeight.bold)
                ),
                const SizedBox(height: 15),
                SignInButton(
                    primaryButtonColor: Colors.white,
                    onPressedAction: () {
                      // Will be implemented
                    },
                    logoPath: 'assets/images/logos/google_logo.png',
                    buttonText: Languages.of(context)!.signUpWithGoogle),
                const SizedBox(height: 5),
                SignInButton(
                  primaryButtonColor: Colors.black,
                  onPressedAction: () {
                    // Will be implemented
                  },
                  logoPath: 'assets/images/logos/github_logo_alternative.png',
                  buttonText: Languages.of(context)!.signUpWithGithub,
                  buttonTextColor: Colors.white,
                ),
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
