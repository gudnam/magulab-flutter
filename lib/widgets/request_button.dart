import 'package:flutter/material.dart';
import 'package:magulab_flutter/pages/register/register.dart';

class RequestButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: double.infinity,
      buttonColor: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(5.0),
      ),
      child: RaisedButton(
        textColor: Colors.white,
        padding: EdgeInsets.fromLTRB(14, 10, 14, 10),
        child: Text('요청하기', style: TextStyle(fontSize: 14)),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => RegisterPage()),
        ),
      ),
    );
  }
}
