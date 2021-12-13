import 'package:code_buddy/core/context/localization/resource/languages.dart';
import 'package:code_buddy/widget/atom/profile_picture.dart';
import 'package:code_buddy/widget/atom/tag_list.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterUser extends StatefulWidget {
  final User? user;

  const RegisterUser({Key? key, this.user}) : super(key: key);

  @override
  _RegisterUserState createState() => _RegisterUserState();
}

class _RegisterUserState extends State<RegisterUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(Languages.of(context)!.register)),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 15),
            ProfilePicture(
                imagePath: widget.user?.photoURL ?? '', onClicked: () {}),
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 10, bottom: 5),
              child: TextFormField(
                decoration: InputDecoration(
                    hintText: Languages.of(context)!.enterYourName),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 10, bottom: 5),
              child: TextFormField(
                decoration: InputDecoration(
                    hintText: Languages.of(context)!.enterYourLastName),
              ),
            ),
            //TagList()
          ],
        ),
      ),
    );
  }
}
