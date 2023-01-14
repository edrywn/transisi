import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:transisi/app/utilities/theme.dart';

import 'child/form_login.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  static const routeName = 'loginPage';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        child: Padding(
          padding: defaultPadding,
          child: FormLogin(),
        ),
      )),
    );
  }
}
