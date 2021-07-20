import 'package:flutter/material.dart';
import 'package:test_app_surf/authorization/UI/authDialog/components/EmailTxtField.dart';
import 'package:test_app_surf/authorization/UI/authDialog/components/PasswordTextField.dart';
import 'package:test_app_surf/authorization/UI/authDialog/components/TextButton.dart';

class AuthorizationDialog extends StatelessWidget {
  const AuthorizationDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      // TODO: color of elevation in RGBO(2, 28, 96, 0.2)
      insetPadding: EdgeInsets.symmetric(horizontal: 24.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16.0)),
      ),
      child: Center(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.52,
          alignment: Alignment.center,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 50.0, vertical: 60.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                EmailTextField(),
                SizedBox(height: MediaQuery.of(context).size.height / 20),
                PasswordTextField(),
                SizedBox(height: MediaQuery.of(context).size.height / 12),
                CustomTextButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
