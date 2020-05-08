import 'package:flutter/material.dart';
import 'package:magulab_flutter/styles.dart';

class RegisterTextButton extends StatelessWidget {
  final double width = 50;
  final String text;

  RegisterTextButton(this.text);

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: width,
      child: FlatButton(
        padding: const EdgeInsets.fromLTRB(16, 19, 16, 19),
        child: Text(
          text,
          style: Styles.questionPageDefaultItem,
        ),
        onPressed: () {},
      ),
    );
  }
}
