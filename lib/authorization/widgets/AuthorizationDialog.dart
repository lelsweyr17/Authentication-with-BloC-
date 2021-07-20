import 'package:flutter/material.dart';

class AuthorizationDialog extends StatelessWidget {
  const AuthorizationDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.all(30.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
      child: Center(
        child: Container(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 20),
                TextField(
                  cursorColor: Theme.of(context).accentColor,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Пароль',
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 20),
                SizedBox(
                  width: double.infinity,
                  height: 40.0,
                  child: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Colors.orange, Colors.red]),
                          shape: BoxShape.rectangle,
                          borderRadius:
                              BorderRadius.all(Radius.circular(20.0))),
                      child: TextButton(
                          onPressed: () {},
                          child: Text('Войти',
                              style: TextStyle(color: Colors.white)))),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
