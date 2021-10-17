
import 'package:Ndiulor/screen/decoration.dart';
import 'package:Ndiulor/screen/sign_in_up_bar.dart';
import 'package:Ndiulor/screen/title.dart';
import 'package:flutter/material.dart';
import 'package:lit_firebase_auth/lit_firebase_auth.dart';

class Register extends StatelessWidget {
  const Register({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isSubmitting = context.isSubmitting();
    return SignInForm(
        child: Padding(
      padding: const EdgeInsets.all(35.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Expanded(
            flex: 3,
            child: Align(
                alignment: Alignment.centerLeft,
                child: LoginTitle(
                  title: 'Create\nAccount',
                )),
          ),
          Expanded(
            flex: 4,
            child: ListView(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: EmailTextFormField(
                    decoration: registerInputDecoration(hintText: 'Username'),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: PasswordTextFormField(
                    decoration: registerInputDecoration(hintText: 'Password'),
                  ),
                ),
                SignUpBar(
                  isLoading: isSubmitting,
                  label: 'Sign Up',
                  onPressed: () {
                    context.registerWithEmailAndPassword();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
