
import 'package:Ndiulor/screen/sign_in_up_bar.dart';
import 'package:Ndiulor/screen/title.dart';
import 'package:flutter/material.dart';
import 'package:lit_firebase_auth/lit_firebase_auth.dart';

import 'decoration.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isSubmitting = context.isSubmitting();
    return SignInForm(
        child: Padding(
      padding: const EdgeInsets.all(35.0),
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: Align(
                alignment: Alignment.centerLeft,
                child: LoginTitle(title: 'Welcome\nBack')),
          ),
          Expanded(
            flex: 4,
            child: ListView(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: EmailTextFormField(
                    decoration: signInInputDecoration(hintText: 'Username'),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: PasswordTextFormField(
                    decoration: signInInputDecoration(hintText: 'Password'),
                  ),
                ),
                SignInBar(
                  isLoading: isSubmitting,
                  label: 'Sign In',
                  onPressed: () {
                    context.signInWithEmailAndPassword();
                  },
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: InkWell(
                    splashColor: Colors.redAccent,
                    child: const Text(
                      'sign up',
                      style: TextStyle(
                        fontSize: 16,
                        decoration:TextDecoration.underline,
                      )
                    )
                    
                      ),
                    ),
                    ],
                  ),
                ),
          ],
            ),
          ),
      
      );
  }
}
